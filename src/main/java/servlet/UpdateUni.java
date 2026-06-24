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

@WebServlet("/updateUni")
@MultipartConfig
public class UpdateUni extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

			//各値を受け取る
			int unino = Integer.parseInt(request.getParameter("unino"));
			String uniname = request.getParameter("uniname");
			String priceAsString = request.getParameter("price");
			String stockAsString = request.getParameter("stock");

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

				//エラー処理
				//タイトルが未入力かどうか判断するエラー処理
				if(uniname == null || uniname.trim().equals("")) {
					error = "商品名が未入力のため、変更できませんでした。";
					cmd = "omenu";
					return;			
					//タイトルが入力されていた時
				}else {
					uniname = uniname.trim();
				}

				//価格が未入力かどうか判断するエラー処理
				if(priceAsString == null || priceAsString.trim().equals("")) {
					error = "価格が未入力のため、変更できませんでした。";
					cmd = "omenu";
					return;			
					//価格が入力されていた時
				}else {
					priceAsString = priceAsString.trim();
				}

				//在庫が未入力かどうか判断するエラー処理
				if(stockAsString == null || stockAsString.trim().equals("")) {
					error = "価格が未入力のため、変更できませんでした。";
					cmd = "omenu";
					return;			
					//価格が入力されていた時
				}else {
					stockAsString = stockAsString.trim();
				}

				//エラーがない場合
				int price = Integer.parseInt(priceAsString);
				int stock = Integer.parseInt(stockAsString);

				//各変数に値を代入
				uni.setUnino(unino);
				uni.setUniname(uniname);
				uni.setPrice(price);
				uni.setStock(stock);
				uni.setImage(file_name.getName());

			}else {
				error = "ファイルがないため、変更できませんでした。";
				cmd= "omenu";
				return;
			}

			//insertを使ってDBに登録する
			uniDao.update(uni);

		}catch(IllegalStateException e) {
			error = "DB接続エラーのため、変更できませんでした。";
			cmd = "omenu";
		}catch(NumberFormatException e){
			error = "値が不正のため、変更できませんでした。";
			cmd = "omenu";
		}catch(Exception e){
			error = "予期せぬエラーが発生しました<br>" + e;
			cmd = "omenu";
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
