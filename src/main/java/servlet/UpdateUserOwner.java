package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDAO;




@WebServlet("/updateUserOwner")
public class UpdateUserOwner extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// UserDAOをインスタンス化する
		UserDAO objDao = new UserDAO();

		
		ArrayList<User>user_list=new ArrayList<User>();
			
		try{
			
			// selectAllメソッドを呼び出し、戻り値としてUserオブジェクトのリストを取得する
			user_list = objDao.selectAll();

		}catch(IllegalStateException e) {
			String cmd = "omenu";
			String	error="DB接続エラーの為、ユーザー一覧表示を表示できませんでした。";
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp).forward(request, response);

		}catch(Exception e){
			String cmd = "omenu";
			String	error="予期せぬエラーが発生しました。<br>" + e;
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp).forward(request, response);
		
		}
		
			// 取得したListをリクエストスコープに"book_list"という名前で格納する
			request.setAttribute("user_list", user_list);
			
			// ④list.jspにフォワード
			request.getRequestDispatcher("/view/updateUserOwner.jsp").forward(request, response);

			
		}
	}

