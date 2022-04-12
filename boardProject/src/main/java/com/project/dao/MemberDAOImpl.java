package com.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.MemberDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.project.mappers.memberMapper";
	
	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}
	
	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne(namespace+".getMember", id);
	}
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		sqlSession.insert(namespace+".insertMember", memberDTO);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		sqlSession.update(namespace+".updateMember", memberDTO);
	}
	
}
