package com.project.dao;

import com.project.domain.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO userCheck(MemberDTO memberDTO);
	public MemberDTO getMember(String id);
	
	public void insertMember(MemberDTO memberDTO);
	public void updateMember(MemberDTO memberDTO);
	
}
