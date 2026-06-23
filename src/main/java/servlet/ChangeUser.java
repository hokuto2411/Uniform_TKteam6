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

@WebServlet("/changeUser")
public class ChangeUser extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd="";
		String error="";
		HttpSession session =request.getSession();
		User user=(User)session.getAttribute("user");
		try {
			request.setCharacterEncoding("UTF-8");
			
			//userに画面からの情報をセット
			
			user.setUserno(user.getUserno());
			user.setUserid(request.getParameter("userid"));
			user.setPassword(request.getParameter("password"));
			user.setUsername(request.getParameter("username"));
			user.setAddress(request.getParameter("address"));
			user.setMailaddress(request.getParameter("mailaddress"));
			user.setAuthority(user.getAuthority());	
			
			
			UserDAO userdao=new UserDAO();
			
			
			userdao.updateUser(user);
			
			
			
		}catch(IllegalStateException e) {
			error = "DB接続エラーのため会員登録できませんでした";
		}catch(Exception e) {
			error = "予期せぬエラーが発生しました";
		}finally {
			if(error.equals("")) {
				request.setAttribute("user", user);
				request.getRequestDispatcher("/view/changeUserComplete.jsp").forward(request, response);
			}else {
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
		
		
	}
}
