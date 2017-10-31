package com.eat.domain;

import java.util.List;

public class Order {
	private String orderId;
	private User user;
	private String relname;
	private String tell;
	private String address;
	private double total;
	private String orderTime;
	private List<OrderItem> list;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRelname() {
		return relname;
	}
	public void setRelname(String relname) {
		this.relname = relname;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public List<OrderItem> getList() {
		return list;
	}
	public void setList(List<OrderItem> list) {
		this.list = list;
		double total=0.0;
		for (OrderItem orderItem : list) {
			int num = orderItem.getNum();
			double price = orderItem.getEat().getPrice();
			total+=num*price;
		}
		setTotal(total);
	}
	
	
}
