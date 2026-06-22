package servlet;

import java.awt.print.Book;
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
import dao.OrderDAO;
import dao.UniformDAO;
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
			
			UniformDAO UniDaoObj = new UniformDAO();
			OrderDAO OrderDaoObj = new OrderDAO();
			ArrayList<Uni> uni_list = new ArrayList<Uni>();
			String msg = ""
					+ (String)user.getUserid()
					+ "様\n"
					+ "\n"
					+ "本のご購入ありがとうございます。\n"
					+ "以下内容でご注文を受け付けましたので、ご連絡致します。\n"
					+ "\n";
			int total = 0;
			
			for(int i=0; i < detail_list.size(); i++) {
				OrderDetail detail = detail_list.get(i);
				Uni uni = UniDaoObj.selectByunino(detail.getUnino());
				// ↓???
				OrderDaoObj.insert(detail);
				list.add(Book);
				// メール本文作成
				total += uni.getPrice();
				msg += uni.get()
						+ " "
						+ Book.getTitle()
						+ " "
						+ Book.getPrice()
						+ "\n";								
			}
			msg += ""
					+ "合計	"
					+ total
					+ "円\n"
					+ "\n"
					+ "またのご利用よろしくお願いします。\n"
					+ "";
			
			request.setAttribute("book_list",list);
			
			// メール送信
			SendMail mail = new SendMail();
			boolean TFMail = mail.sendMail(msg);
			if(TFMail == false) {
				error = "メール失敗";
				request.setAttribute("error",error);
				request.setAttribute("cmd","logout");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
			
			session.setAttribute("order_list",null);
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
