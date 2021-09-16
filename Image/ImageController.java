package com.mcbt.image.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mcbt.member.vo.LoginVO;
import org.zerock.util.file.FileUtil;

// import static .. FileUtil.* -> 모든 메소드를 메소드 이름만으로 실행 가능
import static org.zerock.util.file.FileUtil.*;

import com.mcbt.image.service.ImageService;
import com.mcbt.image.vo.ImageVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/image")
public class ImageController {
	
	private final String MODULE = "image";
	
	// 저장 할 위치 - 운영되는 서버에서부터 찾는 상대 위치
	String path = "/upload/image/";
	
	@Autowired
	@Qualifier("isi")
	private ImageService service;
	
	// 1. 이미지 갤러리 목록
	@GetMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model, HttpSession session) throws Exception {
		// jsp의 정보 리턴
		
		if(pageObject.getPerPageNum() == 10)
			pageObject.setPerPageNum(8);
		
		log.info("list().pageObject : " + pageObject);
		
		// 강제 로그인 시킨다.
//		LoginVO vo = new LoginVO();
//		vo.setId("test");
//		vo.setGradeNo(1);
//		session.setAttribute("login", vo);
		
		model.addAttribute("list", service.list(pageObject));
		
		// jsp의 리턴 정보
		return MODULE + "/list";
	}
	
	@GetMapping("/view.do")
	// 2. 이미지 보기
	public String view(Long no, @ModelAttribute PageObject pageObject, Model model) throws Exception {
		
		log.info("view().no : " + no);
		
		model.addAttribute("vo", service.view(no));
		
		// jsp의 리턴 정보
		return MODULE + "/view";
	}
	
	@GetMapping("/write.do")
	// 3. 이미지 등록
	public String writeForm() {
		
		return MODULE + "/write";
	}

	@PostMapping("/write.do")
	// 4. 이미지 등록 처리
	public String write(ImageVO vo, Long perPageNum, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		log.info("writeForm() - ....이미지 등록에서 새로고침 하지말고 뒤로가서 새로고침 하고와(세션)");


		
		// 실제적으로 저장이되는 위치
//		String realPath = request.getServletContext().getRealPath(path);
//		FileUtil.getRealPath를 import static으로 등록이 되어있어야 한다.
		String realPath = getRealPath(request, path);
		
		log.info("realPath : " + realPath);
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		log.info("loginVO : " + loginVO);
		
		// 전달받지 않는 데이터의 수집
		vo.setId(loginVO.getId());
		String fileName = vo.getMultipartFile().getOriginalFilename();
		File imageFile = FileUtil.noDuplicate(realPath + fileName);
		vo.setFileName(path + imageFile.getName());
		
		log.info("write().vo - ...." + vo);
//		log.info("write().vo.getMultipartFile : " + vo.getMultipartFile().getOriginalFilename());
		
		// 전달된 파일을 저장하는 처리
		vo.getMultipartFile().transferTo(imageFile);
		
		// DB에 정보(vo) 저장
		service.write(vo);
		
		// 사용자에게 처리 내용을 보여줄 메시지를 보낸다.
		rttr.addFlashAttribute("msg", "잘했다");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
		
	}
	
	// 이미지 파일 바꾸기 처리
	@PostMapping("/updateFile.do")
	public String updateFile(ImageVO vo, PageObject pageObject, String deleteFile, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String realPath = request.getServletContext().getRealPath(path);
		
		// 넘어오는 정보 확인
		log.info("updateFile().vo : " + vo); 
		log.info("updateFile().pageObject : " + pageObject); 
		log.info("updateFile().deleteFile : " + deleteFile); 
		
		// 원본 파일 삭제
//		String deleteFileRealPath = request.getServletContext().getRealPath(deleteFile);
		String deleteFileRealPath = getRealPath(request, deleteFile);
		log.info("updateFile().deleteFileRealPath : " + deleteFileRealPath);
		FileUtil.delete(FileUtil.toFile(deleteFileRealPath));
		
		// 전달된 파일을 중복 배체해서 저장
		String fileName = vo.getMultipartFile().getOriginalFilename();
//		File imageFile = FileUtil.noDuplicate(realPath + fileName);
		// FileUtil.noDuplicate import static 선언하면 메소드만 사용가능 -> FileUtil.* 선언해서 모든 메소드에 적용 가능
		File imageFile = noDuplicate(realPath + fileName);
		vo.setFileName(path + imageFile.getName());
		
		log.info("write().vo - ...." + vo);
//		log.info("write().vo.getMultipartFile : " + vo.getMultipartFile().getOriginalFilename());
		
		// 전달된 파일을 서버에 저장하는 처리
		vo.getMultipartFile().transferTo(imageFile);
		
		// 사용자에게 처리 내용을 보여줄 메시지를 보낸다.
		rttr.addFlashAttribute("msg", "잘했다");
		
		// DB에 파일 정보 수정
		service.updateFile(vo);

		return "redirect:view.do?no=" + vo.getNo() + "&page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	}
	
	// 4-1. 이미지 정보 변경
	@GetMapping("/update.do")
	public String updateForm(Long no, Model model) throws Exception {
		
		// DB에서 no에 맞는 정보를 가져와서 model에 넣는다
		model.addAttribute("vo", service.view(no));
		
		return MODULE + "/update";
	}
	
	// 4-2. 이미지 정보 변경 처리
	@PostMapping("/update.do")
	public String update(ImageVO vo, PageObject pageObject, RedirectAttributes rttr) throws Exception {
		
		// DB에서 no에 맞는 정보를 가져와서 model에 넣는다
		service.update(vo);
		
		// 사용자에게 처리 내용을 보여줄 메시지를 보낸다.
		rttr.addFlashAttribute("msg", "잘했다");
		
		// 정보가 수정이 되면 이미지 보기로 이동시킨다.
		return "redirect:view.do?no=" + vo.getNo() + "&page=" + pageObject.getPage() + "&perPageNum=" + pageObject.getPerPageNum();
	
	}
	// 5. 이미지 정보 삭제
	@GetMapping("/delete.do")
	public String delete(Long no, String deleteFile, Long perPageNum, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		log.info("no : " + no + ", deleteFile : " + deleteFile + ", perPageNum : " + perPageNum);
		
		// DB에서 파일 삭제 : Controller - Service - Mapper
		int result = service.delete(no);
		if(result == 0) throw new Exception("이미지 삭제 실패");

		// DB에서 삭제가 완료 되었다.
		// 서버에서 파일 삭제 - 실제적인 위치와 파일이 필요
//		getRealPath() - FileUtil.getRealPath()을 import static 선언
		if(!FileUtil.delete(getRealPath(request, deleteFile))) throw new Exception("이미지 삭제 실패");;
		
		// 사용자에게 처리 내용을 보여줄 메시지를 보낸다.
		rttr.addFlashAttribute("msg", "잘했다");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 6. 순위게시판 & 상품관리게시판 썸네일
//	@GetMapping("/rankList.do")
//	public String rankList(Model model, @ModelAttribute PageObject pageObject, RankVO vo, HttpSession session) throws Exception {
//		log.info("rankList().pageObject : " + pageObject + "---------------------");
//		
//		model.addAttribute("list", service.rankList(pageObject));
//		
//		return MODULE + "/rankList";
//	}
	
}
