package com.mcbt.board.mapper;

import java.util.List;

import com.mcbt.board.vo.BoardVO;
import com.webjjang.util.PageObject;

public interface BoardMapper {

	// 1. 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<BoardVO> list(PageObject pageObject);
	
	public int getTotalRow(PageObject pageObject);
	
	public int countArticle(PageObject pageObject);

	// 2. 게시판 보기
	public BoardVO view(Long no);
	public int increase(Long no);
	
	// 3. 게시글 작성
	public int write(BoardVO vo);
	// 4. 게시글 수정
	public int update(BoardVO vo);
	// 5. 게시글 삭제
	public int delete(BoardVO vo);
	
//	// 7. 게시물 첨부파일 추가
//	public void addAttach(String fullName);
//	// 8. 게시물 첨부파일 목록
//	public List<String> getAttach(int bno);
//	// 9. 게시글 첨부파일 삭제처리
//	public void deleteFile(String fullname);
//	// 10. 게시글 첨부파일 업데이트처리
//	public void updateAttach(String fullName, int bno);
	
}
