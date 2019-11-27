package com.tech.history.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.history.dao.MemberDao;

public class JoinMemberServiceImpl implements MemberService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String ecertify = request.getParameter("emCertify");  //이것도 해결해야함.
		
		System.out.println("JoinMemberServiceImpl 지나간다");
		
		MemberDao dao = new MemberDao();
		dao.join(id, pw, name, email, ecertify);
		
	}

}
