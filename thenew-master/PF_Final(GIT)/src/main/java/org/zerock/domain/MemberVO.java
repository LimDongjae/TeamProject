package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	private String useremail;
	private boolean enabled;

	private Date regdate;
	private Date updatedate;
	private List<AuthVO> authList;

	// 비밀번호 일치 여부 체크
	public boolean isCheckedPasswd(String userPasswd) {
		if (userpw.equals(userPasswd)) {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return "MemberCommand " + "[userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", userphone="
				+ userphone + ", useremail=" + useremail + ", regdate=" + regdate + "]";
	}
}
