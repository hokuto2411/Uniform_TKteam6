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

		//  BookDAOをインスタンス化する
		UserDAO objDao = new UserDAO();

		
		ArrayList<User>user_list=new ArrayList<User>();
			
		try{
			
			// selectAllメソッドを呼び出し、戻り値としてBookオブジェクトのリストを取得する
			user_list = objDao.selectAll();

		}catch(IllegalStateException e) {
			
			String	message="DB接続エラーの為、一覧表示は行えませんでした。";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/view/error.jsp?cmd=logout").forward(request, response);
		
		}
		
			// 取得したListをリクエストスコープに"book_list"という名前で格納する
			request.setAttribute("user_list", user_list);
			
			// ④list.jspにフォワード
			request.getRequestDispatcher("/view/updateUserOwner.jsp").forward(request, response);

			
		}
	}

