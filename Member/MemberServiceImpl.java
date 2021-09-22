package com.mcbt.member.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.board.vo.BoardVO;
import com.mcbt.member.mapper.MemberMapper;
import com.mcbt.member.vo.LoginVO;
import com.mcbt.member.vo.MemberVO;
import com.mcbt.member.vo.WriteVO;

// 자동 생성
@Service
@Qualifier("msi")
public class MemberServiceImpl implements MemberService {

	// 자동 DI- Mapper
	@Inject
	private MemberMapper mapper;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberVO> list() throws Exception{
		return mapper.list();
	}
	
	@Override
	public MemberVO view(String id) throws Exception {
		return mapper.view(id);
	}
	
	@Override
	public LoginVO login(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}
	@Override
	public int write(WriteVO vo) throws Exception{
		return mapper.write(vo);
	}

	@Override
	public int update(MemberVO vo) throws Exception {
		
		return mapper.update(vo);
	}
	
	@Override
	public int delete(MemberVO vo) throws Exception{
		return mapper.delete(vo);
	}

}
