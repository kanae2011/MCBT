package com.mcbt.member.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import com.mcbt.board.vo.BoardVO;
import com.mcbt.member.vo.LoginVO;
import com.mcbt.member.vo.MemberVO;
import com.mcbt.member.vo.WriteVO;
import com.webjjang.util.PageObject;

public interface MemberService  {

	//리스트 
	public List<MemberVO> list() throws Exception;
	
	//회원뷰
	public MemberVO view(String id) throws Exception;
	
	
	public LoginVO login(LoginVO vo) throws Exception;

	//회원가입
	//3. 게시판 글쓰기
	public int write(WriteVO vo) throws Exception;
	
	//회원 수정
	public int update(MemberVO vo) throws Exception;
	
	//탈퇴
	public int delete(MemberVO vo) throws Exception; 

}
