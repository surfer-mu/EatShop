package com.eat.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import Utils.C3P0Utils;

import com.eat.dao.OrderDao;
import com.eat.domain.Order;
import com.eat.domain.OrderItem;
import com.eat.domain.User;

public class OrderDaoImpl implements OrderDao {

	/**
	 * 购买选中物品
	 * @throws SQLException 
	 */
	@Override
	public String doCommit(Order order) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=C3P0Utils.getConnection();
			conn.setAutoCommit(false);
			ps=conn.prepareStatement("insert into ordercart (orderId,userid,relname,tell,address,total,orderTime) values(?,?,?,?,?,?,?)");
			String orderId = generateOrderid();
			ps.setString(1,orderId );
			ps.setString(2,order.getUser().getId());
			ps.setString(3, order.getRelname());
			ps.setString(4, order.getTell());
			ps.setString(5, order.getAddress());
			ps.setDouble(6,order.getTotal());
			ps.setString(7, new Date().toLocaleString());
			
			int i = ps.executeUpdate();//cuo
			int j = 0 ;
			ps=conn.prepareStatement("insert into goods(eatname,number,allPrice) value(?,?,?)");
			
			for(OrderItem oi:order.getList()){
				ps.setString(1, oi.getEat().getEatname());
				ps.setInt(2,  oi.getNum());
				ps.setDouble(3, oi.getEat().getPrice()*oi.getNum());
				j = ps.executeUpdate();
			}
			conn.commit();
			if(i>0&&j>0){
				order.setOrderId(orderId);
			}
		} catch (SQLException e) {
			conn.rollback();
			e.printStackTrace();
		}
		finally{
			C3P0Utils.release(null, ps, conn);
		}
		
		return null;
	}
	
	private final int  MAX=9999;
	int i=0;
	private synchronized String generateOrderid(){
		String str = Long.toString(System.currentTimeMillis());
		String id=str+i;
		i++;
		if(i>MAX){
			i=0;
		}
		return id;
	}
	public List<Order> findAllUsers() throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		return qr.query("select * from ordercart", new BeanListHandler<Order>(Order.class));
	}
	
	
	/**
	 * 根据id删除用户
	 * @param id
	 * @throws SQLException 
	 */
	public void delBook(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		qr.update("delete from ordercart where orderId=?",id);
		System.out.println(id);
	}
	
	/**
	 * 
	 * @param id
	 * @return 
	 * @throws SQLException 
	 */
	public Order findBookById(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		return qr.query("select * from ordercart where orderId=?", new BeanHandler<Order>(Order.class),id);
	}
	
	

}
