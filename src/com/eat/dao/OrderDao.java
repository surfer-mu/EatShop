package com.eat.dao;

import java.sql.SQLException;
import java.util.List;

import com.eat.domain.Order;
import com.eat.domain.User;

public interface OrderDao {
	/**
	 * 
	 * @param buycart
	 * @param u
	 * @return
	 * @throws SQLException 
	 */
	String doCommit(Order order) throws SQLException;

	List<Order> findAllUsers() throws SQLException;
	
	void delBook(String id) throws SQLException;
	Order findBookById(String id) throws SQLException;

}
