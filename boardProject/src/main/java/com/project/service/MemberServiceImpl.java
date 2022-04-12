package com.project.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.MemberDAO;
import com.project.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return memberDAO.userCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		memberDAO.updateMember(memberDTO);
	}
	
}
