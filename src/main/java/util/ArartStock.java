/*ArartStock.java
 * 在庫数を通知するサーブレット
 */

package util;

import java.util.ArrayList;

import bean.Uniform;
import bean.User;
import dao.UniformDAO;

public class ArartStock{
	public void sendArart(User user){
		
		try {
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
						boolean TFmail = mail.sendMail(msg, user.getMailaddress());
					}
				}
			}
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
			
	}

}

