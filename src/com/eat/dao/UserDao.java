package com.eat.dao;

import java.sql.SQLException;
import java.util.List;

import com.eat.domain.User;
import com.eat.domain.adress;

public interface UserDao {
	/**
	 * 注册
	 * @param user
	 * @return
	 * @throws SQLException 
	 */
	int register(User user) throws SQLException;
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	User login(String username, String password) throws SQLException;
	/**
	 * find all userlist
	 * @return
	 * @throws SQLException
	 */
	List<User> findAllUsers() throws SQLException;
	/**
	 * update userinfo
	 * @param user
	 * @throws SQLException
	 */
	void updateUser(User user) throws SQLException;
	void delBook(String id) throws SQLException;
	User findBookById(String id) throws SQLException;
	List<adress> findaddress(String id) throws SQLException;
	void saveadress(String id, String time, String remoteHost)
			throws SQLException;
	User findBookByUser(String username) throws SQLException;
}
