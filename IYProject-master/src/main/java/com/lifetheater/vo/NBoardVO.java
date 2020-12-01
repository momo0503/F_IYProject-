package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NBoardVO {
  private int nb_num;
  private String nb_title;
  private String nb_cont;
  private int nb_hit;
  private String nb_date;
  private String nb_img_url;
  private String email;
  
//페이징(쪽나누기:paging) 관련 변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
	
	 //검색기능
	private String keyword;
	private String condition;
  
}
