package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.OrderDetail;

public class OrderDetailDAO {
	private static String RDB_DRIVE = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost/uniformdb";
	private static String USER="root";
	private static String PASSWD="root123";
	
	private static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(RDB_DRIVE);
			con = DriverManager.getConnection(URL, USER, PASSWD);
			return con;
		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}
	
	public void insert(OrderDetail detail) {
	    Connection con = null;
	    java.sql.PreparedStatement pstmt = null; // 安全なPreparedStatementを使用

	    try {
	        // 💡 最初に提示いただいた設計図（orderno, unino, quantity）に完璧に合わせたSQLです
	        String sql = "INSERT INTO orderdetail (orderno, unino, quantity) VALUES (?, ?, ?)";

	        con = getConnection(); // ※既存のコネクション取得メソッドを呼び出します
	        pstmt = con.prepareStatement(sql);
	        
	        pstmt.setInt(1, detail.getOrderno());
	        pstmt.setInt(2, detail.getUnino());
	        pstmt.setInt(3, detail.getQuantity());

	        // SQLを実行してデータベースに登録
	        pstmt.executeUpdate();

	    } catch (Exception e) {
	        throw new IllegalStateException(e); // エラーが起きた場合はサーブレットのcatchに知らせる
	    } finally {
	        if (pstmt != null) {
	            try { pstmt.close(); } catch (java.sql.SQLException ignore) {}
	        }
	        if (con != null) {
	            try { con.close(); } catch (java.sql.SQLException ignore) {}
	        }
	    }
	}

	
	
	public ArrayList<OrderDetail> selectByOrder(int orderno) {

		Connection con = null;
		Statement smt = null;
		
		ArrayList<OrderDetail> detail_list = new ArrayList<OrderDetail>();
		try {
			
			String sql = "SELECT * FROM orderdetail WHERE orderno ='"+orderno+"'";

			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);
			
			while (rs.next()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrderno(rs.getInt("orderno"));
				orderDetail.setUnino(rs.getInt("unino"));
				orderDetail.setQuantity(rs.getInt("quantity"));
				detail_list.add(orderDetail);
			}
			
		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return detail_list;
	}
	
	
	public ArrayList<OrderDetail> selectAll() {
		Connection con = null;
		Statement smt = null;
		ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT * FROM orderdetail";
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				OrderDetail detail = new OrderDetail();
				detail.setOrderno(rs.getInt("orderno"));
				detail.setUnino(rs.getInt("unino"));
				detail.setQuantity(rs.getInt("quantity"));
				detailList.add(detail);
			}
		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return detailList;
	}
}
