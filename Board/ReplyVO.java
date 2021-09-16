package com.mcbt.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Integer rno;
	private Integer no;
	private String replyer;
	private String pw;
	private String replyContent;
	private Date replyDate;
	
}
