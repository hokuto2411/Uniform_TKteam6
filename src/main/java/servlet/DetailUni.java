package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Uniform;
import dao.UniformDAO;

@WebServlet("/detailUni")
public class DetailUni extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException ,IOException{

		request.setCharacterEncoding("UTF-8");

		//エラーを管理する変数
		String error = "";
		String cmd = "";
		
		//ユーザー・管理者切り替えコマンド
		String cmdSwitch = null;

		try {
			UniformDAO uniDao = new UniformDAO();

			//画面からの入力情報の受け取り
			String uninoAsString = request.getParameter("unino");
			int unino = Integer.parseInt(uninoAsString);
			//画面から切り替え先の受け取り
			cmdSwitch = request.getParameter("cmdSwitch");

			//メソッドを利用してユニフォーム情報を取得
			Uniform uniInfo = uniDao.selectByUnino(unino);
			
			//追加
			if(uniInfo.getStock()<=0) {
				
				error="売り切れの為、購入できません。";
				request.setAttribute("error", error);
				request.setAttribute("cmd", "menu");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
			
			
			//取得したユニフォーム情報をリクエストスコープに登録
			request.setAttribute("uniInfo", uniInfo);
			
		}catch(IllegalStateException e) {
				error = "DB接続エラーのため、商品詳細は表示できませんでした。";
				cmd = "menu";

		}catch(Exception e){
			error = "予期せぬエラーが発生しました。<br>" + e;
			cmd = "menu";
		}finally {
			if(error == null || error.trim().equals("")) {
				if(cmdSwitch == null || cmdSwitch.trim().equals("")) {
					//詳細画面（ユーザー）にフォワード
					request.getRequestDispatcher("/view/detailUni.jsp").forward(request, response);
				}
				else if(cmdSwitch.equals("owner")) {
					//詳細画面（管理者）にフォワード
					request.getRequestDispatcher("/view/detailUniOwner.jsp").forward(request, response);
				}
				else if(cmdSwitch.equals("update")) {
					request.getRequestDispatcher("/view/updateUniOwner.jsp").forward(request, response);
				}
			}else {
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}

		}
	}
}
