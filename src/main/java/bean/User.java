package bean;

public class User {

	int userno;
	String userid;
	String password;
	String username;
	String address;
	String mailaddress;
	int authority;
	int userfrag;
	String userupdatetime;
	
	//変数の初期化
	public User() {

	}

	//usernoのセッターゲッターメソッド
	public int getUserno() {

		return this.userno;
	}

	public void setUserno(int userno) {

		this.userno = userno;
	}

	//useridのセッターゲッターメソッド
	public String getUserid() {

		return this.userid;
	}

	public void setUserid(String userid) {

		this.userid = userid;
	}

	//passwordのセッターゲッターメソッド
	public String getPassword() {

		return this.password;
	}

	public void setPassword(String password) {

		this.password = password;
	}
	
	//usernameのセッターゲッターメソッド
		public String getUsername() {

			return this.username;
		}

		public void setUsername(String username) {

			this.username = username;
		}
	
	//addressのセッターゲッターメソッド
	public String getAddress() {

		return this.address;
	}

	public void setAddress(String address) {

		this.address = address;
	}

	//mailaddressのセッターゲッターメソッド
	public String getMailaddress() {

		return this.mailaddress;
	}

	public void setMailaddress(String mailaddress) {

		this.mailaddress = mailaddress;
	}

	//authorityのセッターゲッターメソッド
	public int getAuthority() {

		return this.authority;
	}

	public void setAuthority(int authority) {

		this.authority = authority;
	}

	//userfragのセッターゲッターメソッド
	public int getUserfrag() {

		return this.userfrag;
	}

	public void setUserfrag(int userfrag) {

		this.userfrag = userfrag;
	}
	
	//userfragのセッターゲッターメソッド
		public String getUserupdatetime() {

			return this.userupdatetime;
		}

		public void setUserupdatetime(String userupdatetime) {

			this.userupdatetime = userupdatetime;
		}
	
}