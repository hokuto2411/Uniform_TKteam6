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

@WebServlet("/salesConfirmationOwner")
public class SalesConfirmationOwner extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			OrderDAO OrderDaoObj = new OrderDAO();
			ArrayList<Order> order_list = OrderDaoObj.selectAll();
			
			int lastmonth = OrderDaoObj.getLastMonth();
			request.setAttribute("lastmonth",lastmonth);
			
			request.setAttribute("order_list",order_list);
			
			request.getRequestDispatcher("/view/salesConfirmationOwner.jsp").forward(request, response);
			
		} catch(IllegalStateException e) {
			System.out.println(e);
			e.printStackTrace(); 
			error = "DB接続エラー";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
