package com.tech.history.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Locale;

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
import com.tech.history.dao.IDao;
import com.tech.history.vopage.SearchVO;

@Controller
public class HistoryController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/freeboard/historylist")
	public String historylist(HttpServletRequest request, SearchVO searchVO, Model model) {

		String htitle = "";
		String hcontent = "";

		String hrdtitle[] = request.getParameterValues("searchType");

		if (hrdtitle != null) {
			for (String val : hrdtitle) {
				if (val.equals("htitle")) {
					model.addAttribute("htitle", "true");// 체크를 유지하기위해
					htitle = "htitle";
				} else if (val.equals("hcontent")) {
					model.addAttribute("hcontent", "true");
					hcontent = "hcontent";
				}
			}
		}
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}

		IDao dao = sqlSession.getMapper(IDao.class);
		// total갯수가져오기
		int total = 0;
		if (htitle.equals("htitle") && hcontent.equals("")) {
			total = dao.selectHistoryCount(searchKeyword, "1");
		} else if (htitle.equals("") && hcontent.equals("hcontent")) {
			total = dao.selectHistoryCount(searchKeyword, "2");
		} else if (htitle.equals("htitle") && hcontent.equals("hcontent")) {
			total = dao.selectHistoryCount(searchKeyword, "3");
		} else if (htitle.equals("") && hcontent.equals("")) {
			total = dao.selectHistoryCount(searchKeyword, "0");
		}
		String strPage = request.getParameter("page");
		model.addAttribute("searchKeyword", searchKeyword);
		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		searchVO.pageCalculate(total);

		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		if (htitle.equals("htitle") && hcontent.equals("")) {
			model.addAttribute("historylist", dao.historylist(rowStart, rowEnd, searchKeyword, "1"));
			model.addAttribute("totRowCnt", dao.selectHistoryCount(searchKeyword, "1"));
		} else if (htitle.equals("") && hcontent.equals("hcontent")) {
			model.addAttribute("historylist", dao.historylist(rowStart, rowEnd, searchKeyword, "2"));
			model.addAttribute("totRowCnt", dao.selectHistoryCount(searchKeyword, "2"));
		} else if (htitle.equals("htitle") && hcontent.equals("hcontent")) {
			model.addAttribute("historylist", dao.historylist(rowStart, rowEnd, searchKeyword, "3"));
			model.addAttribute("totRowCnt", dao.selectHistoryCount(searchKeyword, "3"));
		} else if (htitle.equals("") && hcontent.equals("")) {
			model.addAttribute("historylist", dao.historylist(rowStart, rowEnd, searchKeyword, "0"));
			model.addAttribute("totRowCnt", dao.selectHistoryCount(searchKeyword, "0"));
		}
		model.addAttribute("searchVO", searchVO);

		return "freeboard/historylist";
	}

	@RequestMapping("/freeboard/historywrite")
	public String historywrite() {

		return "freeboard/historywrite";
	}

	@RequestMapping("/write")
	public String historywrite(HttpServletRequest request, Model model) throws Exception {
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		System.out.println("path >> " + path);

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		IDao dao = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		String id="";	
		id = (String)session.getAttribute("id");
		String hname=id;
		String htitle = req.getParameter("htitle");
		String hcontent = req.getParameter("hcontent");
		String fname = req.getFilesystemName("file");
		

		if (fname == null) {
			fname = "";
		}
		
		try {
			dao.historywrite(hname, htitle, hcontent, fname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return "redirect:freeboard/historylist";
	}

	@RequestMapping("/freeboard/historyContent")
	public String historyContent(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		/*IDao dao2 = sqlSession.getMapper(IDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);*/

		String hid = request.getParameter("hid");
		/*String htitle = dao3.getHtitle(hid);*/
		HttpSession session = request.getSession();
		String id="";	
		id = (String)session.getAttribute("id");
		String hname=request.getParameter("hname");

		hitUp(hid);
		//
		model.addAttribute("historyContent", dao.historyContent(hid));
		/*model.addAttribute("reply_view", dao2.getReply(htitle,hname));*/
		return "freeboard/historyContent";
	}

	private void hitUp(String hid) {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.hitUp(hid);

	}

	@RequestMapping(method = RequestMethod.POST, value = "/modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		System.out.println("path >> " + path);

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());
		IDao dao = sqlSession.getMapper(IDao.class);
		String hid = req.getParameter("hid");
		String htitle = req.getParameter("htitle");
		String hcontent = req.getParameter("hcontent");

		String fname = req.getFilesystemName("file");

		if (fname == null) {
			fname = "";
		}

		
		dao.modify(hid, htitle, hcontent, fname);
		return "redirect:freeboard/historylist";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String hid = request.getParameter("hid");
		dao.delete(hid);
		return "redirect:freeboard/historylist";
	}

	@RequestMapping("/download")
	public String download(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("download passing");
		String path = request.getParameter("p");
		String fname = request.getParameter("f");
		String hid = request.getParameter("hid");

		response.setHeader("content-Disposition", "attatchment;filename=" + URLEncoder.encode(fname, "UTF-8"));

		String attachPath = "resources\\upload\\";
		String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + fname;

		FileInputStream fin = new FileInputStream(realPath);
		ServletOutputStream sout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = fin.read(buf, 0, 1024)) != -1) {
			sout.write(buf, 0, size);
		}

		fin.close();
		sout.close();

		return "freeboard/historyContent?hid=" + hid;
	}

	@RequestMapping("/reply_test")
	public String reply_test(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		String id="";	
		id = (String)session.getAttribute("id");
		
		String hname=request.getParameter("hname");
		String htitle = request.getParameter("htitle");
		String content = request.getParameter("content");
		String cid=request.getParameter("cid");
		String hid = request.getParameter("hid");
		String map = "?hid="+hid;
		int recnt= dao.gethindent(htitle);
		
		
		dao.insertReply(htitle, content,hname,recnt);
		recnt++;
		dao.updateReply(recnt,htitle);
		return "redirect:freeboard/contentView" + map;
	}
	@RequestMapping("/replyModify")
	public String replyModify(HttpServletRequest request,Model model) {
		IDao dao=sqlSession.getMapper(IDao.class);
		String content=request.getParameter("content");
		String cid=request.getParameter("cid");
		String hid=request.getParameter("hid");
		
		dao.replyModify(content,cid);
		return "redirect:freeboard/contentView?hid="+hid;
	}
	@RequestMapping("/replyDelete")
	public String replyDelete(HttpServletRequest request,Model model) {
		IDao dao=sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		String id="";	
		id = (String)session.getAttribute("id");
		String cid=request.getParameter("cid");
		String hid = request.getParameter("hid");
		String htitle = request.getParameter("htitle");
		int recnt= dao.gethindent(htitle);
		dao.replyDelete(cid);
		recnt--;
		dao.updateReply(recnt,htitle);
		model.addAttribute("id",id);
		return "redirect:freeboard/contentView?hid="+hid;
	}
	@RequestMapping("/freeboard/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		IDao dao2 = sqlSession.getMapper(IDao.class);
		IDao dao3 = sqlSession.getMapper(IDao.class);

		String hid = request.getParameter("hid");
		String htitle = dao3.getHtitle(hid);
		HttpSession session = request.getSession();
		String id="";	
		id = (String)session.getAttribute("id");
		String hname=request.getParameter("hname");

		hitUp(hid);
		//
		model.addAttribute("historyContent", dao.historyContent(hid));
		model.addAttribute("reply_view", dao2.getReply(htitle,hname));

		return "freeboard/contentView";
	}
	@RequestMapping("/update_test")
	public String update_test() {
		return "update_test";
	}
}
