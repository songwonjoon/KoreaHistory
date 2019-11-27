package com.tech.history.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.history.dao.HistoryIDao;
import com.tech.history.dao.IDao;
import com.tech.history.dao.WikiIDao;

@Controller
public class WikiController {
	private String id = "guest";
	private String qualification = "false";

	@Autowired
	SqlSession sqlSession;

	@RequestMapping("/wiki/wiki_view/dokdo")
	public String dokdo(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		HistoryIDao dao2 = sqlSession.getMapper(HistoryIDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		if (id == null) {
			model.addAttribute("dokdo", dao.dokdo("FALSE"));
			return "/wiki/wiki_view/dokdo";
		}

		if (dao2.getScore(id) >= 75) {
			qualification = "true";
		}
		model.addAttribute("admin", dao3.getAdmin(id));
		model.addAttribute("qualification", qualification);
		model.addAttribute("dokdo", dao.dokdo("FALSE"));

		qualification = "false";
		return "/wiki/wiki_view/dokdo";
	}

	@RequestMapping("/wiki/wiki_view/eastsea")
	public String eastSea(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		HistoryIDao dao2 = sqlSession.getMapper(HistoryIDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		if (id == null) {
			model.addAttribute("eastSea", dao.eastSea("FALSE"));
			return "/wiki/wiki_view/eastsea";
		}

		if (dao2.getScore(id) >= 75) {
			qualification = "true";
		}

		model.addAttribute("admin", dao3.getAdmin(id));
		model.addAttribute("qualification", qualification);
		model.addAttribute("eastSea", dao.eastSea("FALSE"));

		qualification = "false";
		return "/wiki/wiki_view/eastsea";
	}

	@RequestMapping("/wiki/wiki_view/k_im")
	public String k_im(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		HistoryIDao dao2 = sqlSession.getMapper(HistoryIDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		if (id == null) {
			model.addAttribute("k_im", dao.k_im("FALSE"));
			return "/wiki/wiki_view/k_im";
		}

		if (!id.equals("guest")) {
			if (dao2.getScore(id) >= 75) {
				qualification = "true";
			}
		}

		model.addAttribute("admin", dao3.getAdmin(id));
		model.addAttribute("qualification", qualification);
		model.addAttribute("k_im", dao.k_im("FALSE"));

		qualification = "false";
		return "/wiki/wiki_view/k_im";
	}

	@RequestMapping("/wiki/wiki_view/ktw")
	public String ktw(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		HistoryIDao dao2 = sqlSession.getMapper(HistoryIDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		if (id == null) {
			model.addAttribute("ktw", dao.ktw("FALSE"));
			return "/wiki/wiki_view/ktw";
		}

		if (!id.equals("guest")) {
			if (dao2.getScore(id) >= 75) {
				qualification = "true";
			}
		}

		model.addAttribute("admin", dao3.getAdmin(id));
		model.addAttribute("qualification", qualification);
		model.addAttribute("ktw", dao.ktw("FALSE"));

		qualification = "false";
		return "/wiki/wiki_view/ktw";
	}

	@RequestMapping("/wiki/wiki_view/slave")
	public String slave(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		HistoryIDao dao2 = sqlSession.getMapper(HistoryIDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		if (id == null) {
			model.addAttribute("slave", dao.slave("FALSE"));
			return "/wiki/wiki_view/slave";
		}

		if (dao2.getScore(id) >= 75) {
			qualification = "true";
		}

		model.addAttribute("admin", dao3.getAdmin(id));
		model.addAttribute("qualification", qualification);
		model.addAttribute("slave", dao.slave("FALSE"));

		qualification = "false";
		return "/wiki/wiki_view/slave";
	}

	//////////////////////////// **MODIFY**//////////////////////////////////
	// ====================================================================//
	/////////////////////////// **DOKDO**/////////////////////////////////
	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/dokdo_modify")
	public String dokdo_modify(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		model.addAttribute("dokdo", dao.dokdo("FALSE"));

		return "/wiki/wiki_modify/dokdo_modify";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/dokdo_modify_proc")
	public String dokdo_modify_proc(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		String outline = request.getParameter("outline");
		String history = request.getParameter("history");
		String japan = request.getParameter("japan");
		String korea = request.getParameter("korea");
		String importance = request.getParameter("importance");
		String recognition = request.getParameter("recognition");

		dao.dokdoUpdate(outline, history, japan, korea, importance, recognition);

		return "redirect:../wiki_view/dokdo";
	}

	/////////////////////////// **EASTSEA**/////////////////////////////////
	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/eastsea_modify")
	public String eastsea_modify(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		model.addAttribute("eastSea", dao.eastSea("FALSE"));

		return "/wiki/wiki_modify/eastsea_modify";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/eastsea_modify_proc")
	public String eastsea_modify_proc(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		String outline = request.getParameter("outline");
		String territory = request.getParameter("territory");
		String dispute = request.getParameter("dispute");
		String history = request.getParameter("history");
		String trend = request.getParameter("trend");

		dao.eastSeaUpdate(outline, territory, dispute, history, trend);

		return "redirect:../wiki_view/eastsea";
	}

	/////////////////////////// **SLAVE**/////////////////////////////////
	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/slave_modify")
	public String slave_modify(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		model.addAttribute("slave", dao.slave("FALSE"));

		return "/wiki/wiki_modify/slave_modify";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/slave_modify_proc")
	public String slave_modify_proc(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		String outline = request.getParameter("outline");
		String detail = request.getParameter("detail");
		String testimony = request.getParameter("testimony");
		String present = request.getParameter("present");
		String japan = request.getParameter("japan");
		String denial = request.getParameter("denial");

		dao.slaveUpdate(outline, detail, testimony, present, japan, denial);

		return "redirect:../wiki_view/slave";
	}

	///////// **KOREA INDEPENDENCE MOVEMENT**/////////////////////////////////
	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/k_im_modify")
	public String k_im_modify(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		model.addAttribute("k_im", dao.k_im("FALSE"));

		return "/wiki/wiki_modify/k_im_modify";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/k_im_modify_proc")
	public String k_im_modify_proc(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		WikiIDao dao2 = sqlSession.getMapper(WikiIDao.class);
		String outline = request.getParameter("outline");
		String time = request.getParameter("time");
		String time10 = request.getParameter("time10");
		String time20 = request.getParameter("time20");
		String time30 = request.getParameter("time30");
		String struggle = request.getParameter("struggle");
		String enlightenment = request.getParameter("enlightenment");
		String economy = request.getParameter("economy");
		String culture = request.getParameter("culture");

		dao.k_imUpdate1(outline, time, time10, time20, time30);
		dao2.k_imUpdate2(struggle, enlightenment, economy, culture);

		return "redirect:../wiki_view/k_im";
	}

	////////////////// **Korea-Japan trade dispute**//////////////////////
	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/ktw_modify")
	public String ktw_modify(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		model.addAttribute("ktw", dao.ktw("FALSE"));

		return "/wiki/wiki_modify/ktw_modify";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/wiki/wiki_modify/ktw_modify_proc")
	public String ktw_modify_proc(HttpServletRequest request, Model model) {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);
		String outline = request.getParameter("outline");
		String threshold = request.getParameter("threshold");
		String korea = request.getParameter("korea");
		String japan = request.getParameter("japan");
		String response = request.getParameter("response");
		String reaction = request.getParameter("reaction");

		dao.ktwUpdate(outline, threshold, korea, japan, response, reaction);

		return "redirect:../wiki_view/ktw";
	}

	////////////////////////////////////////////////////////////////////////
	////////////////////////// *****WIKI BACKUP*****/////////////////////////
	////////////////////////////////////////////////////////////////////////

	///////////////////////////// *****DOKDO*****////////////////////////////
	@RequestMapping("/wiki/wiki_backup/dokdo_backup")
	public String dokdo_backup() {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);

		dao.dokdoBackup();

		return "redirect:../wiki_view/dokdo";
	}

	//////////////////////////// *****EAST SEA*****//////////////////////////
	@RequestMapping("/wiki/wiki_backup/eastsea_backup")
	public String eastsea_backup() {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);

		dao.eastseaBackup();

		return "redirect:../wiki_view/eastsea";
	}

	//////////////////////////// *****K_IM*****//////////////////////////
	@RequestMapping("/wiki/wiki_backup/k_im_backup")
	public String k_im_backup() {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);

		dao.k_imBackup();

		return "redirect:../wiki_view/k_im";
	}

	//////////////////////////// *****KTW*****//////////////////////////
	@RequestMapping("/wiki/wiki_backup/ktw_backup")
	public String ktw_backup() {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);

		dao.ktwBackup();

		return "redirect:../wiki_view/ktw";
	}

	//////////////////////////// *****SLAVE*****//////////////////////////
	@RequestMapping("/wiki/wiki_backup/slave_backup")
	public String slave_backup() {
		WikiIDao dao = sqlSession.getMapper(WikiIDao.class);

		dao.slaveBackup();

		return "redirect:../wiki_view/slave";
	}
}
