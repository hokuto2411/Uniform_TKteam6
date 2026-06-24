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
				String message = "削除対象の書籍が存在しない為、書籍削除処理は行えませんでした。";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=list").forward(request, response);

			}
			//deleteメソッドを利用して書籍情報を削除
			try {

				objUserDAO.deleteUser(objUser);

			} catch (IllegalStateException e) {

				String message = "DB接続エラーの為、削除は行えませんでした。";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/view/error.jsp?cmd=logout").forward(request, response);

			} finally {
				//ログイン画面へフォワード
				request.getRequestDispatcher("/updateUserOwner").forward(request, response);
			}
		}
	}

