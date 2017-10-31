package com.eat.service;

import java.util.List;

import com.eat.domain.Order;
import com.eat.domain.User;

public interface OrderService {
	/**
	 * 购买选中物品，建库
	 * @param buycart
	 * @param u
	 * @return
	 */
	String doCommit(Order order);

	List<Order> findAllUsers();

	Order findBookById(String id);

	void deleteBook(String id);
}
