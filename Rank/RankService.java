package com.mcbt.rank.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mcbt.rank.vo.RankVO;
import com.webjjang.util.PageObject;

public interface RankService {

	// 리스트
	public List<RankVO> list(PageObject pageObject, @Param("lev") String lev) throws Exception; 
		
//	// 순위
	public Long rank(RankVO vo) throws Exception;
	
	// 상품 썸네일
//	public List<ImageVO> glist(PageObject pageObject, ImageVO vo) throws Exception;
	
}
