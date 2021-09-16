package com.mcbt.image.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mcbt.image.mapper.ImageMapper;
import com.mcbt.image.vo.ImageVO;
import com.webjjang.util.PageObject;

@Service
@Qualifier("isi")
public class ImageServiceImpl implements ImageService{
	
	@Inject // 자동 DI 적용
	private ImageMapper mapper;
	
	// 1. 이미지 목록
	@Override
	public List<ImageVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		// pageObject의 전체데이터를 받아서 셋팅 -> 화면의 페이지네이션 출력을 위함
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	// 2. 이미지 보기
	@Override
	public ImageVO view(Long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	// 3. 이미지 등록
	@Override
	public int write(ImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	// 4-1. 이미지 파일 수정
	@Override
	public int updateFile(ImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateFile(vo);
	}

	// 4-2. 이미지 정보 수정
	@Override
	public int update(ImageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 5. 이미지 삭제 
	@Override
	public int delete(Long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}
	// 6. 순위게시판
//	@Override
//	public List<RankVO> rankList(PageObject pageObject) throws Exception {
//		// TODO Auto-generated method stub
//		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
//		log.info("pageObject : " + pageObject);
//		return mapper.rankList(pageObject);
//	}
//	
	
}
