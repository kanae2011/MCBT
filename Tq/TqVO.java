package com.mcbt.tq.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TqVO {

	private Long no;
	private String id;
	private Date writeDate;
	private String accept;
	private String quiz;
	private String lev;
	private String right;

}