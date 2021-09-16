package com.mcbt.image.mapper;

import java.util.List;

import com.mcbt.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageMapper {
	
	// 1. 이미지 갤러리 목록
	public List<ImageVO> list(PageObject pageObject) throws Exception;
	
	// 1-1. 전체 데이터의 갯수 - 화면 표시용 - 페이지네이션
	public Long getTotalRow(PageObject pageObject) throws Exception;
	
	// 2. 이미지 보기
	public ImageVO view(Long no) throws Exception;
	
	// 3. 이미지 등록
	public int write(ImageVO vo) throws Exception;
	
	// 4-1. 이미지 파일 수정
	public int updateFile(ImageVO vo) throws Exception;
	
	// 4-2. 이미지 정보 수정 - 제목, 내용
	public int update(ImageVO vo) throws Exception;

	// 5. 이미지 삭제
	public int delete(Long no) throws Exception;
	
	
}
