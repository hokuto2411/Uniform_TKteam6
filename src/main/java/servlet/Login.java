package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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

		//UserDAOクラスのインスタンス化
		UserDAO objDao = new UserDAO();

		//データベースのuserinfoより引数のuserデータを取得するメソッド
		User objUser = null;
		try {

			objUser = objDao.selectByUser(userid, password);
		} catch (IllegalStateException e) {

			String message = "DB接続エラーの為、ログインは出来ません。";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/view/error.jsp?cmd=logout").forward(request, response);

		}

		//ユーザーか管理者かを判別する変数
		int Authority;
		Authority = objUser.getAuthority();

		//User情報がある場合(useridとpasswordが合っていた場合)
		if (Authority == 0) {

			//セッションスコープに登録
			HttpSession session = request.getSession();
			session.setAttribute("user", objUser);

			//クッキーにUserid情報登録
			Cookie UserCookie = new Cookie("userid", objUser.getUserid());
			UserCookie.setMaxAge(60 * 60 * 24 * 5);
			response.addCookie(UserCookie);

			//クッキーにPasswd情報登録
			Cookie PasswdCookie = new Cookie("password", objUser.getPassword());
			PasswdCookie.setMaxAge(60 * 60 * 24 * 5);
			response.addCookie(PasswdCookie);

			//menu.jspにフォワード
			request.getRequestDispatcher("/view/listUni.jsp").forward(request, response);

		} else if (Authority == 1) {

			//セッションスコープに登録
			HttpSession session = request.getSession();
			session.setAttribute("user", objUser);

			//MenuOwner.jspにフォワード
			request.getRequestDispatcher("/view/menuOwner.jsp").forward(request, response);

		} else {
			//リクエストスコープにエラーメッセージ登録
			request.setAttribute("message", "入力データが間違っています。");

			//login.jspにフォワード
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
		}

	}
}
