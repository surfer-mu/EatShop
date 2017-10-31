package com.eat.service;

import java.util.List;

import com.eat.domain.User;
import com.eat.domain.adress;

public interface UserService {
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	int register(User user);
	/**
	 * 登录查询
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);
	/**
	 * All USerlist
	 * @return
	 */
	
	List<User> findAllUsers();
	/**
	 * update userinfo
	 * @param user
	 */
	void updateUser(User user);
	/**
	 * del single user
	 * @param id
	 */
	void deleteBook(String id);
	User findBookById(String id);
	List<adress> findaddress(String id);
	void saveadress(String id, String time, String remoteHost);
	User findBookByUser(String username);
}
