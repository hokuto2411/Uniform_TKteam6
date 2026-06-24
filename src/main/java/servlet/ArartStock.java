/*ArartStock.java
 * 在庫数を通知するサーブレット
 */

package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Uniform;
import dao.UniformDAO;
import util.SendMail;

@WebServlet("/arartStock")
public class ArartStock extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		String error = "";
		String cmd = "";
		
		try {
			
		/*selectAllでストックの数を取得する
		 * ストックの数が5より少ない場合
		 * ストックの数がない場合
		 * メールで通知する
		 */
			
			//DAOクラスのインスタンス化
			UniformDAO uniDao = new UniformDAO();
			Uniform uni = new Uniform();
			
			//データベースから全商品の情報を取得
			ArrayList<Uniform> list = uniDao.selectAll();
			
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					if(uni.getStock() <= 5){
						
						//メール本文作成
						String msg=""
								+ ""		//管理者名
								+ "様\n"
								+ "\n"
								+ "在庫数が残り少ないため、ご連絡致します。\n"
								+ "\n"
								+ "商品名\t"
								+ "残り在庫数\t"
								+ "\n"
								+uni.getUniname()
								+ "\t"
								+ "残り"
								+ uni.getStock()
								+"個\n";
						
						//メール送信
						SendMail mail = new SendMail();
						boolean TFmail = mail.sendMail(msg);
						if(TFmail == false) {
							error = "メール失敗";
						}	
					}
				}
			}
			
			}catch(Exception e) {
				error = "予期せぬエラーが発生したため、在庫通知が出来ませんでした。<br>" + e;
				cmd = "error";
			
			}finally {
				if(error == null || error.trim().equals("")) {
					request.getRequestDispatcher("").forward(request, response);
					
				}else {
					request.setAttribute("error", error);
					request.setAttribute("cmd", cmd);
					request.getRequestDispatcher("/view/error.jsp").forward(request, response);
					
				}
			
			}
	}

}
