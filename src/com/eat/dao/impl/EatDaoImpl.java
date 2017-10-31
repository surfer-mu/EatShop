package com.eat.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import Utils.C3P0Utils;

import com.eat.dao.EatDao;
import com.eat.domain.Eat;
import com.eat.domain.Order;
import com.eat.domain.OrderItem;
import com.eat.domain.User;

public class EatDaoImpl implements EatDao{
	
	@Override
	public List<Object> findEatByLikeName(String likename) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		List<Object> list = qr.query("select eatname from eat where eatname like ?", new ColumnListHandler(),"%"+likename+"%");
		return list;
	}
	
	/**
	 * 查询所有商品
	 * (non-Javadoc)
	 * @see com.eat.dao.EatDao#selectAllEat()
	 */
	public List<Eat> selectAllEat() throws SQLException {
			QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
			List<Eat> list = qr.query("select * from eat", new BeanListHandler<Eat>(Eat.class));
			return list;
	}
	
	/**
	 * 查询总共商品数量
	 * (non-Javadoc)
	 * @see com.eat.dao.EatDao#pageMaxPage()
	 */
	@Override
	public int pageMaxPage() throws SQLException {
			QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
			long l=(Long) qr.query("select count(*) from eat",new ScalarHandler(1));
			return (int)l;
	}
	/**
	 * 分页查询每页商品
	 * (non-Javadoc)
	 * @see com.eat.dao.EatDao#pageEatList(int)
	 */

	@Override
	public List<Eat> pageEatList(int current, int singlepage) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		List<Eat> pagelist = qr.query("select * from eat limit ?,?",new BeanListHandler<Eat>(Eat.class),(current-1)*singlepage,singlepage);
		return pagelist;
	}
	@Override
	public List<Eat> findPageEatByLikeName(String likename, int current,
			int singlepage) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		List<Eat> pagelist = qr.query("select * from eat where eatname like ?  limit ?,?",new BeanListHandler<Eat>(Eat.class),"%"+likename+"%",(current-1)*singlepage,singlepage);
		return pagelist;
	}

	/**
	 * 单个商品详细信息
	 * (non-Javadoc)
	 * @see com.eat.dao.EatDao#selectEatById(java.lang.String)
	 */
	@Override
	public Eat selectEatById(String id) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		
		return qr.query("select * from eat where id=?", new BeanHandler<Eat>(Eat.class),id);
	}

	@Override
	public int pageLikePage(String likename) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		long l=(Long) qr.query("select count(*) from eat where eatname like ?",new ScalarHandler(1),"%"+likename+"%");
		return (int)l;
	}
	/**
	 * 分页查询类别
	 */
	@Override
	public List<Eat> findEatByCate(String cate, int current, int singlepage) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		List<Eat> pagelist = qr.query("select * from eat where category= ?  limit ?,?",new BeanListHandler<Eat>(Eat.class),cate,(current-1)*singlepage,singlepage);
		return pagelist;
	}

	@Override
	public int pageCatePage(String cate) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDs());
		long l=(Long) qr.query("select count(*) from eat where category= ?",new ScalarHandler(1),cate);
		return (int)l;
	}

	
	
	
	public void delBook(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		qr.update("delete from eat where id=?",id);
	}

	public void updateUser(Eat eat) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		System.out.println(eat);
		qr.update("update eat set eatname=?,price=?,pnum=?,category=?,imgpath=? where id=?",
				eat.getEatname(),eat.getPrice(),eat.getPnum(),eat.getCategory(),eat.getImgpath(),eat.getId());
	}

	@Override
	public void AddEat(Eat eat) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDs());
		qr.update("insert into eat(id,eatname,price,pnum,imgpath,category) value(?,?,?,?,?,?) ",
				eat.getId(),eat.getEatname(),eat.getPrice(),eat.getPnum(),eat.getImgpath(),eat.getCategory());
		System.out.println(eat);
		System.out.println(eat.getId());
	}
	
	

}
