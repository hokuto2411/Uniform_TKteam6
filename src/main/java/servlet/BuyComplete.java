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
import bean.Uniform;
import bean.User;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.UniformDAO;
import util.MyFormat;
import util.SendMail;

@WebServlet("/buyComplete")
public class BuyComplete extends HttpServlet {
	// 購入確認画面のフォームがPOSTで送られてくるためdoPostで受け取ります
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";
		String cmd = "";
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user == null) {
				error = "セッション切れのため、購入できませんでした";
				cmd = "logout";
				request.setAttribute("error",error);
				request.setAttribute("cmd",cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if(detail_list == null || detail_list.isEmpty()) {
				error = "カートが空のため、購入できませんでした。すでに購入が完了している可能性があります。";
				request.setAttribute("error",error);
				request.setAttribute("cmd","menu");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			
			// 確認画面から送られてきたコメント（ご要望）を取得
			String comment = request.getParameter("comment");
			
			UniformDAO UniDaoObj = new UniformDAO();
			OrderDAO OrderDaoObj = new OrderDAO();
			OrderDetailDAO DetailDaoObj = new OrderDetailDAO();
			MyFormat fmt = new MyFormat();
			
			// 💡 修正ポイント：DTO(Order.java)のTimestamp型に合わせて、現在のシステム日時を取得・流し込み
			java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
			
			Order order = new Order();
			order.setUserno(user.getUserno());
			order.setOrderdate(sqlTimestamp); // 型エラーなくカチッと連動します
			order.setOrdercomment(comment);
			
			String msg = user.getUsername() + "様\n\n"
					+ "ユニフォームのご購入ありがとうございます。\n"
					+ "以下内容でご注文を受け付けましたので、ご連絡致します。\n\n";
			int total = 0;
			
			// メール本文の組み立てと合計金額の計算
			for(int i=0; i < detail_list.size(); i++) {
				OrderDetail detail = detail_list.get(i);
				Uniform uni = UniDaoObj.selectByUnino(detail.getUnino());
				
				if (uni != null) {
					total += (uni.getPrice() * detail.getQuantity());
					msg += uni.getUniname() + " × " + detail.getQuantity() + "個 : "
							+ fmt.moneyFormat(uni.getPrice() * detail.getQuantity()) + "円\n";
					UniDaoObj.minusStock(uni);
				}
			}
			
			msg += "\n合計金額 : " + fmt.moneyFormat(total) + "円\n\n"
					+ "またのご利用よろしくお願いします。";			
			
			// メール送信処理
			String email = user.getMailaddress();
			SendMail mail = new SendMail();
			boolean TFMail = mail.sendMail(msg, email);
			if(!TFMail) {
				error = "注文確認メールの送信に失敗しました。";
				request.setAttribute("error",error);
				request.setAttribute("cmd","menu");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			
			// データベース保存処理（親テーブル）
			order.setSumprice(total);
			int generatedOrderno = OrderDaoObj.insert(order); 
			
			// データベース保存処理（子明細テーブル）
			for (OrderDetail detail : detail_list) {
				detail.setOrderno(generatedOrderno);
				DetailDaoObj.insert(detail);
			}
			
			// 表示用の合計金額をリクエストに詰め、カート（セッション）をクリアする
			request.setAttribute("total_price", total);
			session.setAttribute("detail_list", null); 
			
			// 最終的な「ご購入ありがとうございました」画面（JSP）へ遷移
			request.getRequestDispatcher("/view/buyComplete.jsp").forward(request, response);
			
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			error = "予期せぬエラーが発生しました。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","logout");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
	
	
}
