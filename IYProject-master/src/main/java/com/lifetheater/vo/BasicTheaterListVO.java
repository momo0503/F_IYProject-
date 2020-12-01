package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BasicTheaterListVO {
	private int td_no;
	private String email;
	private String td_title;
	private String td_viewdays;
	private String td_agegrade;
	private String td_actor;
	private String td_tinfo;
	private String td_mainposter;
	private String td_detailposter;
	private int td_tiketingdate;
	private String td_tiketinginfo;
	private char td_check;
	private String td_signUp_date;
	private String td_location;
	
	//페이징(쪽나누기:paging) 관련 변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
			
	//검색기능
	private String keyword;	// 검색어
	private String condition; //조건
	
	
	
}

