package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Order;
import bean.OrderDetail;
import bean.User;

@WebServlet("/insertCart")
public class InsertCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			request.setCharacterEncoding("UTF-8");
			int unino = Integer.parseInt(request.getParameter("unino"));
			
			Order order = new Order();
			order.setUserno(user.getUserno());
			
			OrderDetail orderD = new OrderDetail();
			orderD.setUnino(unino);		    
			
			ArrayList<Order> order_list = (ArrayList<Order>)session.getAttribute("order_list");
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if(order_list == null){
				order_list = new ArrayList<Order>();
			}
			order_list.add(order);
			session.setAttribute("order_list",order_list);
			session.setAttribute("detail_list",detail_list);
			
			
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
