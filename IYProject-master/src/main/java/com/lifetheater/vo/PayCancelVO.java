package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PayCancelVO {
  private String cancel_code;
  private int res_cost;
  private String pay_date;
  private String cancel_date;
  private String email;
}
