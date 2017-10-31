package com.eat.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.MD5;

import com.eat.domain.User;
import com.eat.service.UserService;
import com.eat.service.impl.UserServiceImpl;

public class AutoLogin implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String[] split = null;
		String uri=req.getRequestURI();
		String path=req.getContextPath();
		path=uri.substring(path.length());
		
		if(!("/login.jsp".equals(path)||"/user/login.do".equals(path)||"/error.jsp".equals(path))){
			if (user == null) {

				Cookie[] cookies = req.getCookies();
				for (Cookie cookie : cookies) {
					if ("username".equals(cookie.getName())) {
						split = cookie.getValue().split("&");
					}
				}
				if (split!=null&&"on".equals(split[2])) {
					UserService us = new UserServiceImpl();
					String pwdMD5=new MD5().getMD5ofStr(split[1]);
					user = us.login(split[0],pwdMD5);
					session.setAttribute("user", user);
					chain.doFilter(req, res);
				}
				else{
					PrintWriter out = res.getWriter();
					out.print("<script>");
					out.print("alert('您还没有登陆!!!');");
					out.print("</script>");
					// TODO Auto-generated method stub
					res.sendRedirect(req.getContextPath()+"/user/login.do");
					//需要放行吗？//chain.doFilter(req, res);
				}
			}
			else{
				chain.doFilter(req, res);
			}
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
