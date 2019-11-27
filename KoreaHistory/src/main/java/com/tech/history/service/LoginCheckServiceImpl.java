package com.tech.history.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tech.history.dao.MemberDao;

public class LoginCheckServiceImpl implements MemberService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("nid");
		String pw = request.getParameter("npw");
		
		System.out.println("LoginCheckServiceImpl 지나간다");
		
		MemberDao dao = new MemberDao();
		String loginCheck = dao.loginCheck(id, pw);
		String name = dao.nameGet(id);
//		model.addAttribute("loginCheck", loginCheck);
//		model.addAttribute("id", id);
//		model.addAttribute("name", name);
		//System.out.println("name : "+name);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginCheck", loginCheck);
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setMaxInactiveInterval(18000);
	}

}
