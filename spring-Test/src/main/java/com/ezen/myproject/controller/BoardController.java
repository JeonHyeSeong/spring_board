package com.ezen.myproject.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.myproject.domain.BoardVO;
import com.ezen.myproject.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Inject
	private BoardService bsv;
	
	@GetMapping("/register")
	public String boardRegisterGet() {
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardVO bvo) {
		log.info(">>> "+bvo.toString());
		int isOk = bsv.register(bvo);
		log.info(">>> board register "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		List<BoardVO> list = bsv.getList();
		log.info(">>> getList > "+list);
		model.addAttribute("list",list);
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model model, @RequestParam("bno")int bno) {
		log.info(">>>> detail bno > "+bno);
		BoardVO bvo = bsv.getDetail(bno);
		model.addAttribute("bvo", bvo);
	}
	
	// 수정할 때 들어가는 부당 read_count 2개 빼주기
	@PostMapping("/modify")
	public String modify(BoardVO bvo, RedirectAttributes rttr) {
		int isOk = bsv.modify(bvo);
		log.info(">>> board modify "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr) {
		log.info(">>>> remove bno > "+bno);
		int isOk = bsv.remove(bno);
		rttr.addFlashAttribute("isOk", isOk);
		return "redirect:/board/list";
	}

}
