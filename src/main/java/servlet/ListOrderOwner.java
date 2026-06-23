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

@WebServlet("/listOrderOwner")
public class ListOrderOwner extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			OrderDAO OrderDaoObj = new OrderDAO();
			ArrayList<Order> list = OrderDaoObj.selectAll();
			request.setAttribute("order_list",list);
			
			int lastmonth = OrderDaoObj.getLastMonth();
			request.setAttribute("lastmonth",lastmonth);
			
			int sales = 0;
			for(int i=0; i < list.size(); i++) {
				sales += list.get(i).getSumprice();
			}
			request.setAttribute("sales",sales);
			
			request.getRequestDispatcher("/view/listOrderOwner.jsp").forward(request, response);
			
		} catch(IllegalStateException e) {
			System.out.println(e);
			error = "DB接続エラー";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
