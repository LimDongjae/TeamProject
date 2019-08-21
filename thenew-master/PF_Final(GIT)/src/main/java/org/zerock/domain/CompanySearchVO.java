package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CompanySearchVO {

	private String CompId;
	private String CompPw;
	private String CompName;
	private int CompPhone;
	private String CompDate;
	private String CompDomain;
	private String CompContent;
	private Date Regdate;
	private Date Updatedate;

	
}
