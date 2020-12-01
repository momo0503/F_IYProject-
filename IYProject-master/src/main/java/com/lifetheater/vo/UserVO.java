package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class UserVO {
	private String email; //이메일
	private String pw;		//비밀번호
	private String name;	//이름
	private String regDate;	//가입날짜
	private Integer point;	//보유포인트
	private String userKey;		//인증
	private char membertype; 	//회원 구분 0:탈퇴,1:일반,2:공연관계자,3:관리자
	private String phone;	//폰번호
	private String loginWay;	//로그인 방식  일반,카카오,네이버
	private String prefTheater01;	//선호극장
	private String prefTheater02;
	private String prefTheater03;
	private String belong;
	
	  private Boolean autologin; //자동 로그인
	  private Boolean loginsave; //로그인 정보 저장
	 }

