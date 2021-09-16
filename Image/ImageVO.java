package com.mcbt.image.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {
	
	private Long no;
	private String title;
	private String content;
	private String id;
	private Date writeDate;
	private String fileName;
	// 파일 한 개를 첨부 - 처리를 위한 변수
	private MultipartFile multipartFile;
	
//	private Long score;
//	private Date testDate;
}
