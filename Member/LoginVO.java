package com.mcbt.member.vo;

import lombok.Data;

@Data
public class LoginVO {

	private String id;
	private String pw;
	private String name;
	private String alias;
	private String gender;
	private String birth;
	private String tel;
	private String email;
	private int gradeNo;
	
}
