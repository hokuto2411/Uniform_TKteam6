package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDAO;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			UserDAO objUserDAO = new UserDAO();
			User objUser = new User();

			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			System.out.println(request.getParameter("userid"));
			
			
			 objUser = objUserDAO.selectByUser(userid,password);
			 System.out.println(objUser);
			if (objUser.getUsername() == null) {
				String message = "削除対象が存在しないため、ユーザーを削除できませんでした。";
				String cmd = "omenu";
				request.setAttribute("error", message);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);

			}
			//deleteメソッドを利用してユーザー情報を削除
			try {

				objUserDAO.deleteUser(objUser);

			} catch (IllegalStateException e) {

				String error = "DB接続エラーのため、ユーザーを削除できませんでした。";
				String cmd = "omenu";
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);

			} finally {
				request.getRequestDispatcher("/updateUserOwner").forward(request, response);
			}
		}
	}

