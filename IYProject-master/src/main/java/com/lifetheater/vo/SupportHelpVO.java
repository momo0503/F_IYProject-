package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SupportHelpVO {
  private int hno;
  private String quest;
  private String answer;
  private String field;
  private String email;
  private String edit_date;
  
  
  private String condition;
  private String keyword;
  
  private int startRow;
  private int endRow;
}
