package com.eat.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.eat.dao.OrderDao;
import com.eat.dao.impl.OrderDaoImpl;
import com.eat.domain.Order;
import com.eat.domain.User;
import com.eat.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderDao od=new OrderDaoImpl();
	/**
	 *购买选中物品 
	 */
	@Override
	public String doCommit(Order order) {
	
		try {
			return od.doCommit(order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<Order> findAllUsers(){
		try {
			return od.findAllUsers();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void deleteBook(String id) {
		try {
			od.delBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Order findBookById(String id) {
		try {
			return od.findBookById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
