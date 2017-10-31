package com.eat.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import Utils.MD5;

import com.eat.domain.Eat;
import com.eat.domain.EatPage;
import com.eat.domain.User;
import com.eat.service.EatService;
import com.eat.service.impl.EatServiceImpl;

public class EatAction extends HttpServlet {
	private EatService es=new EatServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path=request.getServletPath();
		String methodname=path.substring(1);
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
			e.printStackTrace();
			response.getWriter().print("eat找不到:"+methodname);
			
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	/**
	 * 商品详情
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void detailEat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id=request.getParameter("id");
		EatService es=new EatServiceImpl();
		Eat eat=new Eat();
		
		eat=es.selectEatById(id);
		
		request.setAttribute("eat", eat);
		request.getRequestDispatcher("/eatdetails.jsp").forward(request, response);
	}
	/**
	 * 搜索后列表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void findPageEatByLikeName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		
		String name = request.getParameter("name");
		String likename= URLDecoder.decode(name, "UTF-8"); 
		EatService es=new EatServiceImpl();
		System.out.println(likename);
		
		int singlepage=8;
		int  current;
		
		String currentpage=(String) request.getParameter("currentpage");
		
		
		if((currentpage==null)||(!currentpage.matches("[0-9]+"))){
			current=1;
			
		}
		
		else{
			current=Integer.parseInt(currentpage,singlepage);
		}
		
		/*if(current>0&&current<=eatpage.getCount())*/
		
		EatPage eatpage=es.findPageEatByLikeName(likename,current,singlepage);
		
		request.setAttribute("eatpage", eatpage);
		request.getRequestDispatcher("/eatlist.jsp").forward(request, response);
	}
	/**
	 * AJAX列表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void findEatByLikeName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String name = request.getParameter("name");
		System.out.println(name);
		String likename= URLDecoder.decode(name, "UTF-8"); 
		EatService es=new EatServiceImpl();
		
		List<Object> eatlist=new LinkedList<Object>();
		eatlist=es.findEatByLikeName(likename);
		String str = JSONArray.fromObject(eatlist).toString();
		//System.out.println(str);
	
		response.getWriter().print(str);
		
	}
	/**
	 * 分页列表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void pageallEat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		EatService es=new EatServiceImpl();
		List<Eat> eatlist=new LinkedList<Eat>();
		int singlepage=8;
		int  current;
		
		String currentpage=(String) request.getParameter("currentpage");
		
		
		if((currentpage==null)||(!currentpage.matches("[0-9]+"))){
			current=1;
			
		}
		
		else{
			current=Integer.parseInt(currentpage,singlepage);
		}
		
		/*if(current>0&&current<=eatpage.getCount())*/
		
		EatPage eatpage=es.pageAllEat(current,singlepage);
		
		request.setAttribute("eatpage", eatpage);
		
		request.getRequestDispatcher("/eatlist.jsp").forward(request, response);
	}
	
	private void findEatByCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String cate = request.getParameter("cate");
		EatService es=new EatServiceImpl();
		int singlepage=8;
		int  current;
		
		String currentpage=(String) request.getParameter("currentpage");
		
		
		if((currentpage==null)||(!currentpage.matches("[0-9]+"))){
			current=1;
			
		}
		
		else{
			current=Integer.parseInt(currentpage,singlepage);
		}
		
		/*if(current>0&&current<=eatpage.getCount())*/
		
		EatPage eatpage=es.findEatByCate(cate,current,singlepage);
		
		request.setAttribute("eatpage", eatpage);
		
		request.getRequestDispatcher("/eatlist.jsp").forward(request, response);
	}
	private void delUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		es.deleteBook(id);
		response.sendRedirect(request.getContextPath()+"/eatList.do");
	}
	private void findUserById(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		
		Eat user = es.findBookById(id);
		
		request.setAttribute("detailuser", user);
		request.getRequestDispatcher("/admin/eatlist/edit.jsp").forward(request, response);
	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		Eat eat=new Eat();
		eat.setId(request.getParameter("id"));
		eat.setEatname(request.getParameter("eatname"));
		eat.setCategory(request.getParameter("category"));
		eat.setDescription(request.getParameter("description"));
		eat.setImgpath(request.getParameter("imgpath"));
		eat.setPnum(Integer.parseInt(request.getParameter("pnum")));
		eat.setPrice(Double.parseDouble(request.getParameter("price")));
		
		es.updateUser(eat);
		response.sendRedirect(request.getContextPath()+"/eatList.do");
	}
	private void eatList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		List<Eat> list = es.selectAllEat();
		request.setAttribute("users", list);// 把list放入到request对象中
		request.getRequestDispatcher("/admin/eatlist/eatlist.jsp").forward(
				request, response);
	}
	private void eatAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		Eat eat=new Eat();
		request.setCharacterEncoding("UTF-8");
		eat.setId(UUID.randomUUID().toString());
		eat.setEatname(request.getParameter("eatname"));
		eat.setCategory(request.getParameter("category"));
		eat.setDescription(request.getParameter("description"));
		eat.setImgpath(request.getParameter("imgpath"));
		eat.setPnum(Integer.parseInt(request.getParameter("pnum")));
		eat.setPrice(Double.parseDouble(request.getParameter("price")));
		
		es.AddEat(eat);
		response.sendRedirect(request.getContextPath()+"/eatList.do");
	}
}
