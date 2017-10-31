package com.eat.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.MD5;

import com.eat.domain.User;
import com.eat.domain.adress;
import com.eat.service.UserService;
import com.eat.service.impl.UserServiceImpl;


public class UserAction extends HttpServlet {
	private UserService us=new UserServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path=request.getServletPath();
		String p=request.getContextPath();
		String url=request.getRequestURI();
		String methodname=url.substring(path.length()+p.length()+1);
		methodname=methodname.substring(0, methodname.length()-3);
		
		try {
			Method method=this.getClass().getDeclaredMethod(methodname, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this, request,response);
		} catch (Exception e) {
			//response.sendRedirect(request.getContextPath()+"/error.jsp");
			response.getWriter().print("user找不到："+methodname);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String relname = request.getParameter("relname");
		String sex = request.getParameter("sex");
		String tell=request.getParameter("tell");
		String email=request.getParameter("email");
		String address = request.getParameter("address");
		
		
		
		if((username.trim()==null||username.trim()=="")||(password.trim()==null||password.trim()=="")){
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('账户或密码不能为空！');");
			out.print("history.back();");
			out.print("</script>");
			return ;
		}
		else{

			password=new MD5().getMD5ofStr(password);
			String id=UUID.randomUUID().toString();
			User user = new User(id, username, password, relname, sex, tell, email, address);
			int num;
			num= us.register(user);
			if(num>0)
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			else
			{
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('注册失败，请重新注册！');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
	}
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String username="";
		String password="";
		Cookie[] cookies = request.getCookies();
		String[] split = null;
		for (Cookie cookie : cookies) {
			if("username".equals(cookie.getName())){
				split = cookie.getValue().split("&");
				request.setAttribute("username", split[0]);
				request.setAttribute("password", split[1]);
				request.setAttribute("check", "checked='checked'");
			}
			
		}
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	private void dologin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String username =request.getParameter("username");
		String password=request.getParameter("password");
		String rem=request.getParameter("rem");
		String auto=request.getParameter("auto");
		String MD5password=new MD5().getMD5ofStr(password);
		/*System.out.println("username:"+username);
		System.out.println("pwd:"+password);
		System.out.println("auto:"+auto);*/
		
		User user = us.login(username,MD5password);
		if(user==null){
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('用户名密码错误！');");
			out.print("history.back();");
			out.print("</script>");
			
		}
		else{
			Date date=new Date(System.currentTimeMillis());//获取当前时间
			String time = DateFormat.getDateTimeInstance().format(date);//获取当前时间
			String ip=request.getRemoteHost(); //获取IP地址
			us.saveadress(user.getId(),time,ip);//进入数据库保存现在登录的IP地址和时间
			user.setTime(time);
			user.setIp(ip);//把IP地址存到User中
			Cookie ck=new Cookie("username",username+"&"+password+"&"+auto);
			ck.setPath("/");
			if(rem!=null){
				ck.setMaxAge(6000);
			}
			else{
				ck.setMaxAge(0);
			}
			response.addCookie(ck);
			HttpSession session = request.getSession();
			session.setAttribute("user" ,user);
			
			if("admin".equals(user.getCategory())||"highadmin".equals(user.getCategory()))
			response.sendRedirect(request.getContextPath()+"/admin/admin.jsp");
			else
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			
		}
	}
	private void quitUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("user" );
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
	
	private void detailUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object user = request.getSession().getAttribute("user");
		response.getWriter().write(user+"");
	}
	private void userList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html;charset=UTF-8");
		
		List<User> list = us.findAllUsers();
		
		request.setAttribute("users", list);// 把list放入到request对象中
		request.getRequestDispatcher("/admin/userlist/userlist.jsp").forward(
				request, response);
	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	
		User user=new User();
		String id=request.getParameter("id");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(password==null||"".equals(password)){
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('密码不能为空！');");
			out.print("history.back();");
			out.print("</script>");
			return ;
		}
		
		password=new MD5().getMD5ofStr(password);
		String relname=request.getParameter("relname");
		String sex=request.getParameter("sex");
		String tell=request.getParameter("tell");
		String email=request.getParameter("email");
		String category=request.getParameter("category");
		String address=request.getParameter("address");
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setRelname(relname);
		user.setSex(sex);
		user.setTell(tell);
		user.setEmail(email);
		user.setCategory(category);
		user.setAddress(address);
		
		us.updateUser(user);
		response.sendRedirect(request.getContextPath()+"/user/userList.do");
	}
	private void delUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		us.deleteBook(id);
		response.sendRedirect(request.getContextPath()+"/user/userList.do");
	}
	private void findUserById(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		
		User user = us.findBookById(id);
		
		request.setAttribute("detailuser", user);
		request.getRequestDispatcher("/admin/userlist/edit.jsp").forward(request, response);
	}
	private void findUserByUsername(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String username = request.getParameter("username");
		System.out.println("user:"+username);
		User user = us.findBookByUser(username);
		PrintWriter out = response.getWriter();
		if(user==null){
			out.print("yes");
		}
		else{
			out.print("no");
		}
		
	}
	private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		
		User user = us.findBookById(id);
		adress address = new adress();
		List<adress> list=us.findaddress(id);//从数据库查找到时间和ip信息集合
		request.setAttribute("list", list);//把集合存入内存
		request.setAttribute("thisuser", user);
		request.getRequestDispatcher("/admin/userlist/detail.jsp").forward(request, response);
	}
	
}
