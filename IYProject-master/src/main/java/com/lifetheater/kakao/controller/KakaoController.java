package com.lifetheater.kakao.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lifetheater.kakao.model.KakaoVO;
import com.lifetheater.kakao.service.KakaoAPI;
import com.lifetheater.service.UserService;
import com.lifetheater.vo.UserVO;

@RestController
public class KakaoController {
	
	@Autowired
	private KakaoAPI kakao;
	
	@Autowired
	private UserService service;
	
	@RequestMapping("/kakaoRedirect")
	public ModelAndView kakaoRedirect(@RequestParam("code") String code , HttpSession session,Model model) {//이걸 a라고할때
		String access_Token=kakao.getAccessToken(code);
		HashMap<String, Object> userInfo=kakao.getUserInfo(access_Token);
		System.out.println(userInfo);
		Gson gson=new Gson();
		String jsonuserinfo=gson.toJson(userInfo);
		System.out.println(jsonuserinfo);
		model.addAttribute("kakaouser", jsonuserinfo);
		return new ModelAndView("kakao/kakaologin");
	}
	
	
	//카카오 로그인(사용자 정보를 세션 "login" 이름으로 담음)
	@PostMapping("/kakaologin")
	public UserVO kakaologin(@RequestBody KakaoVO kakaoinfo ,HttpSession session) {
		System.out.println("카카로그인테스트");
		KakaoVO kakaouser=service.searchKakao(kakaoinfo);
		System.out.println("윽");
		
		
		
		if(kakaouser==null) {
			System.out.println("null값");
			service.kakaoinsert(kakaoinfo);
		}
		UserVO userVO=new UserVO();
		userVO.setEmail(kakaoinfo.getEmail());
		UserVO kakaouserVO=service.searchUser(userVO);
		if((kakaouserVO.getPhone()).length()>1) {
			session.setAttribute("login", kakaouserVO);
			}
		return kakaouserVO;	
	}
	
	//카카오 로그인시 부족한 정보를 넣어줌
	@PostMapping("/kakaomoreinsert")
	public UserVO kakaomoreinsert(@RequestBody UserVO userinfo) {
		System.out.println(userinfo.getEmail());
		service.kakaoupdate(userinfo);
		UserVO user=service.searchUser(userinfo);
		return user;
	}
	
	
}
