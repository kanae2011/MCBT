package com.mcbt.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class MainController {

	private final String MODULE = "main";
	
	@GetMapping("/main.do")
	public String main() {
		log.info("main() 실행 중.............................");
		return MODULE + "/main";
	}
	
}
