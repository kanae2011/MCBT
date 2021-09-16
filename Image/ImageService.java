package com.mcbt.image.service;

import java.util.List;

import com.mcbt.image.vo.ImageVO;
import com.webjjang.util.PageObject;

public interface ImageService {
	
	// 1. 이미지 목록
	public List<ImageVO> list(PageObject pageObject) throws Exception;
	
	// 2. 이미지 보기
	public ImageVO view(Long no) throws Exception;
	
	// 3. 이미지 등록
	public int write(ImageVO vo) throws Exception;
	
	// 4-1. 이미지 파일 수정
	public int updateFile(ImageVO vo) throws Exception;
	
	// 4-2. 이미지 파일 수정
	public int update(ImageVO vo) throws Exception;

	// 5. 이미지 삭제
	public int delete(Long no) throws Exception;
	
	// 6. 리스트
//	public List<RankVO> rankList(PageObject pageObject) throws Exception;

}
