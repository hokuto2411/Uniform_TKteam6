package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
				String sql = "SELECT * FROM user WHERE userid ='" + userid + "' AND password='" + password + "';";

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
		
		public void insertUser(User user) {
			
			Connection con = null;
			Statement smt = null;
			
			try {//ここに記述
				String sql="insert into user values ("+"null"+",'"
			+user.getUserid()+"','"
			+user.getPassword()+"','"
			+user.getUsername()+"','"
			+user.getAddress()+"','"
			+user.getMailaddress()+"','"
			+user.getAuthority()+"',0,(now()));";
				
				
				con=getConnection();
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
				
				
				
				String sql = "UPDATE user SET " +
			             "userid = '" + user.getUserid() + "', " +
			             "password = '" + user.getPassword() + "', " +
			             "username = '" + user.getUsername() + "', " +
			             "address = '" + user.getAddress() + "', " +
			             "mailaddress = '" + user.getMailaddress() + "', " +
			             "authority = " + user.getAuthority() + ", " +
			             "userfrag = 0, " +
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
		
		public void deleteUser(int userno) {
			Connection con = null;
			Statement smt = null;
			
			try {//ここに記述
				String sql = "UPDATE user SET userfrag = 1 WHERE userno = " + userno + ";";
				
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

public void ComeBack(int userno) {
			Connection con = null;
			Statement smt = null;
			
			try {//ここに記述
				String sql = "UPDATE user SET userfrag = 0 WHERE userno = " + userno + ";";
				
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
	
		public ArrayList<User> selectAll(){
			Connection con = null;
			Statement smt = null;
			ArrayList<User> user=new ArrayList<User>();
			try {//ここに記述
				String sql="SELECT userno,userid,password,username,address,userfrag FROM user ORDER BY userno"+";";
				
				con = getConnection();
				smt = con.createStatement();
				
				//SQL文発行
				ResultSet rs = smt.executeQuery(sql);
				
				while(rs.next()) {
					User objuser =new User();
					objuser.setUserno(rs.getInt("userno"));
					objuser.setUserid(rs.getString("userid"));
					objuser.setPassword(rs.getString("password"));
					objuser.setUsername(rs.getString("username"));
					objuser.setAddress(rs.getNString("address"));
					objuser.setUserfrag(rs.getInt("userfrag"));
					
					user.add(objuser);
				}
				
				
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
			}return user;
			
			
			
		}
}
