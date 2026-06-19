package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Order;

public class OrderDAO {
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
	
	public void insert(Order order) {
		Connection con = null;
		Statement smt = null;
		int count = 0;

		try {
			String sql = "INSERT INTO orderinfo VALUES('"
					+ order.getOrderno() + "','"
					+ order.getUserno() + "','"
					+ order.getSumprice() + "','"
					+ order.getOrderdate() + "','"
					+ order.getDeposit() + "','"
					+ order.getOrdercomment() + "')";

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
	
	
	public ArrayList<Order> selectAll() {
		Connection con = null;
		Statement smt = null;
		ArrayList<Order> orderList = new ArrayList<Order>();

		try {
			con = getConnection();
			smt = con.createStatement();
			String sql = "SELECT o.user,b.title,o.date FROM uniinfo b INNER JOIN orderinfo o ON b.isbn=o.isbn";
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				Order order = new Order();
				order.setOrderno(rs.getInt("orderno"));
				order.setUserno(rs.getInt("userno"));
				order.setSumprice(rs.getInt("sumprice"));
				order.setOrderdate(rs.getInt("orderdate"));
				order.setDeposit(rs.getInt("deposit"));
				order.setOrdercomment(rs.getString("ordercomment"));
				orderList.add(order);
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
		return orderList;
	}
	
	
}
