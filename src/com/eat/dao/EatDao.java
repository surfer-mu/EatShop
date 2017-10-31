package com.eat.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.eat.domain.Eat;
import com.eat.domain.Order;
import com.eat.domain.User;

public interface EatDao {
	/**
	 * 查询总共商品数量
	 * @return
	 * @throws SQLException
	 */
	List<Eat> selectAllEat() throws SQLException;
	/**
	 * 查询一共有多少件商品
	 * @return
	 * @throws SQLException
	 */
	int pageMaxPage() throws SQLException;

	/**
	 * 分页查询每页商品
	 * @param current
	 * @param singlepage
	 * @return
	 * @throws SQLException
	 */
	List<Eat> pageEatList(int current, int singlepage) throws SQLException;
	/**
	 * 单个商品详细信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	Eat selectEatById(String id) throws SQLException;
	List<Object> findEatByLikeName(String likename) throws SQLException;
	List<Eat> findPageEatByLikeName(String likename, int current, int singlepage) throws SQLException;
	int pageLikePage(String likename) throws SQLException;
	List<Eat> findEatByCate(String cate, int current, int singlepage) throws SQLException;
	int pageCatePage(String cate) throws SQLException;
	void updateUser(Eat eat) throws SQLException;
	void delBook(String id) throws SQLException;
	void AddEat(Eat eat) throws SQLException;
	
	
	

}
