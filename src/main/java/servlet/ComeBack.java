package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UserDAO;

@WebServlet("/comeBack")
public class ComeBack extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO objUserDAO = new UserDAO();

		String Suserno = request.getParameter("userno");
		int userno=Integer.parseInt(Suserno);
		
		
		if (userno == 0) {
			String message = "復活対象が存在しないため、ユーザーを削除できませんでした。";
			String cmd = "omenu";
			request.setAttribute("error", message);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);

		}
		//deleteメソッドを利用してユーザー情報を削除
		try {

			objUserDAO.ComeBack(userno);
			request.getRequestDispatcher("/updateUserOwner").forward(request, response);

		} catch (IllegalStateException e) {

			String error = "DB接続エラーのため、ユーザーを削除できませんでした。";
			String cmd = "omenu";
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);

		}
	}
}


