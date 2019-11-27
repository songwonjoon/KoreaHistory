package com.tech.history.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.history.dao.MemberDao;

public class ModifyMemberServiceImpl implements MemberService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		String email = request.getParameter("email");
		String ecertify = request.getParameter("emCertify");  //이것도 해결해야함.
		
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		System.out.println("name : "+name);
		System.out.println("email : "+email);
		System.out.println("ecertify : "+ecertify);
		
		System.out.println("ModifyMemberServiceImpl 지나간다");
		
		MemberDao dao = new MemberDao();
		if (email != "" && ecertify != "") {
			dao.modify(id, pw, name, email, ecertify);
		}else if (email == "" && ecertify == "") {
			dao.modify2(id,pw);
		}
		
	}

}
