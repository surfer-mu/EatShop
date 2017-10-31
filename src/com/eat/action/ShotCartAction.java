package com.eat.action;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eat.domain.Eat;
import com.eat.domain.Order;
import com.eat.domain.OrderItem;
import com.eat.domain.User;
import com.eat.service.EatService;
import com.eat.service.impl.EatServiceImpl;

public class ShotCartAction extends HttpServlet {
	private EatService es=new EatServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path=request.getServletPath();
		String p=request.getContextPath();
		String url=request.getRequestURI();
		String methodname=url.substring(path.length()+p.length()+1);
		methodname=methodname.substring(0, methodname.length()-3);
		try {
			/*
			 * 反射获取方法并调用
			 * */
			Method method=this.getClass().getDeclaredMethod(methodname, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this, request,response);
		} catch (Exception e) {
			/*
			 * 网址不存在跳入准备好的错误页面
			 * */
			//response.sendRedirect(request.getContextPath()+"/error.jsp");
			response.getWriter().print("cart找不到:"+methodname);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	/**
	 * 把商品添加入购物车
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void addcartEat(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String id = request.getParameter("id");
		String number=request.getParameter("num");
		
		Eat eat=new Eat();
		
		eat=es.selectEatById(id);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		HashMap<Eat,String> cart=(HashMap<Eat, String>) session.getAttribute("cart");
		if(cart==null){
			cart=new HashMap<Eat,String>();
		}
		int num=0;

		if(cart.containsKey(eat)){
				num=Integer.parseInt(cart.get(eat));
		}
		num=num+Integer.parseInt(number);
		if(user!=null){
			cart.put(eat, num+"");
			//cartsuccess.jsp显示名称
			session.setAttribute("eat", eat);
		}
		session.setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath()+"/admin/cartsuccess.jsp");
	}
	/**
	 * 从购物车删除单个商品
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void delcartEat(HttpServletRequest request, HttpServletResponse response) throws IOException{
	String id = request.getParameter("id");
		
		
		Eat eat=new Eat();
		eat.setId(id);
		HttpSession session = request.getSession();
		HashMap<Eat,String> cart=(HashMap<Eat, String>) session.getAttribute("cart");
		if(cart.containsKey(eat)){
			String remove = cart.remove(eat);
			
		}
		
		response.sendRedirect(request.getContextPath()+"/admin/cart.jsp");
	}
	/**
	 * 清空购物车
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void removecartEat(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		HashMap<Eat,String> cart=(HashMap<Eat, String>) session.getAttribute("cart");
		cart.clear();
	
		response.sendRedirect(request.getContextPath()+"/admin/cart.jsp");
	}
	
	/**
	 * 修改购物车商品数量
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void updatecartEat(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		String number=request.getParameter("number");
		
		EatService es=new EatServiceImpl();
		Eat eat=new Eat();
		eat.setId(id);
		HttpSession session = request.getSession();
		HashMap<Eat,String> cart=(HashMap<Eat, String>) session.getAttribute("cart");
		if("0".equals(number)){
			cart.remove(eat);
		}
		if(cart.containsKey(eat)){
			cart.put(eat, number);
		}
			
		response.sendRedirect(request.getContextPath()+"/admin/cart.jsp");
	}
	
}
