package com.tech.history.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.history.dao.HDao;
import com.tech.history.page.SearchHis;

@Controller
public class HController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/qna/list")
	public String list(HttpServletRequest request, SearchHis searchHis, Model model) {
		System.out.println("list passing");

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
		HDao dao = sqlSession.getMapper(HDao.class);
		int total = 0;

		if (qtitle.equals("qtitle") && w_content.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "1");
		} else if (qtitle.equals("") && w_content.equals("w_content")) {
			total = dao.selectBoardCount(searchKeyword, "2");
		} else if (qtitle.equals("qtitle") && w_content.equals("w_content")) {
			total = dao.selectBoardCount(searchKeyword, "3");
		} else if (qtitle.equals("") && w_content.equals("")) {
			total = dao.selectBoardCount(searchKeyword, "0");
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
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "1"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "1"));
		} else if (qtitle.equals("") && w_content.equals("w_content")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "2"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "2"));
		} else if (qtitle.equals("qtitle") && w_content.equals("w_content")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "3"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "3"));
		} else if (qtitle.equals("") && w_content.equals("")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "0"));
			model.addAttribute("totRowCnt", dao.selectBoardCount(searchKeyword, "0"));
		}

		model.addAttribute("searchHis", searchHis);
		
		return "qna/list";
	}

	@RequestMapping("/qna/modify_view")
	public String modify_view(HttpServletRequest request, Model model) {
		System.out.println("modify passing");

		HDao dao = sqlSession.getMapper(HDao.class);
		HDao dao2 = sqlSession.getMapper(HDao.class);
		
		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		
		String q_num = request.getParameter("q_num");
		String a_content = dao2.getReply(q_num);

		model.addAttribute("modify_view", dao.modify_view(q_num));
		model.addAttribute("reply_view", a_content);

		System.out.println(q_num);
		System.out.println(a_content);

		return "qna/modify_view";
	}

	@RequestMapping("/qna/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("content passing");

		HDao dao = sqlSession.getMapper(HDao.class);
		HDao dao2 = sqlSession.getMapper(HDao.class);
		
		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		
		String q_num = request.getParameter("q_num");
		String a_content = dao2.getReply(q_num);

		model.addAttribute("content_view", dao.content_view(q_num));
		model.addAttribute("reply_view", a_content);

		System.out.println(q_num);
		System.out.println(a_content);

		return "qna/content_view";
	}

	@RequestMapping("/qna/write_view")
	public String write_view() {
		System.out.println("write_view");
		return "qna/write_view";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/qna/qwrite")
	public String qwrite(HttpServletRequest request, Model model) throws Exception {
		System.out.println("write passing");
		String attachPath = "\\resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		
		
		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		HDao dao = sqlSession.getMapper(HDao.class);
		HDao dao2 = sqlSession.getMapper(HDao.class);

		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		String q_num = req.getParameter("q_num");
		String qtitle = req.getParameter("qtitle");
		String writer = req.getParameter("writer");
		String w_content = req.getParameter("w_content");
		String qname = req.getFilesystemName("qfile");

		
		System.out.println(qtitle);
		
		if (qname == null) {
			qname = "";
		}
		
		try {
			dao.qwrite( q_num,qtitle,writer, w_content, qname);
			
		} catch (Exception e) {
			System.out.println("Fuck U MAN");
		}
		
		return "redirect:list";
	}

	@RequestMapping("/qna/qdownload")
	public String download(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("downloading");
		String path = request.getParameter("pa");
		String qname = request.getParameter("q");
		String writer = request.getParameter("writer");

		response.setHeader("Content-Disposition", "attachment);filename=" + URLEncoder.encode(qname, "UTF-8"));

		String attachPath = "\\resources\\upload\\";
		String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + qname;

		FileInputStream qin = new FileInputStream(realPath);
		ServletOutputStream serout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = qin.read(buf, 0, 1024)) != -1) {
			serout.write(buf, 0, size);
		}
		qin.close();
		serout.close();

		return "modify_view?writer=" + writer;
	}

	@RequestMapping("/qna/qdelete")
	public String qdelete(HttpServletRequest request, Model model) {
		HDao dao = sqlSession.getMapper(HDao.class);
		String q_num = request.getParameter("q_num");
		dao.qdelete(q_num);

		return "redirect:list";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/qna/modify_his")
	public String modify_his(HttpServletRequest request, Model model) {
		System.out.println("modify passing");

		HDao dao = sqlSession.getMapper(HDao.class);

		String q_num = request.getParameter("q_num");
		String qtitle = request.getParameter("qtitle");
		String writer = request.getParameter("writer");
		String w_content = request.getParameter("w_content");

		System.out.println(q_num);
		System.out.println(qtitle);
		System.out.println(writer);
		System.out.println(w_content);

		dao.modify_his(q_num, qtitle, writer, w_content);

		return "redirect:list";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/qna/insert_reply")
	public String insert_reply(HttpServletRequest request, Model model) {
		System.out.println("reply");

		HDao dao = sqlSession.getMapper(HDao.class);
		HDao dao2 = sqlSession.getMapper(HDao.class);
		
		String qtitle = request.getParameter("qtitle");
		String q_num = request.getParameter("q_num");
		String a_content = request.getParameter("a_content");
		
		System.out.println(a_content);
		System.out.println(q_num);

		if (a_content != null) {
			dao.insert_reply(qtitle,a_content,q_num);
			dao2.getOx(q_num);
			dao2.showOx(q_num);
		}

		return "redirect:list";
	}
	@RequestMapping(method=RequestMethod.POST, value="/qna/update_reply")
	public String update_reply(HttpServletRequest request,Model model) {
		System.out.println("update");
		
		HDao dao=sqlSession.getMapper(HDao.class);
		
		String q_num=request.getParameter("q_num");
		String a_content=request.getParameter("a_content");
		
		dao.update_reply(q_num,a_content);
		
		return "redirect:list";
	}
}
