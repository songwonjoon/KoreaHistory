package com.tech.history.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.history.dao.MemberDao;

public class IdCheckServiceImpl implements MemberService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		String idCheck = dao.idCheck(id);
		model.addAttribute("idCheck", idCheck);
		model.addAttribute("id", id);
	}

}
