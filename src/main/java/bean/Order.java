package bean;

import java.sql.Timestamp;

public class Order {
	private int orderno;
	private int userno;
	private int sumprice;
	private Timestamp orderdate; 
	private int deposit;
	private int send;
	private String ordercomment;
	
	public Order() {
		this.orderno = 0;
		this.userno = 0;
		this.sumprice = 0;
		this.orderdate = null;
		this.deposit = 0;
		this.send = 0;
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
	
	public int getSumprice() {
		return sumprice;
	}
	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}
	
	public Timestamp getOrderdate() {
	    return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
	    this.orderdate = orderdate;
	}
	
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	
	public int getSend() {
		return send;
	}
	public void setSend(int send) {
		this.send = send;
	}
	
	public String getOrdercomment() {
		return ordercomment;
	}
	public void setOrdercomment(String ordercomment) {
		this.ordercomment = ordercomment;
	}
	
}
