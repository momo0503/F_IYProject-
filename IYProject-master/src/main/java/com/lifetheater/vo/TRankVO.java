package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TRankVO {
  private String location; //지역
  private String playtime; //상영시간
  private String location_name;	//극장 이름
  private String theater_name;	// 연극 이름
  private int rank;	//랭킹
  private String poster_url;	//포스터 링크
  private String theater_id;	// 연극 코드
}
