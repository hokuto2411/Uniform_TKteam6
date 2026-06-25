package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Order;
import dao.OrderDAO;


@WebServlet("/updateSendOwner")
public class UpdateSendOwner extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException ,IOException{

		//文字エンコード
		request.setCharacterEncoding("UTF-8");

		//エラー処理を管理する変数
		String error = null;
		String cmd = null;

		try {	
			//オーダー情報管理を管理するクラスのインスタンス化
			OrderDAO orderDao = new OrderDAO();
			
			//リンクからの情報を取得
			int send = Integer.parseInt(request.getParameter("send"));
			int orderno = Integer.parseInt(request.getParameter("orderno"));
		
			//該当オーダー情報を取得
			Order order = orderDao.selectByOrder(orderno);
					
			order.setSend(send);
			
			//insertメソッドを使ってDBに登録する
			orderDao.update(order);

		}catch(IllegalStateException e) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			cmd = "dbError";
		}finally {
			if(error == null || error.trim().equals("")) 
			{
				//注文画面（管理者）にフォワード
				request.getRequestDispatcher("/view/sendComplete.jsp").forward(request, response);	
			}
			else 
			{
				//エラー画面にフォワード
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}

}
