package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import bean.Uniform;
import dao.UniformDAO;

@WebServlet("/insertUni")
@MultipartConfig
public class InsertUni extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException{

		//エンコーディングしたときの言語の設定をUTF-8にする
		request.setCharacterEncoding("UTF-8");

		//エラー処理用の変数の宣言と初期化
		String error = "";
		String cmd = "";

		try {
			//変数を置くためのコンストラクタと
			//メソッドを置くためのオブジェクトを生成する
			Uniform uni = new Uniform();
			UniformDAO uniDao = new UniformDAO();

			//登録用の情報を受け取る
			String uniname = request.getParameter("uniname");
			String price = request.getParameter("price");
			String stock = request.getParameter("stock");

			//写真用の情報を受け取る
			Part filePart = request.getPart("image");
			String uploadDir = "";
			String filePath = "";

			//ファイルサイズを元にファイルの有無を確認
			if (filePart.getSize() != 0) {
				String contentDisposition = filePart.getHeader("content-disposition");
				String fileName = "";
				Pattern pattern = Pattern.compile("filename=\"(.*)\"");
				Matcher matcher = pattern.matcher(contentDisposition);
				//抽出したファイル名が存在していれば抽出、なければ空白
				if (matcher.find()) {
					fileName = matcher.group(1);					
				}else {
					fileName = "";
				}

				File file_name = new File(fileName);

				// ファイル保存先のディレクトリ
				uploadDir = getServletContext().getRealPath("/file").replace("\\", "/");
				//アップロード先のフォルダがなければ作成
				File uploadDirectory = new File(uploadDir);
				if (!uploadDirectory.exists()) {
					uploadDirectory.mkdirs();
				}

				// ファイルを指定されたディレクトリに保存
				// （具体的には以下の階層に保存される）
				// C:\ usr\kis_java_pkg_2023\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps 
				filePath = uploadDir + "/" + file_name.getName();
				try (InputStream inputStream = filePart.getInputStream()) {
					Files.copy(inputStream, new File(filePath).toPath(),StandardCopyOption.REPLACE_EXISTING);
				}

				//85~104行で各種エラー処理	
				//商品名が未入力
				if(uniname.equals("") || uniname.trim().equals("")){
					error = "商品名が未入力の為、商品登録は行えませんでした。";
					cmd = "nameNull";
					return;
				}

				//価格が未入力
				if(request.getParameter("price") == "" ) {
					error = "価格が未入力の為、商品登録は行えませんでした。";
					cmd = "priceNull";
					return;
				}

				//在庫数が未入力
				if(request.getParameter("stock") == ""){
					error = "在庫数が未入力の為、商品登録は行えませんでした。";
					cmd = "stockNull";
					return;
				}

				//エラー無し正常処理
				//各変数に値を代入
				uni.setUniname(uniname);
				uni.setPrice(Integer.parseInt(price));
				uni.setStock(Integer.parseInt(stock));
				uni.setImage(file_name.getName());

			}else {
				error = "ファイルがありません";
				cmd= "fileNull";
				return;
			}

			//DBに登録するメソッド
			uniDao.insert(uni);

		}catch(IllegalStateException e) {
			error = "DB接続エラーの為、登録できませんでした。";
			cmd = "dbError";
		}catch(NumberFormatException e) {
			error = "価格の値が不正の為、登録処理は行えませんでした。";
			cmd = "priceFail";
		}finally {
			if(error == null || error.trim().equals("")) {
				request.getRequestDispatcher("/view/menuOwner.jsp").forward(request, response);
			}else {
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}

		}
	}
}
