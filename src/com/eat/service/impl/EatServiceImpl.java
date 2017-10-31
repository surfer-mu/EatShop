package com.eat.service.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.eat.dao.EatDao;
import com.eat.dao.impl.EatDaoImpl;
import com.eat.domain.Eat;
import com.eat.domain.EatPage;
import com.eat.domain.Order;
import com.eat.domain.User;
import com.eat.service.EatService;

public class EatServiceImpl implements EatService {
	private EatDao ed=new EatDaoImpl();
	/**
	 * 模糊查询图书
	 * 
	 */
	@Override
	public List<Object> findEatByLikeName(String likename) {
		try {
			return ed.findEatByLikeName(likename);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询所有图书
	 * 
	 */
	@Override
	public List<Eat> selectAllEat() {
		
		try {
			return ed.selectAllEat();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 分页查询
	 * (non-Javadoc)
	 * @see com.eat.service.EatService#pageAllEat(int, int)
	 */
	@Override
	public EatPage pageAllEat(int current, int singlepage) {
		try {
			
			
			EatPage page=new EatPage();
			page.setCurrent(current);
			page.setSinglepage(singlepage);
			page.setMaxpage(ed.pageMaxPage());
			double x=Math.ceil((double)page.getMaxpage()/page.getSinglepage());
			page.setCount((int)x);
			
			if(current<1)
				current=1;
			if(current>page.getCount())
				current=page.getCount();
			
			page.setEatlist(ed.pageEatList(current,singlepage));
		
			
			
			return page;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public EatPage findPageEatByLikeName(String likename, int current,
			int singlepage) {
		try {
			
			
			EatPage page=new EatPage();
			page.setCurrent(current);
			page.setSinglepage(singlepage);
			page.setMaxpage(ed.pageLikePage(likename));
			double x=Math.ceil((double)page.getMaxpage()/page.getSinglepage());
			page.setCount((int)x);
			
			if(current<1)
				current=1;
			if(current>page.getCount())
				current=page.getCount();
			
			page.setEatlist(ed.findPageEatByLikeName(likename, current,singlepage));
		
			
			
			return page;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 单个商品详细信息
	 */
	@Override
	public Eat selectEatById(String id) {
		
		try {
			return ed.selectEatById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public EatPage findEatByCate(String cate,int current,
			int singlepage)  {
		try {
			
			
			EatPage page=new EatPage();
			page.setCurrent(current);
			page.setSinglepage(singlepage);
			page.setMaxpage(ed.pageCatePage(cate));
			double x=Math.ceil((double)page.getMaxpage()/page.getSinglepage());
			page.setCount((int)x);
			
			if(current<1)
				current=1;
			if(current>page.getCount())
				current=page.getCount();
			
			page.setEatlist(ed.findEatByCate(cate, current,singlepage));
		
			
			
			return page;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}



	public void updateUser(Eat eat) {
		try {
			ed.updateUser(eat) ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteBook(String id) {
		try {
			ed.delBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public Eat findBookById(String id) {
		try {
			return ed.selectEatById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void AddEat(Eat eat) {
		try {
			ed.AddEat(eat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	
}
