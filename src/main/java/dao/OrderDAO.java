package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import bean.Order;

public class OrderDAO {
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
			String sql = "SELECT * FROM orderinfo";
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				Order order = new Order();
				order.setOrderno(rs.getInt("orderno"));
				order.setUserno(rs.getInt("userno"));
				order.setSumprice(rs.getInt("sumprice"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setDeposit(rs.getInt("deposit"));
				order.setSend(rs.getInt("send"));
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
	
	public Order selectByOrder(int orderno) {

		Connection con = null;
		Statement smt = null;

		Order order = new Order();
		try {
			
			String sql = "SELECT * FROM orderinfo WHERE orderno ='"+orderno+"'";

			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				order.setOrderno(rs.getInt("orderno"));
				order.setUserno(rs.getInt("userno"));
				order.setSumprice(rs.getInt("sumprice"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setDeposit(rs.getInt("deposit"));
				order.setSend(rs.getInt("send"));
				order.setOrdercomment(rs.getString("ordercomment"));
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
		return order;
	}
	
	public int getLastMonth() {
		int month = 0;
		
		Connection con = null;
		Statement smt = null;

		try {
			
			String sql = "SELECT * FROM orderinfo ORDER BY orderdate DESC LIMIT 1";

			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);
			
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(rs.getDate("orderdate"));
			month = calendar.get(Calendar.MONTH) + 1;
			
			
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
		
		return month;
	}
	
	public int sumPriceByMonth(int month) {
		int sum = 0;
		
		Connection con = null;
		Statement smt = null;

		try {
			
			String sql = "SELECT SUM(sumprice) AS total_price FROM orderinfo WHERE orderdate >= "+month+" AND orderdate < " +month+ " + INTERVAL 1 MONTH";
			
			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);
			
			sum = rs.getInt("total_price");
			
			
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
		
		return sum;
	}
	
}
