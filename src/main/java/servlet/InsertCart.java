package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.OrderDetail;
import bean.Uniform;
import dao.UniformDAO; 

@WebServlet("/insertCart")
public class InsertCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			if(user == null) {
				//仮のゲスト情報をDBに登録する
				UserDAO userDao = new UserDAO();
				userDao.guestUser();	
			}
			
			int unino = Integer.parseInt(request.getParameter("unino"));
			
			UniformDAO uniDao = new UniformDAO();
			Uniform uni = uniDao.selectByUnino(unino); // ※メソッド名は既存のDAOに合わせて適宜変更してください
			
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			
			if (detail_list == null) {
				detail_list = new ArrayList<OrderDetail>();
			}
			
			boolean isExist = false;
			for (OrderDetail item : detail_list) {
				if (item.getUnino() == unino) {
					item.setQuantity(item.getQuantity() + 1);
					isExist = true;
					break;
				}
			}
			
			if (!isExist) {
				OrderDetail newDetail = new OrderDetail();
				newDetail.setOrderno(0); // 購入確定前なので仮の0
				newDetail.setUnino(unino);
				newDetail.setQuantity(1); // 初期数量は1
				detail_list.add(newDetail);
			}
			
			session.setAttribute("detail_list", detail_list);
			
			request.getRequestDispatcher("/view/insertCart.jsp").forward(request, response);
			
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			error = "予期せぬエラーが発生しました。";
			request.setAttribute("error", error);
			request.setAttribute("cmd", "menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
