package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import bean.Uni;

public class UniDAO {
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
	
	public void insert(Uni uni) {
		Connection con = null;
		Statement smt = null;
		int count = 0;

		try {
			String sql = "INSERT INTO orderinfo VALUES('"
					+ uni.getUnino() + "','"
					+ uni.getUniname() + "','"
					+ uni.getPrice() + "','"
					+ uni.getStock() + "','"
					+ uni.getImage() + "','"
					+ uni.getUnifrag() + "','"
					+ uni.getUniupdatetime() + "','"
					+ uni.getUnideletetime() + "')";

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
	
	
}
