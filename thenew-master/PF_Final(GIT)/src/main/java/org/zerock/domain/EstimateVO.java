package org.zerock.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class EstimateVO {
	  private Long eno;
	  private String name;
	  private String phone;
	  private String title;
	  private String departure;
	  private String arrive;
	  private String move;
	  
	  private Date depDate;
	  private String content;

	  private Date regDate;
	  private Date updateDate;
	  private String status;
	  
	  private int replyCnt;
	  
	  private List<EstimateAttachVO> attachList;
}
