package com.eat.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
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
import com.eat.service.OrderService;
import com.eat.service.impl.OrderServiceImpl;

public class OrderAction extends HttpServlet {

	private OrderService os=new OrderServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		String path=request.getContextPath();
		String path2 = request.getServletPath();
		String methodpath=uri.substring(path.length()+path2.length()+1);
		methodpath = methodpath.substring(0, methodpath.length()-3);
		
		try {
			Method method=this.getClass().getDeclaredMethod(methodpath, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this, request,response);
		} catch (Exception e) {
			//response.sendRedirect(request.getContextPath()+"/error.jsp");
			e.printStackTrace();
			response.getWriter().print("order找不到："+methodpath);
		} 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void orderList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html;charset=UTF-8");
		List<Order> list = os.findAllUsers();
		request.setAttribute("users", list);// 把list放入到request对象中
		request.getRequestDispatcher("/admin/orderlist/orderlist.jsp").forward(
				request, response);
		
		
	}
	private void delUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		os.deleteBook(id);
		response.sendRedirect(request.getContextPath()+"/order/orderList.do");
	}
	private void findUserById(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		
		Order user = os.findBookById(id);
		
		request.setAttribute("detailuser", user);
		request.getRequestDispatcher("/admin/orderlist/edit.jsp").forward(request, response);
	}
	private void buyCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String [] ids=request.getParameterValues("ids");
		if(ids!=null&&ids.length>0){
			List<String> idslist = Arrays.asList(ids);
			HttpSession session = request.getSession();
			HashMap<Eat,String> cart=(HashMap<Eat, String>) session.getAttribute("cart");
			//为了选中购买在创建一个mapcart
			HashMap<Eat,String> buycart= (HashMap<Eat, String>) session.getAttribute("buycart");
			if(buycart!=null){
				buycart.clear();
			}
			else{
				buycart=new  HashMap<Eat, String>();
			}
			Eat eat=new Eat();
			Set<Eat> keySet = cart.keySet();
			for (Eat eat2 : keySet) {
				//加入选中map
				if(idslist.contains(eat2.getId())){
					
					buycart.put(eat2, cart.get(eat2));
					//keySet.remove(eat2);
				}
			}
			session.setAttribute("buycart", buycart);
			response.sendRedirect(request.getContextPath()+"/admin/address.jsp");
		}
		else{
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('请至少选择一项！');");
			out.print("history.back();");
			out.print("</script>");
		}
	}
	/**
	 * 提交订单
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private  void doCommit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String relname=request.getParameter("relname");
		String tell=request.getParameter("tell");
		String address=request.getParameter("address");
		User user = (User) request.getSession().getAttribute("user");
		String id=user.getId();
		Order order=new Order();
		order.setUser(user);
		order.setRelname(relname);
		order.setTell(tell);
		order.setAddress(address);
		//为了选中购买之前创建的一个mapcart
		HashMap<Eat,String> buycart = (HashMap<Eat, String>) request.getSession().getAttribute("buycart");
		List<OrderItem> list=new ArrayList<OrderItem>();
		for (Eat eat : buycart.keySet()) {
			OrderItem oi=new OrderItem();
			oi.setEat(eat);
			oi.setNum(Integer.parseInt(buycart.get(eat)));
			list.add(oi);
		}
		
		
		//购买成功要删除session cart
		
		 HttpSession session = request.getSession();
			HashMap<Eat,String> cart=(HashMap<Eat, String>) session.getAttribute("cart");
		cart.remove(buycart);
		Set<Eat> keySet1 = cart.keySet();
		Set<Eat> keySet2 = buycart.keySet();
		keySet1.removeAll(keySet2);
		
		order.setList(list);
		os.doCommit(order);
		
		request.setAttribute("order",order);
		request.getRequestDispatcher("/admin/buysuccess.jsp").forward(request, response);
	}
}
