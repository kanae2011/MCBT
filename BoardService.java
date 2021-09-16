package com.mcbt.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mcbt.board.vo.BoardVO;
import com.webjjang.util.PageObject;

public interface BoardService {

    // 목록 페이징
    public List<BoardVO> list(PageObject pageObject) throws Exception;
    // 검색처리된 게시글의 갯수
    public int countArticle(PageObject pageObject) throws Exception;
	
	// 2. 게시글 상세보기
	public BoardVO view(Long no, int inc, HttpSession session) throws Exception;
	// 3. 게시판 글쓰기
	public int write(BoardVO vo) throws Exception;
	// 4. 게시글 수정
	public int update(BoardVO vo) throws Exception;
	// 5. 게시글 삭제
	public int delete(BoardVO vo) throws Exception;
	
//	// 7. 게시글 첨부파일 목록
//	public List<String> getAttach(int no);
//	// 8. 게시글 첨부파일 삭제
//	public void deleteFile(String fullname);
}
