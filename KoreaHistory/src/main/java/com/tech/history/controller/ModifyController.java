package com.tech.history.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.history.service.JoinMemberServiceImpl;
import com.tech.history.service.MemberService;
import com.tech.history.service.ModifyMemberServiceImpl;

@Controller
public class ModifyController {

	MemberService memberService;
	
	@RequestMapping("/modify/modify")
	public String modify(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
//		String id = request.getParameter("id");
//		String name = request.getParameter("name");
		
		String id =	(String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		
		session.setMaxInactiveInterval(18000);
		return "modify/modify";
	}
	@RequestMapping(method=RequestMethod.POST ,value="/modifyProc")
	public String joinProc(HttpServletRequest request, Model model) {
		System.out.println("modifyProc Passing");
		
		model.addAttribute("request", request);
		memberService = new ModifyMemberServiceImpl();
		memberService.execute(model);
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
//		System.out.println("id : "+id);
//		System.out.println("name : "+name);
		
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		
//		return "redirect:/";  //아예 맨처음 화면, 대문으로 보내기
		return "redirect:Html"; //기능 구현 테스트 화면으로 보내기
	}
	
	@RequestMapping("/gohome")
	public String gohome(HttpServletRequest request, Model model) {
		
		System.out.println("gohome 지나감");
		
//		HttpSession session = request.getSession();
//		
//		String id =	(String)session.getAttribute("id");
//		String name = (String)session.getAttribute("name");
//		
//		model.addAttribute("id", id);
//		model.addAttribute("name", name);
//		
//		session.setMaxInactiveInterval(18000);
		
//		session.invalidate();
		
		return "Html";
	}
	
}
