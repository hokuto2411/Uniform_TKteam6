package bean;

public class Order {
	private int orderno;
	private int userno;
	private int sumprice;
	private int orderdate;
	private int deposit;
	private String ordercomment;
	
	public Order() {
		this.orderno = 0;
		this.userno = 0;
		this.sumprice = 0;
		this.orderdate = 0;
		this.deposit = 0;
		this.ordercomment = null;
	}
	
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	public int getsumprice() {
		return sumprice;
	}
	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}
	
	public int getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(int orderdate) {
		this.orderdate = orderdate;
	}
	
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	
	public String getOrdercomment() {
		return ordercomment;
	}
	public void setOrdercomment(String ordercomment) {
		this.ordercomment = ordercomment;
	}
	
}
