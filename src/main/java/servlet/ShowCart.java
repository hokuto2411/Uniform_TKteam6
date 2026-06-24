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

@WebServlet("/showCart")
public class ShowCart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String error = "";		
		try {
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			
			ArrayList<OrderDetail> detail_list = (ArrayList<OrderDetail>)session.getAttribute("detail_list");
			if (detail_list == null) {
				detail_list = new ArrayList<OrderDetail>();
			}
			
			String deluninoStr = request.getParameter("delunino");
			if (deluninoStr != null) {
				int delunino = Integer.parseInt(deluninoStr);
				
				for (int i = 0; i < detail_list.size(); i++) {
					if (detail_list.get(i).getUnino() == delunino) {
						detail_list.remove(i);
						break; // 削除したらループを抜ける
					}
				}
				session.setAttribute("detail_list", detail_list);
			}

			UniformDAO uniDao = new UniformDAO();
			ArrayList<Uniform> uni_list = new ArrayList<Uniform>();
			int total_price = 0; // 合計金額の計算用
			
			for (OrderDetail detail : detail_list) {
				Uniform uni = uniDao.selectByUnino(detail.getUnino()); // 💡商品情報を1件ずつ取得
				uni_list.add(uni);
				
				if (uni != null) {
					total_price += uni.getPrice() * detail.getQuantity();
				}
			}
			request.setAttribute("detail_list", detail_list);
			request.setAttribute("uni_list", uni_list);
			request.setAttribute("total_price", total_price);
			
			request.getRequestDispatcher("/view/showCart.jsp").forward(request, response);
			
		} catch(IllegalStateException e) {
			System.out.println(e);
			error = "DB接続エラーのため、カートを表示できませんでした。";
			request.setAttribute("error",error);
			request.setAttribute("cmd","menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);

		}catch(Exception e){
			error = "予期せぬエラーが発生しました。<br>" + e;
			request.setAttribute("error",error);
			request.setAttribute("cmd","menu");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
		
	}
	
}
