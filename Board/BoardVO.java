package com.mcbt.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long no;
	private String title;
	private String content;
	private String writer;
	private Date writedate;
	private Long hit;
	private Long replyhit;
	private String show;
	private String category;
	
}
