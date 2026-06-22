/* DeleteUni.java
 * 商品の削除機能のサーブレット
 * 
 */

package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UniformDAO;

@WebServlet("/deleteUni")
public class DeleteUni extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		//エラー処理用の変数の宣言と初期化
		String error = "";
		String cmd = "";
		
		try {
			
			UniformDAO uniDao = new UniformDAO();
			int unino =Integer.parseInt(request.getParameter("unino"));
			
			int e_unino = uniDao.selectByunino(unino).getUnino();
			
			//e_uninoをあるない判定する
			String strunino = Integer.toString(e_unino);
			
		//エラー処理
			
			//uninoがない場合
			if(strunino.equals("")) {
				error = "削除対象の商品が存在しない為、削除処理は行えませんでした。";
				
			}else {
				
				uniDao.delete(unino);
			}
			
		}catch(Exception e) {
			
			error = "予期せぬエラーが発生しました。<br>" + e;
			
		}finally {
			
			request.setAttribute("error", error);
			
			if(error.equals("")) {
				
				request.getRequestDispatcher("/listUni").forward(request,response);
				
			}else {
				
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}

}
