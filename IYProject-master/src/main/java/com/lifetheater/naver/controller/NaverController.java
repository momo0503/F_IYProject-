package com.lifetheater.naver.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.lifetheater.naver.login.NaverInfo;
import com.lifetheater.naver.model.NaverVO;
import com.lifetheater.service.UserService;
import com.lifetheater.vo.UserVO;

@RestController
public class NaverController {
	
	@Autowired
	 private UserService service;
	
	
	
	@RequestMapping("/navercallback")
	public ModelAndView naverLogin(HttpServletRequest request) throws Exception{
		System.out.println("1");
		return new ModelAndView("naver/callback");
	}
	
	
	//네이버에서 정보를 받아옴
	@GetMapping("/naverinfo")
	public String naverinfo(@RequestParam("access_token") String token, HttpServletRequest request)throws Exception{
		NaverInfo naverinfo=new NaverInfo();
		System.out.println("야");
		
			
	        String header = "Bearer " + token; // Bearer 다음에 공백 추가

	        String apiURL = "https://openapi.naver.com/v1/nid/me";

	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("Authorization", header);
	        String responseBody = naverinfo.get(apiURL,requestHeaders);
	        
	        System.out.println(responseBody);
	        
	        return responseBody;
	        
	        
}
	
	//네이버 로그인 요청(사용자 정보를 세션 "login" 이름으로 담음)
	@PostMapping("/naverlogin")
	public UserVO login(@RequestBody NaverVO info,HttpSession session) {
		System.out.println("sdsdsdd");
		
		NaverVO naveruser=service.searchNaver(info);
		if(naveruser==null) {
			service.naverinsert(info);
		}
			UserVO userVO=new UserVO();
			userVO.setEmail(info.getEmail());
			UserVO naveruserVO=service.searchUser(userVO);
			if((naveruserVO.getPhone()).length()>1) {
			session.setAttribute("login", naveruserVO);
			}
			return naveruserVO;
			
	}
	
	
	//네이버로 로그인시 부가적인 정보추가
	@PostMapping("/navermoreinsert")
	public UserVO navermoreinsert(@RequestBody UserVO userinfo) {
		System.out.println(userinfo.getEmail());
		service.naverupdate(userinfo);
		UserVO user=service.searchUser(userinfo);
		
		return user;
	}
	
		
	
}
