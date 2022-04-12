package com.project.service;

import com.project.domain.MemberDTO;

public interface MemberService {
	
	public MemberDTO userCheck(MemberDTO memberDTO);
	public MemberDTO getMember(String id);
	
	public void insertMember(MemberDTO memberDTO);
	public void updateMember(MemberDTO memberDTO);
}
