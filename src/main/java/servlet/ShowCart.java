package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.OrderDetail;
import bean.Uni;
import bean.User;
import dao.UniformDAO;

@WebServlet("/showCart")
public class ShowCart {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			int unino = Integer.parseInt(request.getParameter("unino"));
			String delunino = request.getParameter("delunino");
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if(delunino != null) {
				detail_list.remove(Integer.parseInt(delunino));
			}
			
			UniformDAO UniformDaoObj = new UniformDAO();
			ArrayList<Uni> uni_list = new ArrayList<Uni>();
			for(int i=0; i < detail_list.size(); i++) {
				Uni uni = UniformDaoObj.selectByunino(unino);
				uni_list.add(uni);
			}
			
			
			
			request.setAttribute("detail_list",detail_list);
			request.setAttribute("uni_list",uni_list);
			request.getRequestDispatcher("/view/insertCart.jsp").forward(request, response);
			
		} catch(IllegalStateException e) {
			System.out.println(e);
			error = "DB接続エラー";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
		
	}
	
}
