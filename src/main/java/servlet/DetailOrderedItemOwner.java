package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.OrderDetail;
import dao.OrderDetailDAO;

@WebServlet("/detailOrderedItemOwner")
public class DetailOrderedItemOwner extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException ,IOException{
		
		String error = "";
		String cmd = "";
		
		try {
			
			int orderno = Integer.parseInt(request.getParameter("orderno"));
			OrderDetailDAO detailDao = new OrderDetailDAO();
			ArrayList<OrderDetail> detail_list = detailDao.selectByOrder(orderno);
			
			request.setAttribute("detail_list", detail_list);
			
			

		}catch(IllegalStateException e) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			cmd = "dbError";
		}finally {
			if(error == null || error.trim().equals("")) 
			{
				//注文詳細画面（管理者）にフォワード
				request.getRequestDispatcher("/view/detailOrderedItemOwner.jsp").forward(request, response);	
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
