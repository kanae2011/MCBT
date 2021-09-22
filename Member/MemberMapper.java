package com.mcbt.member.mapper;

import java.util.List;

import com.mcbt.board.vo.BoardVO;
import com.mcbt.member.vo.LoginVO;
import com.mcbt.member.vo.MemberVO;
import com.mcbt.member.vo.WriteVO;

public interface MemberMapper {

	//리스트
	public List<MemberVO> list() throws Exception;
	
	//회원뷰
	public MemberVO view(String id) throws Exception;
	
	//로그인
	public LoginVO login(LoginVO vo);
	// 
	public int write(WriteVO vo) throws Exception;
	
	//회원정보수정
	public int update(MemberVO vo) throws Exception;
	
	//탈퇴
	public int delete(MemberVO vo) throws Exception;
}
