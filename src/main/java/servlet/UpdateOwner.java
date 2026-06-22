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

@WebServlet("/updateOwner")
public class UpdateOwner extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO objUserDAO = new UserDAO();
		
		//Loginサーブレットで登録したセッションからデータを取得
		HttpSession session=request.getSession(true);
		User objUser=(User) session.getAttribute("user");

		
		//入力したデータの取得
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String mail=request.getParameter("mail");
		
		//hiddenで送ったデータの取得
		String Oname=request.getParameter("OriginalName");
		String Oadd=request.getParameter("OriginalAddress");
		String Oid=request.getParameter("OriginalId");
		String Opass=request.getParameter("OriginalPass");
		String Omail=request.getParameter("OriginalMail");
		
		//入力したデータは入力した値を、入力しなかった値は元のデータのまま登録
		
		//name判定
		if(name.equals("")) {
			objUser.setUsername(Oname);
		}else {
			objUser.setUsername(name);
		}
		
		//address判定
		if(address.equals("")) {
			objUser.setAddress(Oadd);
		}else {
			objUser.setAddress(address);
		}
		
		//id判定
		if(id.equals("")) {
			objUser.setUserid(Oid);
				}else {
					objUser.setUserid(id);
				}
		//pass判定
		if(pass.equals("")) {
			objUser.setPassword(Opass);
			}else {
				objUser.setPassword(pass);
		}
				
		//mail判定
		if(mail.equals("")) {
			objUser.setMailaddress(Omail);
				}else {
					objUser.setMailaddress(mail);
				}
				
		
		
		try {
			objUserDAO.updateUser(objUser);
		} catch (IllegalStateException e) {

			String message = "DB接続エラーの為、一覧表示は行えませんでした。";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/view/error.jsp?cmd=logout").forward(request, response);
		}

		//フォワード
		request.getRequestDispatcher("/view/menuOwner.jsp").forward(request, response);

	}

}
