package com.mcbt.rank.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mcbt.image.service.ImageService;
import com.mcbt.rank.service.RankService;
import com.mcbt.rank.vo.RankVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rank")
@Log4j
public class RankController {
	
	private final String MODULE = "rank";
	
	@Autowired
	@Qualifier("rsi")
	private RankService service;

	@Autowired
	@Qualifier("isi")
	private ImageService iservice;
	
	@GetMapping("/list.do")
	public String list(Model model, @ModelAttribute PageObject pageObject, @Param("lev") String lev) throws Exception {
		log.info("list().lev : " + lev + "---------------------");

//		List<RankVO> list = service.list(pageObject, lev);
//		log.info("list : " + list);
		
		model.addAttribute("list", service.list(pageObject, lev));
//		model.addAttribute("rank", service.rank(vo));
		model.addAttribute("ilist", iservice.list(pageObject));
		
		return MODULE + "/list";

	}
//	@GetMapping("/ilist.do")
//	public String ilist(Model model, @ModelAttribute PageObject pageObject) throws Exception {
//
//		model.addAttribute("ilist", iservice.list(pageObject));
//		
//		return MODULE + "/ilist";
//		
//	}	
	
}
