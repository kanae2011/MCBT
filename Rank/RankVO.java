package com.mcbt.rank.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RankVO {
	
	private Long no;
	private String id;
	private Long score;
	private Date testDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDay;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDay;
//	private Date date;
	private String lev;
	private Long count;
	
}
