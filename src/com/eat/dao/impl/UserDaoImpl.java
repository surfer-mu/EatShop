package com.eat.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import Utils.C3P0Utils;

import com.eat.dao.UserDao;
import com.eat.domain.User;
import com.eat.domain.adress;

public class UserDaoImpl implements UserDao {
	@Override
	public int register(User user) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		int i = qr.update("insert into user(id,username,password,relname,tell,email,address,sex) value(?,?,?,?,?,?,?,?)",user.getId(),user.getUsername(),user.getPassword(),user.getRelname(),user.getTell(),user.getEmail(),user.getAddress(),user.getSex());
		return i;
	}

	@Override
	public User login(String username, String password) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		return qr.query("select * from user where username=? and password=?", new BeanHandler<User>(User.class),username,password);
	}
	/**
	 * 查找所有用户
	 * @return
	 * @throws SQLException
	 */
	public List<User> findAllUsers() throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		return qr.query("select * from user", new BeanListHandler<User>(User.class));
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @throws SQLException
	 */
	public void updateUser(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		qr.update("update user set username=?,password=?,relname=?,category=?,sex=?,tell=?, email=? ,address=? where id=?",
				user.getUsername(),user.getPassword(),user.getRelname(),user.getCategory(),user.getSex(),user.getTell(),user.getEmail(),user.getAddress(),user.getId());
	}
	/**
	 * 根据id删除用户
	 * @param id
	 * @throws SQLException 
	 */
	public void delBook(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		qr.update("delete from user where id=?",id);
	}
	
	/**
	 * 
	 * @param id
	 * @return 
	 * @throws SQLException 
	 */
	public User findBookById(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		return qr.query("select * from user where id=?", new BeanHandler<User>(User.class),id);
	}
	public User findBookByUser(String username) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		return qr.query("select * from user where username=?", new BeanHandler<User>(User.class),username);
	}
	public void saveadress(String id,String time, String remoteHost) throws SQLException{
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		 qr.update("insert into loginaddress(id,time,ip) value(?,?,?)",id,time,remoteHost);
		
	}
	public List<adress> findaddress(String id) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		List<adress> list = qr.query("select * from loginaddress where id=?",new BeanListHandler<adress>(adress.class),id);
		return list;
	}
}
