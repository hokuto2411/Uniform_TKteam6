package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Order;
import bean.OrderDetail;
import bean.Uniform;
import bean.User;
import dao.OrderDAO;
import dao.OrderDetailDAO; // 💡明細を保存するために追加
import dao.UniformDAO;
import util.MyFormat;
import util.SendMail;

@WebServlet("/buyConfirm")
public class BuyConfirm extends HttpServlet { // 💡クラス名のタイポも修正
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user == null) {
				error = "セッション切れの為、購入は出来ません。";
				request.setAttribute("error",error);
				request.setAttribute("cmd","logout");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if(detail_list == null || detail_list.isEmpty()) { // 💡空判定も追加
				error = "カートの中に何も無かったので購入は出来ません。";
				request.setAttribute("error",error);
				request.setAttribute("cmd","menu");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			
			String comment = request.getParameter("comment");
			
			UniformDAO UniDaoObj = new UniformDAO();
			OrderDAO OrderDaoObj = new OrderDAO();
			OrderDetailDAO DetailDaoObj = new OrderDetailDAO(); // 💡明細用DAO
			MyFormat fmt = new MyFormat();
			Date sqlDate = new Date(System.currentTimeMillis());
			
			Order order = new Order();
			order.setUserno(user.getUserno());
			order.setOrderdate(sqlDate);
			order.setOrdercomment(comment);
			
			String msg = user.getUsername() + "様\n\n" // 💡useridからusername（氏名）に変更
					+ "ユニフォームのご購入ありがとうございます。\n"
					+ "以下内容でご注文を受け付けましたので、ご連絡致します。\n\n";
			int total = 0;
			
			for(int i=0; i < detail_list.size(); i++) {
				OrderDetail detail = detail_list.get(i);
				Uniform uni = UniDaoObj.selectByUnino(detail.getUnino());
				
				total += (uni.getPrice() * detail.getQuantity());
				
				msg += uni.getUniname() + " × " + detail.getQuantity() + "個 : "
						+ fmt.moneyFormat(uni.getPrice() * detail.getQuantity()) + "円\n";								
			}
			
			msg += "\n合計金額 : " + fmt.moneyFormat(total) + "円\n\n"
					+ "またのご利用よろしくお願いします。";			
			
			// メール送信
			SendMail mail = new SendMail();
			boolean TFMail = mail.sendMail(msg);
			if(!TFMail) {
				error = "注文確認メールの送信に失敗しました。";
				request.setAttribute("error",error);
				request.setAttribute("cmd","logout");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			
			order.setSumprice(total);
			int generatedOrderno = OrderDaoObj.insert(order); // ※insertメソッドが発行されたID（int）を返す設計にしてください
			
			for (OrderDetail detail : detail_list) {
				detail.setOrderno(generatedOrderno); // 発行された本物の注文番号をセット
				DetailDaoObj.insert(detail);        // 💡明細を1件ずつDBにINSERT！
			}
			request.setAttribute("total_price", total);
			session.setAttribute("detail_list", null);
			request.getRequestDispatcher("/view/buyConfirm.jsp").forward(request, response);
			
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace(); // 💡エラー追跡用に残す
			error = "システムエラーの為、購入処理を完了できませんでした。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
