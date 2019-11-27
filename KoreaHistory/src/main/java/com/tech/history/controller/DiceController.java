package com.tech.history.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.history.dao.DiceDao;
import com.tech.history.dao.HistoryIDao;

@Controller
public class DiceController {
	Random ran = new Random();
	private String id = "X";
	private int dice = 0;
	private String userturn = "true";
	private boolean startline = true;
	private String s = " ";
	private int userGround = 0;
	private int cpuGround = 0;
	private String userWin = null;

	@Autowired
	SqlSession sqlSession;

	@RequestMapping("/dice/dice_game")
	public String dice_game(HttpServletRequest request, Model model) {
		DiceDao dao = sqlSession.getMapper(DiceDao.class);
		if (startline == true) {
			s = "시작전";
		} else if (startline == false && userturn.equals("false")) {
			s = "컴퓨터 차례...";
		} else {
			s = "유저 차례";
		}

		if (startline == false && userGround <= cpuGround) {
			userWin = "lose";
			return "redirect:/dice/cpuwin";
		}

		if (userGround >= 50) {
			userWin = "win";
			model.addAttribute("userwin", userWin);
			return "redirect:/dice/userwin";
		}

		model.addAttribute("s", s);
		model.addAttribute("dice", dice);
		model.addAttribute("com", dao.getCom("FALSE"));
		model.addAttribute("user", dao.getUser("TRUE"));
		model.addAttribute("userturn", userturn);
		model.addAttribute("userwin", userWin);

		return "/dice/dice_game";
	}

	@RequestMapping("/dice/dice_game_proc")
	public String dice_game_proc(HttpServletRequest request, Model model) {
		DiceDao dao = sqlSession.getMapper(DiceDao.class);
		dice = ran.nextInt(6) + 1;
		startline = false;

		if (userturn.equals("true")) {
			userGround = dice + userGround;
			dao.userRun(userGround, "TRUE");
		} else if (userturn.equals("false")) {
			int cpuTurn = 0;
			while (userturn.equals("false")) {
				dice = ran.nextInt(6) + 1;
				cpuGround = dice + cpuGround;
				dao.cpuRun(cpuGround, "FALSE");
				cpuTurn = ran.nextInt(10) + 1;
				if (cpuTurn > 6) {
					userturn = "true";
				}
				try {
					Thread.sleep(1000);
				} catch (Exception e) {
					// TODO: handle exception
				}

			}
		}
		return "redirect:/dice/dice_game";
	}

	@RequestMapping("/dice/dice_question")
	public String dice_question(Model model) {
		Random ran = new Random();
		int qnum = ran.nextInt(50) + 1;
		HistoryIDao dao = sqlSession.getMapper(HistoryIDao.class);

		model.addAttribute("question", dao.question(qnum));

		return "/dice/dice_question";
	}

	@RequestMapping("/dice/dice_turn")
	public String dice_turn(HttpServletRequest request) {
		String answer = request.getParameter("answer");
		String real_answer = request.getParameter("real_answer");

		if (answer.equals(real_answer)) {
			userturn = "true";
		} else {
			userturn = "false";
		}

		return "/dice/dice_turn";
	}

	@RequestMapping("/dice/userwin")
	public String userwin(HttpServletRequest request, Model model) {
		DiceDao dao = sqlSession.getMapper(DiceDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");
		int userWin = dao.getUserWin(id) + 1;
		int userLose = dao.getUserLose(id);
		double winShare = ((double) userWin / ((double) userWin + (double) userLose) * 100);

		userGround = 0;
		cpuGround = 0;
		dice = 0;
		userturn = "true";
		startline = true;
		s = "시작전";
		this.userWin = null;

		dao.userWinUpdate(userWin, id);
		dao.userRun(0, "TRUE");
		dao.cpuRun(0, "FALSE");

		model.addAttribute("id", id);
		model.addAttribute("win", userWin);
		model.addAttribute("lose", userLose);
		model.addAttribute("count", userWin + userLose);
		model.addAttribute("winshare", Math.round((winShare) * 10) / 10.0);

		return "/dice/userwin";
	}

	@RequestMapping("/dice/cpuwin")
	public String cpuwin(HttpServletRequest request, Model model) {
		DiceDao dao = sqlSession.getMapper(DiceDao.class);
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");
		int userWin = dao.getUserWin(id);
		int userLose = dao.getUserLose(id) + 1;
		double winShare = ((double) userWin / ((double) userWin + (double) userLose) * 100);

		userGround = 0;
		cpuGround = 0;
		dice = 0;
		userturn = "true";
		startline = true;
		s = "시작전";
		this.userWin = null;

		dao.userLoseUpdate(userLose, id);
		dao.userRun(0, "TRUE");
		dao.cpuRun(0, "FALSE");

		model.addAttribute("id", id);
		model.addAttribute("win", userWin);
		model.addAttribute("lose", userLose);
		model.addAttribute("count", userWin + userLose);
		model.addAttribute("winshare", Math.round((winShare) * 10) / 10.0);

		return "/dice/cpuwin";
	}
}