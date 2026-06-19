package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Order;
import bean.Uniform;
import dao.OrderDAO;
import dao.UniformDAO;

@WebServlet("/insertCart")
public class InsertCart {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			int orderno = (int)request.getAttribute("orderno");
			int unino = (int)request.getAttribute("unino");
			OrderDAO OrderDaoObj = new OrderDAO();
			UniformDAO UniDaoObj = new UniformDAO();
			Order order = OrderDaoObj.selectByOrder(orderno);
			request.setAttribute("order",order);
		    Uniform uni = UniDaoObj.selectByunino(unino);
			request.setAttribute("unino",unino);
			
			request.getRequestDispatcher("/view/insertCart.jsp").forward(request, response);
			
		} catch(IllegalStateException e) {
			System.out.println(e);
			error = "DB接続エラー";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
