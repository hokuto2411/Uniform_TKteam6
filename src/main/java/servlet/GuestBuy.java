package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.User;
import dao.UserDAO;


@WebServlet("/guestBuy")
public class GuestBuy extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String error="";
		
		try {
			HttpSession session = request.getSession();
			UserDAO userdao =new UserDAO();
			
			
			User user=(User)session.getAttribute("user");
			user.setUsername(request.getParameter("username"));
			user.setAddress(request.getParameter("address"));
			user.setMailaddress(request.getParameter("mailaddress"));
			
			userdao.guestUserUpdate(user);
			session.setAttribute("user", user);
			
			request.getRequestDispatcher("/view/buyConfirm.jsp").forward(request, response);
			return;
		}catch(IllegalStateException e) {
			System.out.println(e);
			error = "DB接続エラーのため、カートを表示できませんでした。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);

		}catch(Exception e){
			error = "予期せぬエラーが発生しました。<br>" + e;
			request.setAttribute("error",error);
			request.setAttribute("cmd","menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}finally {
			
		}
		
		
	}
}
