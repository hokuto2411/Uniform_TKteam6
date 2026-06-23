package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Uniform;
import dao.UniformDAO;


@WebServlet("/listUni")
public class ListUni extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException ,IOException{

		//文字エンコード
		request.setCharacterEncoding("UTF-8");

		//エラー処理を管理する変数
		String error = null;
		String cmd = null;
		
		//ユーザー・管理者切り替えコマンド
		String cmdSwitch = null;

		try {	
			//ユニフォーム情報管理を管理するクラスのインスタンス化
			UniformDAO uniDao = new UniformDAO();
			
			//画面から切り替え先の受け取り
			cmdSwitch = request.getParameter("cmdSwitch");

			//メソッドを利用しデータベースから書籍情報を取得
			ArrayList<Uniform> list = uniDao.selectAll();

			//取得したユニフォーム情報をリクエストスコープに格納
			request.setAttribute("uniList", list);

		}catch(IllegalStateException e) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			cmd = "dbError";
		}finally {
			if(error == null || error.trim().equals("")) {
				if(cmdSwitch == null || cmdSwitch.trim().equals("")) {
					//一覧画面（ユーザー）にフォワード
					request.getRequestDispatcher("/view/listUni.jsp").forward(request, response);
				}		
				else if(cmdSwitch.equals("owner")) {
					//一覧画面（管理者）にフォワード
					request.getRequestDispatcher("/view/listUniOwner.jsp").forward(request, response);
				}
			}else {
				//エラー画面にフォワード
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}

}

