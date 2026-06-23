package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.User;
@WebServlet("/inputCheckUpdate")
public class InputCheckUpdete extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String cmd = "";
		User user = new User();
		try {
			if (request.getParameter("userid").equals("") ||
					request.getParameter("password").equals("") ||
					request.getParameter("username").equals("") ||
					request.getParameter("address").equals("") ||
					request.getParameter("mailaddress").equals("")) {
				error = "すべて入力してください";
			}
			System.out.println(request.getParameter("userid"));
			user.setUserid(request.getParameter("userid"));
			user.setPassword(request.getParameter("password"));
			user.setUsername(request.getParameter("username"));
			user.setAddress(request.getParameter("address"));
			user.setMailaddress(request.getParameter("mailaddress"));
			user.setAuthority(user.getAuthority());

		} catch (IllegalStateException e) {
			error = "DB接続エラーのため会員登録できませんでした";

		} catch (Exception e) {
			error = "予期せぬエラーが発生しました";
		} finally {
			if (error.equals("")) {
				request.setAttribute("user", user);
				request.getRequestDispatcher("/view/changeUserConfirm.jsp").forward(request, response);
			} else {
				System.out.println(error);
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/changeUser.jsp").forward(request, response);
			}
		}
	}
}
