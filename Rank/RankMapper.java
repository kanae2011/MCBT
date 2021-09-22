package com.mcbt.rank.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mcbt.rank.vo.RankVO;
import com.webjjang.util.PageObject;

public interface RankMapper {

	// 리스트
	public List<RankVO> list(PageObject pageObject, @Param("lev") String lev) throws Exception;
	
	// 순위
	public Long rank(RankVO vo) throws Exception;
	
//	// 전체 데이터
//	public Long getTotalRow(PageObject pageObject);
	
//	public List<ImageVO> glist(PageObject pageObject, ImageVO vo) throws Exception;

}
