package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Order;
import dao.OrderDAO;

@WebServlet("/listOrder")
public class ListOrder extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			OrderDAO OrderDaoObj = new OrderDAO();
			ArrayList<Order> list = OrderDaoObj.selectAll();
			request.setAttribute("order_list",list);			
			
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
