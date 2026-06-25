package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Order;
import dao.OrderDAO;


@WebServlet("/showOrderedItemOwner")
public class ShowOrderedItemOwner extends HttpServlet {
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
			
			//メソッドを利用しデータベースからオーダー情報を取得
			ArrayList<Order> list = orderDao.selectAll();

			//取得したオーダー情報をリクエストスコープに格納
			request.setAttribute("orderList", list);

		}catch(IllegalStateException e) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			cmd = "dbError";
		}finally {
			if(error == null || error.trim().equals("")) 
			{
				//注文画面（管理者）にフォワード
				request.getRequestDispatcher("/view/showOrderedItemOwner.jsp").forward(request, response);	
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
