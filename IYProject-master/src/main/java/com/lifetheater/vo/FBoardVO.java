package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FBoardVO {
  private int fb_num;
  private String fb_title;
  private String fb_cont;
  private int fb_hit;
  private String fb_date;
  private String fb_img_url;
  private String email;
  
//페이징(쪽나누기:paging) 관련 변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
	
	 //검색기능
	private String keyword;	// 검색어
	private String condition; //조건
}
