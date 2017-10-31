package com.eat.service;

import java.util.List;

import com.eat.domain.Eat;
import com.eat.domain.EatPage;
import com.eat.domain.Order;
import com.eat.domain.User;

public interface EatService {
	/**
	 * 查询所有物品
	 * @return
	 */
	List<Eat> selectAllEat();
	/**
	 *  分页查询
	 * @param current
	 * @param singlepage
	 * @return
	 */
	EatPage pageAllEat(int current, int singlepage);
	/**
	 * 单个商品详细信息
	 * @param id
	 * @return
	 */
	Eat selectEatById(String id);
	List<Object> findEatByLikeName(String likename);
	EatPage findPageEatByLikeName(String likename, int current, int singlepage);
	EatPage findEatByCate(String cate, int current, int singlepage);
	void deleteBook(String id);
	void updateUser(Eat eat);
	Eat findBookById(String id);
	void AddEat(Eat eat);
	
	
	

	
	
}
