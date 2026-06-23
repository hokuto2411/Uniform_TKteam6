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
			//必要クラスのインスタンス化
			UniformDAO uniDao = new UniformDAO();

			//パラメータの受け取り
			int unino =Integer.parseInt(request.getParameter("unino"));
			
			//削除対象の有無を確認
			int e_unino = uniDao.selectByUnino(unino).getUnino();
			String strunino = Integer.toString(e_unino);

			//エラー処理

			//uninoがない場合
			if(strunino.equals("")) {
				error = "削除対象の商品が存在しない為、削除処理は行えませんでした。";
				cmd = "uninoNull";
				return;
			}

			//削除実行
			uniDao.delete(unino);

		}catch(Exception e) {	
			error = "予期せぬエラーが発生しました。<br>" + e;
			cmd = "error";
		}finally {
			if(error == null || error.trim().equals("")) {
				request.getRequestDispatcher("/view/menuOwner.jsp").forward(request, response);
			}else {
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}

}
