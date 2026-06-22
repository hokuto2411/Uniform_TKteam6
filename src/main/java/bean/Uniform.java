package bean;

public class Uniform {
	private int unino;
	private String uniname;
	private int price;
	private int stock;
	private String image;
	private int unifrag;
	private String uniupdatetime;
	
	//初期化用コンストラクタ
	public Uniform() {
		this.unino = 0;
		this.uniname = null;
		this.price = 0;
		this.stock = 0;
		this.image = null;
		this.unifrag = 0;
		this.uniupdatetime = null;
	}
	
	public int getUnino() {
		return unino;
	}
	public void setUnino(int unino) {
		this.unino = unino;
	}
	
	public String getUniname() {
		return uniname;
	}
	public void setUniname(String uniname) {
		this.uniname = uniname;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getUnifrag() {
		return unifrag;
	}
	public void setUnifrag(int unifrag) {
		this.unifrag = unifrag;
	}
	
	public String getUniupdatetime() {
		return uniupdatetime;
	}
	public void setUniupdatetime(String uniupdatetime) {
		this.uniupdatetime = uniupdatetime;
	}

}
