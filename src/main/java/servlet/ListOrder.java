package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Order;
import bean.OrderDetail;
import dao.OrderDAO;
import dao.OrderDetailDAO;

@WebServlet("/listOrder")
public class ListOrder extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			OrderDAO OrderDaoObj = new OrderDAO();
			OrderDetailDAO DetailDaoObj = new OrderDetailDAO();
			ArrayList<Order> order_list = OrderDaoObj.selectAll();
			ArrayList<OrderDetail> detail_list = DetailDaoObj.selectAll();
			
			request.setAttribute("detail_list",detail_list);
			request.setAttribute("order_list",order_list);
			
			request.getRequestDispatcher("/view/listOrder.jsp").forward(request, response);
			
		} catch(IllegalStateException e) {
			System.out.println(e);
			error = "DB接続エラーのため、注文一覧を表示できませんでした。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);

		}catch(Exception e){
			System.out.println(e);
			error = "予期せぬエラーが発生しました。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
