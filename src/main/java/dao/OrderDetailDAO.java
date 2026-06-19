package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.OrderDetail;

public class OrderDetailDAO {
	private static String RDB_DRIVE = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost/myunidb";
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
	
	public void insert(OrderDetail orderDetail) {
		Connection con = null;
		Statement smt = null;
		int count = 0;

		try {
			String sql = "INSERT INTO orderdetailinfo VALUES('"
					+ orderDetail.getOrderno() + "','"
					+ orderDetail.getUnino() + "','"
					+ orderDetail.getQuantity() + "')";

			con = getConnection();
			smt = con.createStatement();
			count = smt.executeUpdate(sql);

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
	}
	
	
	public OrderDetail selectByOrder(int orderno) {

		Connection con = null;
		Statement smt = null;

		OrderDetail orderDetail = new OrderDetail();
		try {
			
			String sql = "SELECT * FROM orderdetailinfo WHERE orderno ='"+orderno+"'";

			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				orderDetail.setOrderno(rs.getInt("orderno"));
				orderDetail.setUnino(rs.getInt("unino"));
				orderDetail.setQuantity(rs.getInt("quantity"));
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
		return orderDetail;
	}
	
}
