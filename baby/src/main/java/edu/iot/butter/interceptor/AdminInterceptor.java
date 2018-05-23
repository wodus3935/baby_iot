package edu.iot.butter.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.iot.butter.model.Member;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	ServletContext context;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("USER");
		
		//관리자가 아닐경우
		if(member.getGrade()!=0) {
			String url = context.getContextPath() + "/login";
			response.sendRedirect("url");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
