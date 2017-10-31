package com.eat.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.eat.dao.UserDao;
import com.eat.dao.impl.UserDaoImpl;
import com.eat.domain.User;
import com.eat.domain.adress;
import com.eat.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao ud=new UserDaoImpl();
	@Override
	public int register(User user) {
		try {
			return ud.register(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	@Override
	public User login(String username, String password) {
		try {
			return ud.login(username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<User> findAllUsers(){
		try {
			return ud.findAllUsers();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateUser(User user) {
		try {
			ud.updateUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteBook(String id) {
		try {
			ud.delBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public User findBookById(String id) {
		try {
			return ud.findBookById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public User findBookByUser(String username) {
		try {
			return ud.findBookByUser(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public void saveadress(String id,String time, String remoteHost){
		try {
			ud.saveadress(id,time,remoteHost);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<adress> findaddress(String id){
		try {
			return ud.findaddress(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
