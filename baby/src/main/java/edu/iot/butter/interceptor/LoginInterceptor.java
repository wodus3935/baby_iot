package edu.iot.butter.interceptor;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import edu.iot.butter.model.Member;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	ServletContext context;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();

		
		if(session.getAttribute("USER")==null) {
			saveUrl(request, response);
			response.sendRedirect(context.getContextPath()+ "/login");
			return false;
		}
		//다음 핸들러로 이동! (모든 핸들러가 true가 될 경우 controller실행)
		return super.preHandle(request, response, handler);
	}
	
	public void saveUrl(HttpServletRequest request, HttpServletResponse response) {
		
		//get RequestURI는 butter/gallery까지 구한다 그리고, substring(index)는 index지점부터 끝까지 끉어서 리턴해버리는 메서드!
		String url = request.getRequestURI().substring(context.getContextPath().length());
				
		String query=request.getQueryString();
		if(query !=null) {
			url = url + "?" + query;
		}
		
		//세션에있는 정보를 저장했다가 바로 지워주는 거 (걍 외워~~)
		FlashMap flashMap = new FlashMap();
		flashMap.put("url", url);
		FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
		flashMapManager.saveOutputFlashMap(flashMap, request, response);
	}
}
