package com.mcbt.solve.controller;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mcbt.member.vo.LoginVO;
import com.mcbt.solve.service.SolveService;
import com.mcbt.solve.vo.SolveVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/solve")
@Log4j
public class SolveController {

	private final String MODULE = "solve";
	
	@Autowired
	@Qualifier("ssi")
	private SolveService service;
	
	@GetMapping("/main.do")
	public String main() {
		log.info("main() 실행 중..............................");
		return MODULE + "/main";
	}
	
	// 랜덤으로 문제 번호 10개 가져오기
	@GetMapping("/random.do")
	public String random(HttpSession session, String lev) throws Exception {
		log.info("random() 실행 중.....................");
		
		session.setAttribute("lev", lev);
		Long cnt = service.getCnt(lev);
		log.info("lev : " + lev);
		
		int [] lotto = new int[10];
		  
		  // 중복되지 않는 7개의 숫자를 발생시켜서 저장
		  for(int i = 0 ; i < lotto.length; i++) {
		   // 1~45까지의 랜덤 숫자를 발생
		   int ran = (int)(Math.random()*cnt +1);
		   // 중복이 되는 지 결과를 저장하는 변수 - boolean
		   boolean isDuplicate = false;
		   // 중복이 되지는 검사를 한다.
		   for(int j = 0; j <= i; j++) {
		    // 데이터가 중복이 되는 경우
		    if(lotto[j]==ran) {
		     isDuplicate = true;
		     // 중복이 된 경우는 뒤의 데이터를 더이상 검사를 안해도 되므로
		     // 검사하는 for문을 빠져 나가면 된다.
		     break;
		    }
		   }
		   // 중복이 되지 않으면 저장, 중복이되면 i-- 시킨다.
		   if(isDuplicate)i--;
		   else lotto[i] = ran;
		  }
		  
		  // lotto Data 출력 -rnum에 해당. no를 찾아야 함
		  System.out.println(Arrays.toString(lotto));
		  int[] random = lotto;
		  
		  int [] nos = service.random(lev, random);
		  
		  System.out.println("nos : " + Arrays.toString(nos));
		   
		  session.setAttribute("nos", nos);
		  
		  // 문제 푼 사용자 아이디 가져오기
		  LoginVO loginVO = (LoginVO) session.getAttribute("login");
		  log.info("write().loginVO : " + loginVO);
		  
		  loginVO.setId(loginVO.getId());
		  session.setAttribute("id", loginVO.getId());
		  log.info("session.id : " + session.getAttribute("id"));
			
		  // 문제 푼 회차 계산하기
		  String id = (String) (session.getAttribute("id"));
			
		  Long getMax = (long) (service.getMax(id) + 1);
		  session.setAttribute("turn", getMax);
		  Long turn = (Long) session.getAttribute("turn");	
		  log.info("getMax.turn : " + turn);
		  
		  return "redirect:solve.do?idx=1";
	}

	@GetMapping("/solve.do")
	public String solve(HttpSession session, Model model, int idx) throws Exception {
		
		log.info("solve() 실행 중.............................");
		
		int[] nos = (int[]) session.getAttribute("nos");
		
		int no = nos[idx-1];
		
		
		model.addAttribute("vo", service.quiz(no));
		
		model.addAttribute("ex", service.ex(no));
		
		return MODULE + "/solve";
	}	
	
	// 다음 문제로 넘어가는 메서드
	@PostMapping("/next.do")
	public String next(SolveVO vo, int idx, HttpSession session) throws Exception {
		log.info("next() 실행 중.............................");
		
		// session에서 turn꺼내서 vo에 넣기
		Long turn = (Long) session.getAttribute("turn");
		String id = (String) (session.getAttribute("id"));
		// session에서 lev 꺼내기
		String lev = (String) session.getAttribute("lev");
		
		vo.setLev(lev);
		vo.setTurn(turn);
		vo.setId(id);
		
		if(vo.getPick() == null) {
			log.info("정답미체크");
			return "redirect:solve.do?idx=" + idx;
		}
		
		service.next(vo);
		log.info("vo : " + vo);
		
		idx = idx + 1;
		log.info("next().idx : " + idx);
		
		if (idx == 11)
			return "redirect:result.do";
		
		return "redirect:solve.do?idx=" + idx;
	}
	
	@GetMapping("/result.do")
	public String result(SolveVO vo, Model model, HttpSession session) throws Exception {
		log.info("result() 실행 중......................");
		
		String id = (String) (session.getAttribute("id"));
		vo.setId(id);
		
		// session에서 turn꺼내서 vo에 넣기
		Long turn = (Long) session.getAttribute("turn");
		vo.setTurn(turn);
		
		Long correct = service.score(vo);
		log.info("result.correct : " + correct);
		
		// session에서 lev 꺼내기
		String lev = (String) session.getAttribute("lev");
		vo.setLev(lev);

		service.scoreIn(vo, correct);
		
		Long score = correct * 10;
		log.info("result.score : " + score);
		model.addAttribute("score", score);
		
		
		return MODULE + "/result";
	}
	
	@GetMapping("/view.do")
	public String view() {
		log.info("view() 실행 중............................");
		return "redirect:answer.do?idx=1";
	}
	
	@GetMapping("/answer.do")
	public String answer(HttpSession session, Model model, int idx) throws Exception {
		
		log.info("answer() 실행 중.............................");
		
		int[] nos = (int[]) session.getAttribute("nos");
		
		int no = nos[idx-1];
		
		log.info("answer.no : " + no);
		
		model.addAttribute("vo", service.answerQuiz(no));
		
		model.addAttribute("ex", service.answerEx(no));
		
		return MODULE + "/answer";
	}	
	
	// 다음 문제로 넘어가는 메서드
	@GetMapping("/answerNext.do")
	public String answerNext(SolveVO vo, int idx) throws Exception {
		log.info("answerNext() 실행 중.............................");
		
		idx = idx + 1;
		log.info("answerNext().idx : " + idx);
		
		return "redirect:answer.do?idx=" + idx;
	}
	
	// 이전 문제로 넘어가는 메서드
	@GetMapping("/answerBefore.do")
	public String answerBefore(SolveVO vo, int idx) throws Exception {
		log.info("answerBefore() 실행 중.............................");
		
		idx = idx - 1;
		log.info("answerBefore().idx : " + idx);
		
		return "redirect:answer.do?idx=" + idx;
	}
	
	@GetMapping("/auth_error.do")
	public String error() {
		log.info("error() 실행 중...................");
		return MODULE + "/auth_error";
	}
}
