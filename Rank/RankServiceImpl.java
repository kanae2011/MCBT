package com.mcbt.rank.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.rank.mapper.RankMapper;
import com.mcbt.rank.vo.RankVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;


@Service
@Qualifier("rsi")
@Log4j
public class RankServiceImpl implements RankService {
	
	@Inject
	private RankMapper mapper;
	
	@Override
	public List<RankVO> list(PageObject pageObject, @Param("lev")String lev) throws Exception {
		// TODO Auto-generated method stub
		log.info("lev : " + lev);
		return mapper.list(pageObject, lev);
	}

	@Override
	public Long rank(RankVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.rank(vo);
	}

//	@Override
//	public List<ImageVO> glist(PageObject pageObject, ImageVO vo) throws Exception {
//		// TODO Auto-generated method stub
//		return mapper.glist(pageObject, vo);
//	}

}
