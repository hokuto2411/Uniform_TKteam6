package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.User;
import dao.UserDAO;

@WebServlet("/insertUser")
public class InsertUser extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cmd="";
		String error="";
		
		User user=new User();
		
		try {
			request.setCharacterEncoding("UTF-8");
			
		
			System.out.println("a");
			user.setUserid(request.getParameter("userid"));
			user.setPassword(request.getParameter("password"));
			user.setUsername(request.getParameter("username"));
			user.setAddress(request.getParameter("address"));
			user.setMailaddress(request.getParameter("mailaddress"));
			System.out.println(user.getMailaddress());
			user.setAuthority(Integer.parseInt(request.getParameter("authority")));	
		
			System.out.println(user.getAddress());
			System.out.println(user.getUserid());
			System.out.println(user.getPassword());
			
			UserDAO userdao=new UserDAO();
			
			
			userdao.insertUser(user);
			
			
			
		}catch(IllegalStateException e) {
			error="DB接続エラーのため会員登録できませんでした";
			
		}catch (Exception e) {
			error = "予期せぬエラーが発生しました";
			
		}finally {
			if(error.equals("")) {
				request.setAttribute("user", user);
				request.getRequestDispatcher("/view/userComplete.jsp").forward(request, response);
			}else {
				System.out.println(error);
				request.setAttribute("cmd", cmd);
				request.setAttribute("error",error );
				request.getRequestDispatcher("/view/insertUser.jsp").forward(request, response);
			}
			
		}
	}
}
