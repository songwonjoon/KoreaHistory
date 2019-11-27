package com.tech.history.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.history.dao.HDao;
import com.tech.history.dao.HistoryIDao;
import com.tech.history.dto.MemberDto;
import com.tech.history.page.SearchHis;
import com.tech.history.service.LoginCheckServiceImpl;
import com.tech.history.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	SqlSession sqlSession;
	
	MemberService memberService;
	
	@RequestMapping("/login/login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/login/login2")
	public String login2() {
		return "login/login2";
	}
	
	@RequestMapping("/Html")
	public String LoginPopup(HttpServletRequest request,Model model, SearchHis searchHis) {
		HistoryIDao dao = sqlSession.getMapper(HistoryIDao.class);
		HttpSession session = request.getSession();
		
		
		
		
		
		
		
		String qtitle = "";
		String w_content = "";

		String[] brdtitle = request.getParameterValues("searchType");

		if (brdtitle != null) {
			for (String val : brdtitle) {
				if (val.equals("qtitle")) {
					model.addAttribute("qtitle", "true");
					qtitle = "qtitle";
				} else if (val.equals("w_content")) {
					model.addAttribute("w_content", "true");
					w_content = "w_content";
				}
			}
		}
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		HDao dao2 = sqlSession.getMapper(HDao.class);
		int total = 0;

		if (qtitle.equals("qtitle") && w_content.equals("")) {
			total = dao2.selectBoardCount(searchKeyword, "1");
		} else if (qtitle.equals("") && w_content.equals("w_content")) {
			total = dao2.selectBoardCount(searchKeyword, "2");
		} else if (qtitle.equals("qtitle") && w_content.equals("w_content")) {
			total = dao2.selectBoardCount(searchKeyword, "3");
		} else if (qtitle.equals("") && w_content.equals("")) {
			total = dao2.selectBoardCount(searchKeyword, "0");
		}

		String strPage = request.getParameter("page");
		model.addAttribute("searchKeyword", searchKeyword);

		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}

		int page = Integer.parseInt(strPage);
		searchHis.setPage(page);
		searchHis.pageCalculate(total);

		System.out.println("rowStart >>" + searchHis.getRowStart());
		System.out.println("rowEnd >>" + searchHis.getRowEnd());

		int rowStart = searchHis.getRowStart();
		int rowEnd = searchHis.getRowEnd();

		if (qtitle.equals("qtitle") && w_content.equals("")) {
			model.addAttribute("list", dao2.list(rowStart, rowEnd, searchKeyword, "1"));
			model.addAttribute("totRowCnt", dao2.selectBoardCount(searchKeyword, "1"));
		} else if (qtitle.equals("") && w_content.equals("w_content")) {
			model.addAttribute("list", dao2.list(rowStart, rowEnd, searchKeyword, "2"));
			model.addAttribute("totRowCnt", dao2.selectBoardCount(searchKeyword, "2"));
		} else if (qtitle.equals("qtitle") && w_content.equals("w_content")) {
			model.addAttribute("list", dao2.list(rowStart, rowEnd, searchKeyword, "3"));
			model.addAttribute("totRowCnt", dao2.selectBoardCount(searchKeyword, "3"));
		} else if (qtitle.equals("") && w_content.equals("")) {
			model.addAttribute("list", dao2.list(rowStart, rowEnd, searchKeyword, "0"));
			model.addAttribute("totRowCnt", dao2.selectBoardCount(searchKeyword, "0"));
		}

		model.addAttribute("searchHis", searchHis);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		String id = "";
		String name = "";
//		id = request.getParameter("id");
//		name = request.getParameter("name");
		id = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
		System.out.println("id : "+id);
		System.out.println("name : "+name);		
		
		model.addAttribute("id", id);
		model.addAttribute("name", name);
//			session.setAttribute("id", id);
//			session.setAttribute("name", name);
		
		
		if (id != "" && id != null) {
//		model.addAttribute("login", "true");
			session.setAttribute("login", true);
	
		}
		
		ArrayList<MemberDto> rank = dao.getRank();
		model.addAttribute("rank", rank);
		
		session.setMaxInactiveInterval(18000); // 18000초 = 300분 = 5시간
		return "Html";
	}
	
	@RequestMapping(method=RequestMethod.POST ,value="/loginProc")
	public String loginProc(HttpServletRequest request, Model model) {
		System.out.println("loginProc Passing");
		
//		String id = request.getParameter("nid");
//		String pw = request.getParameter("npw");
//		System.out.println("nid: "+id);
//		System.out.println("npw: "+pw);
		
		model.addAttribute("request", request);
		memberService = new LoginCheckServiceImpl();
		memberService.execute(model);
		
		return "login/AfterLogin";
//		"redirect:login/LoginPopupStart"
	}
	
	@RequestMapping(method=RequestMethod.POST ,value="/loginProc2")
	public String loginProc2(HttpServletRequest request, Model model) {
		System.out.println("loginProc Passing");
		
//		String id = request.getParameter("nid");
//		String pw = request.getParameter("npw");
//		System.out.println("nid: "+id);
//		System.out.println("npw: "+pw);
		
		model.addAttribute("request", request);
		memberService = new LoginCheckServiceImpl();
		memberService.execute(model);
		
		return "login/AfterLogin2";
//		"redirect:login/LoginPopupStart"
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		System.out.println("logout 지나감");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "Html";
	}
}
