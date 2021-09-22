package com.mcbt.tq.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TqReplyVO {
	
	private long rno;
	private long no;
	private String content;
	private String id;
	private Date writeDate;

}