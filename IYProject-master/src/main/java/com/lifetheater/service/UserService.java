package com.lifetheater.service;

import javax.servlet.http.HttpServletRequest;

import com.lifetheater.kakao.model.KakaoVO;
import com.lifetheater.naver.model.NaverVO;
import com.lifetheater.vo.UserVO;

public interface UserService {

	void mailSendWithUserKey(UserVO user, HttpServletRequest request);

	String confirmEmail(UserVO user);

	void change_key(UserVO user);

	String confirmPhone(UserVO user);
	
	//사용자 정보 조회
		UserVO searchUser(UserVO id);
		
		//사용자 아이디 찾기
		UserVO searchid(UserVO id);
		
		//사용자 비밀번호 변경페이지 요청
		UserVO searchpw(UserVO pw);
		
		//사용자 비밀번호 변경
		void pwupdate(UserVO pw);
		
		
		//네이버 로그인 조회
			NaverVO searchNaver(NaverVO id);
			
			//네이버 아이디 db저장
			void naverinsert(NaverVO insert);
			
			//네이버 최종수정아이디 db업데이트
			void naverupdate(UserVO update);
			
			//카카오 로그인 조회
			KakaoVO searchKakao(KakaoVO id);
			
			//카카오 아이디 db저장
			void kakaoinsert(KakaoVO insert);
			
			//카카오 최종수정아이디 db업데이트
			void kakaoupdate(UserVO update);
	

}
