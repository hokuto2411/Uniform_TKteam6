package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Order;
import bean.OrderDetail;
import bean.User;
import dao.OrderDetailDAO;

@WebServlet("/insertCart")
public class InsertCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			request.setCharacterEncoding("UTF-8");
			int unino = Integer.parseInt(request.getParameter("unino"));
			
			Order order = new Order();
			order.setUserno(user.getUserno());
			
			OrderDetail detail = new OrderDetail();
			OrderDetailDAO detailDao = new OrderDetailDAO();
			detail.setOrderno();
			detail.setUnino(unino);
			detail.setQuantit);
			
			boolean isExist = false;
			for (OrderDetail detail : detail_list) {
			    if (detail.getUnino() == unino) {
			        // 💡 すでにカートにある商品なら、現在の個数に +1 する
			        detail.setQuantity(detail.getQuantity() + 1);
			        isExist = true;
			        break;
			    }
			}
			if (!isExist) {
			    // 新しくカートに入れる処理（数量は 1 ）
			    OrderDetail newDetail = new OrderDetail();
			    newDetail.setOrderno(0);
			    newDetail.setUnino(unino);
			    newDetail.setQuantity(1);
			    detail_list.add(newDetail);
			}
			
			
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			detail_list.add(detail);
			session.setAttribute("detail_list",detail_list);
			
			
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
