package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Order;
import bean.User;
import dao.OrderDAO;
import util.SendMail;
@WebServlet("/updateDeposit")
public class UpdateDeposit extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd="";
		String error="";
		
		try {
			SendMail mail=new SendMail();
			HttpSession session=request.getSession();
			int orderno=Integer.parseInt(request.getParameter("orderno"));
			//ArrayList<Order> order=(ArrayList<Order>)session.getAttribute("order_list");
			User user=(User)session.getAttribute("user");
			OrderDAO orderdao=new OrderDAO();
			
			
			
			Order order=orderdao.selectByOrder(orderno);
			orderdao.updateDeposit(order);
			//mail本文
			String msg = user.getUsername()+"様"+"\n"+"入金確認ができました。"+"\n"+"発送致します。";
			mail.sendMail(msg,user.getMailaddress());
			
		}catch(Exception e){
			error="予期せぬエラーが発生しました";
			
		}finally {
			if(!error.equals("")) {
				request.setAttribute("error", "menu");
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				
			}else {
				request.getRequestDispatcher("/listOrder").forward(request, response);
			}
		}
		
		
	}
}
