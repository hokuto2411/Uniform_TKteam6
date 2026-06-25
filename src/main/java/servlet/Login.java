package servlet;
//a
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.User;
import dao.UserDAO;

@WebServlet("/login")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//jsp画面(Web)からのフォームデータを取得する
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String message = "";
		User user = new User();
		UserDAO userdao = new UserDAO();
		try {
			if(password.equals("") && userid.equals("")) {
				message="ユーザーとパスワードを入力してください";
				request.setAttribute("cmd", "login");
				request.setAttribute("error", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=login").forward(request, response);
			
			}else if(password.equals("")) {
				message = "パスワードを入力してください";
				request.setAttribute("cmd", "login");
				request.setAttribute("error", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=login").forward(request, response);
				
			}else if(userid.equals("")) {
				message = "ユーザーIDを入力してください";
				request.setAttribute("cmd", "login");
				request.setAttribute("error", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=login").forward(request, response);
				
			}

			
			user = userdao.selectByUser(userid, password);
			
			if(user.getUserid()==null) {
				
				message="入力したデータが間違っています。";
				request.setAttribute("cmd", "login");
				request.setAttribute("error", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=login").forward(request, response);
				
			}	
			
			if(user.getUserfrag()==1) {
				
				message="アカウントは無効です";
				request.setAttribute("cmd", "login");
				request.setAttribute("error", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=login").forward(request, response);
			}

		} catch (IllegalStateException e) {
			message = "DB接続エラーの為、ログインは出来ません。";
			request.setAttribute("cmd", "login");
			request.setAttribute("error", message);
			request.getRequestDispatcher("/view/error.jsp?cmd=login").forward(request, response);
		} finally {
			
			} if (user.getAuthority() == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);

				request.getRequestDispatcher("/view/menu.jsp").forward(request, response);
			} else if (user.getAuthority() == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				request.getRequestDispatcher("/view/menuOwner.jsp").forward(request, response);

			}
	  }
}

