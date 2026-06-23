package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.OrderDetail;
import bean.User;
import dao.OrderDetailDAO;

@WebServlet("/showCart")
public class ShowCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			
			// Orderを表示する
			// Orderno, U.uniname, OD.quantity, (U.price x OD.quan.)
			
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user == null) {
				error = "セッション切れの為、購入は出来ません。 ";
				request.setAttribute("error",error);
				request.setAttribute("cmd","logout");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
			
			OrderDetailDAO DetailDaoObj = new OrderDetailDAO();
			ArrayList<OrderDetail> detail_list = DetailDaoObj.selectAll();
			
			String delunino = request.getParameter("delunino");
			if(delunino != null) {
				detail_list.remove(Integer.parseInt(delunino));
			}
						
			request.setAttribute("detail_list",detail_list);
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
