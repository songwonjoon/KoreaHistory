package com.tech.history.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.history.dao.HistoryIDao;
import com.tech.history.dto.MemberDto;

@Controller
public class QuestionController {
	ArrayList<String> qNumAry = new ArrayList<String>();
	int score = 0;
	private String id = "no id";

	@Autowired
	SqlSession sqlSession;

	@RequestMapping("/question/question_view")
	public String question(HttpServletRequest request, Model model) {
		HistoryIDao dao = sqlSession.getMapper(HistoryIDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		Random rd = new Random();
		int qNum = rd.nextInt(50) + 1;
		// System.out.println(qNum);
		int cnt = Integer.parseInt(request.getParameter("cnt"));

		for (int i = 0; i < qNumAry.size(); i++) {
			if (qNum == Integer.parseInt(qNumAry.get(i))) {
				qNum = rd.nextInt(11) + 1;
				i = -1;
			}
		}

		model.addAttribute("question", dao.question(qNum));
		model.addAttribute("cnt", cnt);
		model.addAttribute("qNum", qNum);
		model.addAttribute("id", id);

		return "/question/question_view";
	}

	@RequestMapping("/question/question_proc")
	public String question_proc(HttpServletRequest request, Model model) {
		HistoryIDao dao = sqlSession.getMapper(HistoryIDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");
		String qNum = request.getParameter("qNum");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		String answer = request.getParameter("answer");
		String real_answer = request.getParameter("real_answer");
		String OX = (real_answer.equals(answer)) ? "정답입니다!" : "오답입니다!";
		score += (real_answer.equals(answer)) ? 10 : 0;
		cnt++;

		qNumAry.add(qNum);

		if (Integer.parseInt(qNum) % 4 == 0) {
			model.addAttribute("ans", dao.getAns4(Integer.parseInt(qNum)));
		} else if (Integer.parseInt(qNum) % 4 == 1) {
			model.addAttribute("ans", dao.getAns1(Integer.parseInt(qNum)));
		} else if (Integer.parseInt(qNum) % 4 == 2) {
			model.addAttribute("ans", dao.getAns2(Integer.parseInt(qNum)));
		} else if (Integer.parseInt(qNum) % 4 == 3) {
			model.addAttribute("ans", dao.getAns3(Integer.parseInt(qNum)));
		}

		model.addAttribute("question_proc", dao.question_proc(Integer.parseInt(qNum)));
		model.addAttribute("OX", OX);
		model.addAttribute("cnt", cnt);
		model.addAttribute("id", id);

		if (cnt == 16) {
			qNumAry.clear();
			return "redirect:/question/question_score_proc";
		} else {
			return "/question/question_proc";
		}
	}

	@RequestMapping("/question/question_score_proc")
	public String question_socre_proc(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		HistoryIDao dao = sqlSession.getMapper(HistoryIDao.class);
		HistoryIDao dao2 = sqlSession.getMapper(HistoryIDao.class);
		HistoryIDao dao3 = sqlSession.getMapper(HistoryIDao.class);
		HistoryIDao dao4 = sqlSession.getMapper(HistoryIDao.class);
		HistoryIDao dao5 = sqlSession.getMapper(HistoryIDao.class);

		int cnt = dao4.getCount(id) + 1;
		int avgScore = (score + dao.getScore(id)) / cnt;
		dao2.scoreUpdate(avgScore, id);
		dao5.cntUpdate(cnt, id);

		model.addAttribute("score", score);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("getId", dao3.getId(id));
		model.addAttribute("id", id);

		score = 0;

		return "/question/question_score_proc";
	}

	@RequestMapping("/question/ranking")
	public String ranking(HttpServletRequest request, Model model) {
		HistoryIDao dao = sqlSession.getMapper(HistoryIDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");
		ArrayList<MemberDto> rank = dao.getRank();

		model.addAttribute("rank", rank);
		model.addAttribute("id", id);

		return "/question/ranking";
	}
}