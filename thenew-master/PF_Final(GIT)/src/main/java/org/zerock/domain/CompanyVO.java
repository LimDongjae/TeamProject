package org.zerock.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class CompanyVO {
	private String compid;
	private String comppw;
	private String compname;
	private Date compdate;
	private String compcontent;
	private String compphone;
	private String compdomain;
	private Date regdate;

	private List<CompanyAuthVO> authList;
	
	// 비밀번호 일치 여부 체크
	public boolean isCheckedPasswd(String comppw) {
		if (comppw.equals(comppw)) {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return "CompanyCommand " + "[compid=" + compid + ", comppw=" + comppw + ", companyname=" + compname
				+ ", compdate=" + compdate + ", compcontent=" + compcontent + ", compphone=" + compphone
				+ ", compdomain=" + compdomain + ", regdate=" + regdate + "]";
	}
}
