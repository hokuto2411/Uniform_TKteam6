package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Uni;

public class UniformDAO {
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

	//データベースにユニフォームデータを登録するメソッド
	public void insert(Uni uni) {
		Connection con = null;
		Statement smt = null;
		int count = 0;

		try {
			String sql = "INSERT INTO uniinfo VALUES('"
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

	//全ユニフォーム情報を取得するメソッド
	public ArrayList<Uni> selectAll(){
		Connection con = null;
		Statement smt = null;

		ArrayList<Uni> uniList = new ArrayList<Uni>();

		try {
			String sql = "SELECT unino,uniname,price,stock,image FROM uni ORDER BY unino";

			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			while(rs.next()) {
				Uni uniInfo = new Uni();
				uniInfo.setUnino(rs.getInt("unino"));
				uniInfo.setUniname(rs.getString("uniname"));
				uniInfo.setPrice(rs.getInt("price"));
				uniInfo.setStock(rs.getInt("stock"));
				uniInfo.setImage(rs.getString("image"));		
				uniList.add(uniInfo);
			}

		}catch(Exception e) {
			throw new IllegalStateException(e);
		}finally{
			if( smt != null ){
				try{smt.close();}catch(SQLException ignore){}
			}
			if( con != null ){
				try{con.close();}catch(SQLException ignore){}
			}
		}
		return uniList;
	}

	//指定されたユニフォームデータを検索するメソッド
	public Uni selectByunino(int unino){
		Connection con = null;
		Statement smt = null;

		Uni uniInfo = new Uni();

		try{
			String sql = "SELECT unino,uniname,price,stock,image,unifrag,uniupdatetime FROM uni WHERE unino = '" + unino + "'";

			con = getConnection();
			smt = con.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			while(rs.next()) {
				uniInfo.setUnino(rs.getInt("unino"));
				uniInfo.setUniname(rs.getString("uniname"));
				uniInfo.setPrice(rs.getInt("price"));
				uniInfo.setStock(rs.getInt("stock"));
				uniInfo.setImage(rs.getString("image"));
				uniInfo.setUnifrag(rs.getInt("unifrag"));
				uniInfo.setUniupdatetime(rs.getInt("uniupdatetime"));			
			}

		}catch(Exception e){
			throw new IllegalStateException(e);
		}finally{
			if( smt != null ){
				try{smt.close();}catch(SQLException ignore){}
			}
			if( con != null ){
				try{con.close();}catch(SQLException ignore){}
			}
		}
		return uniInfo;
	}

	//指定されたユニフォームデータを削除するメソッド
	public void delete(int unino){
		Connection con = null;
		Statement smt = null;

		try{
			String sql = "DELETE FROM uni WHERE unino = '"+unino+"'";

			con = getConnection();
			smt = con.createStatement();
			smt.executeUpdate(sql);

		}catch(Exception e){
			throw new IllegalStateException(e);
		}finally{
			if( smt != null ){
				try{smt.close();}catch(SQLException ignore){}
			}
			if( con != null ){
				try{con.close();}catch(SQLException ignore){}
			}
		}
	}

	//指定されたユニフォームデータを更新するメソッド
	public void update(Uni uni){

		Connection con = null;
		Statement smt = null;

		try{
			String sql = "UPDATE uni SET uniname='"
					+uni.getUniname()+"',price="
					+uni.getPrice()+" ',stock="
					+uni.getStock()+" ',image= "
					+uni.getImage()+" WHERE unino='"+uni.getUnino()+"'";

			con = getConnection();
			smt = con.createStatement();
			smt.executeUpdate(sql);

		}catch(Exception e){
			throw new IllegalStateException(e);
		}finally{
			if( smt != null ){
				try{smt.close();}catch(SQLException ignore){}
			}
			if( con != null ){
				try{con.close();}catch(SQLException ignore){}
			}
		}
	}

}
