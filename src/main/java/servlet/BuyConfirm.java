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
import bean.User;
import dao.UniformDAO;

@WebServlet("/buyConfirm")
public class BuyConfirm extends HttpServlet { // 💡クラス名のタイポも修正
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if(detail_list == null || detail_list.isEmpty()) {
				error = "カートの中に何も無かったので購入は出来ません。";
				request.setAttribute("error",error);
				request.setAttribute("cmd","menu");
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				return;
			}
			
			UniformDAO UniDaoObj = new UniformDAO();
			ArrayList<Uniform> uni_list = new ArrayList<Uniform>();
			int total = 0;
			
			// カート内の商品情報を取得して合計金額を計算する（画面表示用）
			for(int i=0; i < detail_list.size(); i++) {
				OrderDetail detail = detail_list.get(i);
				Uniform uni = UniDaoObj.selectByUnino(detail.getUnino());
				uni_list.add(uni);
				
				if (uni != null) {
					total += (uni.getPrice() * detail.getQuantity());
				}
			}

			if(user.getUserid().equals("guest")) {
				//ゲストの場合
				session.setAttribute("uni_list", uni_list);
				session.setAttribute("detail_list", detail_list);
				session.setAttribute("total_price", total);
				session.setAttribute("user_info", user);
				request.getRequestDispatcher("/view/payment.jsp").forward(request, response);
			}
			else
			{
				//ログインしている場合
				request.setAttribute("uni_list", uni_list);
				request.setAttribute("detail_list", detail_list);
				request.setAttribute("total_price", total);
				request.getRequestDispatcher("/view/buyConfirm.jsp").forward(request, response);
			}
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
