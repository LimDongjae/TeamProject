package org.zerock.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.domain.CompanyVO;

import lombok.Getter;

@Getter
public class CompanyUser extends User {

	private static final long serialVersionUID = 1L;

	private CompanyVO company;

	private String compname;
	private String compphone;
	
	public CompanyUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CompanyUser(CompanyVO vo) {

		super(vo.getCompid(), vo.getComppw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.company = vo;
		this.compname = vo.getCompname();
		this.compphone = vo.getCompphone();
	}
}
