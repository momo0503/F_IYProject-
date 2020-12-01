package com.lifetheater.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PaymentVO {
  private String pay_code;
  private String pay_way;
  private String pay_date;
  private int total_cost;
  private int dc_cost;
  private int res_cost;
}
