package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TListVO {
  private String theater_id;
  private String theater_name;
  private String sdate;
  private String edate;
  private String location_name;
  private String poster_url;
  private String tstate;
  private boolean openrun;
}
