package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Order;
import bean.OrderDetail;
import bean.Uniform;
import bean.User;
import dao.OrderDAO;
import dao.UniformDAO;
import util.MyFormat;
import util.SendMail;

@WebServlet("/buyConfirm")
public class BuyComfirm {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user == null) {
				error = "セッション切れの為、購入は出来ません。 ";
				request.setAttribute("error",error);
				request.setAttribute("cmd","logout");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if(detail_list == null) {
				error = "カートの中に何も無かったので購入は出来ません。 ";
				request.setAttribute("error",error);
				request.setAttribute("cmd","menu");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
			
			String comment = (String)request.getAttribute("comment");
			UniformDAO UniDaoObj = new UniformDAO();
			OrderDAO OrderDaoObj = new OrderDAO();
			MyFormat fmt = new MyFormat();
			Date sqlDate = new Date(System.currentTimeMillis());
			Order order = new Order();
			ArrayList<Uniform> uni_list = new ArrayList<Uniform>();
			String msg = ""
					+ (String)user.getUserid()
					+ "様\n"
					+ "\n"
					+ "ユニフォームのご購入ありがとうございます。\n"
					+ "以下内容でご注文を受け付けましたので、ご連絡致します。\n"
					+ "\n";
			int total = 0;
			
			for(int i=0; i < detail_list.size(); i++) {
				OrderDetail detail = detail_list.get(i);
				Uniform uni = UniDaoObj.selectByUnino(detail.getUnino());
				uni_list.add(uni);
				
				// orderSet
				order.setOrderno(detail.getOrderno());
				order.setUserno(user.getUserno());
				total += (uni.getPrice() * detail.getQuantity());
				order.setOrderdate(sqlDate);
				order.setOrdercomment(comment);
				
				
				// メール本文作成
				msg += uni.getUniname()
						+ " "
						+ detail.getQuantity()
						+ " "
						+ (uni.getPrice() * detail.getQuantity())
						+ " "
						+ fmt.moneyFormat(uni.getPrice())
						+ "\n";								
			}
			msg += ""
					+ "合計	"
					+ fmt.moneyFormat(total)
					+ "円\n"
					+ "\n"
					+ "またのご利用よろしくお願いします。\n"
					+ "";			
			// メール送信
			SendMail mail = new SendMail();
			boolean TFMail = mail.sendMail(msg);
			if(TFMail == false) {
				error = "メール失敗";
				request.setAttribute("error",error);
				request.setAttribute("cmd","logout");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
			
			order.setSumprice(total);
			OrderDaoObj.insert(order);
			session.setAttribute("detail_list",null);
			request.getRequestDispatcher("/view/buyConfirm.jsp").forward(request, response);
			
		}catch(Exception e) {
			System.out.println(e);
			error = "DB接続エラーの為、購入は出来ません。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
