package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.User; 
public class UserDAO {
	//接続用の情報をフィールド変数にとして定義
		private final static String RDB_DRIVE = "com.mysql.cj.jdbc.Driver";
		private final static String URL = "jdbc:mysql://localhost/uniformdb";
		private static String USER = "root";
		private static String PASS = "root123";
		
		public static Connection getConnection() {
			try {
				Class.forName(RDB_DRIVE);
				Connection con = DriverManager.getConnection(URL, USER, PASS);
				return con;
			} catch (Exception e) {
				throw new IllegalStateException(e);

			}
		}
		
		public User selectByUser(String userid, String password) {

			Connection con = null;
			Statement smt = null;
			//リターン用のオブジェクト
			User user = new User();
			try {
				//SQL文
				String sql = "SELECT * FROM user WHERE userid ='" + userid + "' AND password='" + password + "'";

				con = getConnection();
				smt = con.createStatement();

				//SQL文発行
				ResultSet rs = smt.executeQuery(sql);

				//結果を取得
				while (rs.next()) {
					user.setUserno(rs.getInt("userno"));
					user.setUserid(rs.getString("userid"));
					user.setPassword(rs.getString("password"));
					user.setUsername(rs.getString("username"));
					user.setAddress(rs.getString("address"));
					user.setMailaddress(rs.getString("mailaddress"));
					user.setAuthority(rs.getInt("authority"));
					user.setUserfrag(rs.getInt("userfrag"));
					user.setUserupdatetime(rs.getString("userupdatetime"));
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

			return user;
		}
		
		public void insertUser(String userid,String password,String username,String address,String mailaddress,int authority) {
			Connection con = null;
			Statement smt = null;
			
			try {//ここに記述
				String sql="insert into user values ('"+"null"+",'"
			+userid+"','"
			+password+"','"
			+username+"','"
			+address+"','"
			+mailaddress+"','"
			+authority+"',1',(now()))";
				
				
				con = getConnection();
				smt = con.createStatement();
				
				smt.executeUpdate(sql);
				
			}catch (Exception e) {
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
		public void updateUser(User user) {
			Connection con = null;
			Statement smt = null;
			try {
				
				/*String sql = "UPDATE user SET userid='"
						+ user.getUserid() + "',password="
						+ user.getPassword() + "'username,="+ user.getUsername()+"'address,="+ user.getAddress()+
						"'mailaddress,="+ user.getMailaddress()+"'authority,="+ user.getAuthority()+"userfrag=1,userupdatetime=now()"+
						" WHERE userno='"
						+ user.getUserno() + "'";*/
				
				String sql = "UPDATE user SET " +
			             "userid = '" + user.getUserid() + "', " +
			             "password = '" + user.getPassword() + "', " +
			             "username = '" + user.getUsername() + "', " +
			             "address = '" + user.getAddress() + "', " +
			             "mailaddress = '" + user.getMailaddress() + "', " +
			             "authority = " + user.getAuthority() + ", " +
			             "userfrag = 1, " +
			             "userupdatetime = now() " +
			             "WHERE userno = " + user.getUserno() + ";";
				
				con = getConnection();
				smt = con.createStatement();
				
				smt.executeUpdate(sql);
				
			}catch (Exception e) {
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
		
		public void deleteUser(User user) {
			Connection con = null;
			Statement smt = null;
			
			try {//ここに記述
				String sql="update user set userfrag = 1 where userno"+user.getUserno()+";";
				
			}catch (Exception e) {
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
