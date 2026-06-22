package servlet;

import java.io.IOException;
import java.nio.file.Paths;

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
		
		//エラー処理用の変数の宣言と初期化
		String error = "";
		String cmd = "";
		
		try {
			
			//エンコーディングしたときの言語の設定をUTF-8にする
			request.setCharacterEncoding("UTF-8");
			
			//変数を置くためのコンストラクタと
			//メソッドを置くためのオブジェクトを生成する
			Uniform uni = new Uniform();
			UniformDAO uniDao = new UniformDAO();
			
			//各値を受け取る
			String uniname = request.getParameter("uniname");
			String image = request.getParameter("pict");
			
			//name属性がpictのファイルをPartオブジェクトとして取得
			Part part=request.getPart("pict");
			
			//ファイル名を取得
			//String filename=part.getSubmittedFileName();//ie対応が不要な場合
			String filename=Paths.get(part.getSubmittedFileName()).getFileName().toString();
			//アップロードするフォルダ
			String path=getServletContext().getRealPath("/upload");
			//実際にファイルが保存されるパス確認
			System.out.println(path);
			
		//エラー処理
				
			//商品名が未入力
			if(uniname.equals("")){
				error = "商品名が未入力の為、商品登録は行えませんでした。";
				
			//価格が未入力
			}else if(request.getParameter("price") == "") {
				error = "価格が未入力の為、商品登録は行えませんでした。";
				
			//在庫数が未入力
			}else if(request.getParameter("stock") == ""){
				error = "在庫数が未入力の為、商品登録は行えませんでした。";
			
			//商品画像が未挿入
			}else if(filename.equals("")) {
				error  = "商品画像が未挿入のため、商品登録は行えませんでした。";
				
			//エラーがない場合
			}else {
				
				//各変数に値を代入
				uni.setUniname(uniname);
				uni.setPrice(Integer.parseInt(request.getParameter("price")));
				uni.setStock(Integer.parseInt(request.getParameter("stock")));
				uni.setImage(filename);
				
				//insertを使って、DBに登録する
				uniDao.insert(uni);
			}
			
		}catch(IllegalStateException e) {
			
			error = "DB接続エラーの為、商品登録は行えませんでした。";
			
		//int型のところに文字列等をいれた場合
		}catch(NumberFormatException e){
			
			error = "値が不正の為、商品登録は行えませんでした。";
			
		}catch(Exception e){
			
			error = "予期せぬエラーが発生しました。<br>" + e;
			
		}finally {
			
			//errorをリクエストスコープに設定する
			request.setAttribute("error", error);
			
			if(error.equals("")) {
				
				//エラーがない場合、listUniOwner.jspにフォワードする
				request.getRequestDispatcher("/listUni").forward(request, response);
				
}else {
				
				//エラーがある場合、error.jspにフォワードする
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}
}
