package com.xsxk.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		if(user != null){
			return true;
		}
		String url = request.getRequestURI();
		if(url.indexOf("logout.action") >0 || url.indexOf("login.action") >0 ){
			return true;
		}
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		/*	String path = request.getContextPath();
		response.sendRedirect(path+"/index.jsp");*/	
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest arg0,
			HttpServletResponse arg1,Object arg2, ModelAndView arg3)
			throws Exception {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, 
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}


}
