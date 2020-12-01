 package com.lifetheater.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.lifetheater.service.UserService;
import com.lifetheater.vo.UserVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private UserService service;
	
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	
	HttpSession session=request.getSession();
	//이름에 해당하는 쿠키를 가져와 저장
	Cookie loginCookie=WebUtils.getCookie(request,"loginCookie");
	
	if(loginCookie!=null) {
		//쿠키에서 세션 아이디를 가져와 db에서 회원의 세션id값 조회후 회원정보를 가져옴
		UserVO id=new UserVO();
		id.setEmail(loginCookie.getValue());
		UserVO user=service.searchUser(id);
		
		//회원 정보를 가져올시 세션에 가져온 회원 정보값을 넣음
		if(user!=null) {
			session.setAttribute("login", user);
		}
		
	}
	
	
	return true;
}
}
