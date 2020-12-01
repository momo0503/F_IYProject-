package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PBoardVO {
  private int pb_num;
  private String pb_title;
  private String pb_cont;
  private int pb_hit;
  private String pb_date;
  private String pb_img_url;
  private String email;
  
//페이징(쪽나누기:paging) 관련 변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
	
	 //검색기능
	private String keyword;
	private String condition;
  
}
