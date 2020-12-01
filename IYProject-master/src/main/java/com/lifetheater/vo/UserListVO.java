package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserListVO {
	  private String email;
	  private char membertype; 	//회원 구분 0:탈퇴,1:일반,2:공연관계자,3:관리자
	  private String reg_date;	//가입날짜
	  private String name;	//이름
	  private String phone;	//폰번호
	  private String belong;//소속
	  
	  	//페이징(쪽나누기:paging) 관련 변수
		private int startrow;//시작행 번호
		private int endrow;//끝행 번호
		
		 //검색기능
		private String keyword;	// 검색어
		private String condition; //조건
}
