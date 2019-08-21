package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EstiReplyVO {

  private Long rno;
  private Long eno;
  
  private String compname;
  private String compphone;
  
  private String price;
  
  private String reply;
  private String replyer;
  private Date replyDate;
  private Date updateDate;

}
