package bean;

public class OrderDetail {
	private int orderno;
	private int unino;
	private int quantity;
	
	public OrderDetail() {
		this.orderno = 0;
		this.unino = 0;
		this.quantity = 0;
	}
	
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	
	public int getUnino() {
		return unino;
	}
	public void setUnino(int unino) {
		this.unino = unino;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
