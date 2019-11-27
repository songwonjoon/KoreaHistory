package com.tech.history.controller;

import java.io.FileInputStream;
import java.io.IOException;
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
import com.tech.history.dao.PDao;
import com.tech.history.page.SearchPhoto;

@Controller
public class PhotoControler {

	@Autowired
	private SqlSession sqlsession;
@RequestMapping("/photo/photo_list")
public String photo_list(HttpServletRequest request,SearchPhoto searchPhoto,Model model) {
	
	String ptitle="";
	String p_content="";
	
	String[] seatitle=request.getParameterValues("searchType");
	
	if (seatitle!=null) {
		for (String val : seatitle) {
			if (val.equals("ptitle")) {
				model.addAttribute("ptitle","true");
				ptitle="ptitle";
			}else if (val.equals("p_content")) {
				model.addAttribute("p_content","true");
				p_content="p_content";
			}
		}
	}
	String sWord=request.getParameter("sw");
	if (sWord==null) {
		sWord=""; 
	}
	
	 PDao dao=sqlsession.getMapper(PDao.class);
	 int total=0;
	 
	 if (ptitle.equals("ptitle")&& p_content.equals("")) {
		 total=dao.selCount(sWord,"1");
	}else if (ptitle.equals("")&& p_content.equals("p_content")) {
		 total=dao.selCount(sWord,"2");
	}else if (ptitle.equals("ptitle")&& p_content.equals("p_content")) {
		 total=dao.selCount(sWord,"3");
	}else if (ptitle.equals("")&& p_content.equals("")) {
		 total=dao.selCount(sWord,"0");
	}
	
	 String strPage = request.getParameter("page");
		model.addAttribute("searchKeyword", sWord);

		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}

		int page = Integer.parseInt(strPage);
		searchPhoto.setPage(page);
		searchPhoto.pageCalculate(total);


		int rowStart = searchPhoto.getRowStart();
		int rowEnd = searchPhoto.getRowEnd();

		
		if (ptitle.equals("ptitle") && p_content.equals("")) {
			model.addAttribute("photo_list", dao.photo_list(rowStart, rowEnd, sWord, "1"));
			model.addAttribute("totRowCnt", dao.selCount(sWord, "1"));
		} else if (ptitle.equals("") && p_content.equals("p_content")) {
			model.addAttribute("photo_list", dao.photo_list(rowStart, rowEnd, sWord, "2"));
			model.addAttribute("totRowCnt", dao.selCount(sWord, "2"));
		} else if (ptitle.equals("ptitle") && p_content.equals("p_content")) {
			model.addAttribute("photo_list", dao.photo_list(rowStart, rowEnd, sWord, "3"));
			model.addAttribute("totRowCnt", dao.selCount(sWord, "3"));
		} else if (ptitle.equals("") && p_content.equals("")) {
			model.addAttribute("photo_list", dao.photo_list(rowStart, rowEnd, sWord, "0"));
			model.addAttribute("totRowCnt", dao.selCount(sWord, "0"));
		}

		
		model.addAttribute("searchPhoto", searchPhoto);
	
		
	
	
	return "photo/photo_list";
}
	@RequestMapping("/photo/photo_write")
	public String photo_write(HttpServletRequest request,Model model) {
			System.out.println("qwrite");
		return "photo/photo_write";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/photo/pwrite")
	public String pwrite(HttpServletRequest request,Model model) throws Exception {
		 System.out.println("prite");
		 String attachPath = "\\resources\\upload\\";
			String uploadPath = request.getSession().getServletContext().getRealPath("/");
			String path = uploadPath + attachPath;
			
			MultipartRequest preq = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
					new DefaultFileRenamePolicy());

			PDao dao = sqlsession.getMapper(PDao.class);
			
			HttpSession session=request.getSession();
			String id="";
			id=(String)session.getAttribute("id");
			
			String ptitle = preq.getParameter("ptitle");
			String pid = preq.getParameter("pid");
			String p_content = preq.getParameter("p_content");
			String pname = preq.getFilesystemName("pfile");
			
			if (pname == null) {
				pname = "";
			}
			
			try {
				dao.pwrite( ptitle,pid,p_content,pname);
				
			} catch (Exception e) {
				System.out.println("Fuck U MAN");
			}
		 
		 
		return "redirect:photo_list";
	}
	@RequestMapping("/photo/pdownload")
	public String pdownload(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("pdownloading");
		String path = request.getParameter("pp");
		String pname = request.getParameter("p");
		String pid = request.getParameter("pid");

		response.setHeader("Content-Disposition", "attachment);filename=" + URLEncoder.encode(pname, "UTF-8"));

		String attachPath = "\\resources\\upload\\";
		String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + pname;

		FileInputStream pin = new FileInputStream(realPath);
		ServletOutputStream serout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = pin.read(buf, 0, 1024)) != -1) {
			serout.write(buf, 0, size);
		}
		pin.close();
		serout.close();

		return "photo_modify?pid=" + pid;
	}
	@RequestMapping("/photo/pdelete")
	public String qdelete(HttpServletRequest request, Model model) {
		PDao dao = sqlsession.getMapper(PDao.class);
		String p_num = request.getParameter("p_num");
		dao.pdelete(p_num);

		return "redirect:photo_list";
	}
	@RequestMapping("/photo/photo_view")
	public String photo_view(HttpServletRequest request, Model model) {
		System.out.println("content passing");

		PDao dao = sqlsession.getMapper(PDao.class);
		
		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		
		String p_num = request.getParameter("p_num");
		String pid=request.getParameter("pid");

		model.addAttribute("photo_view", dao.photo_view(p_num));

		return "photo/photo_view";
	}
	@RequestMapping("/photo/photo_modify")
	public String photo_modify(HttpServletRequest request, Model model) {
		PDao dao = sqlsession.getMapper(PDao.class);
		
		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		
		String p_num = request.getParameter("p_num");
		
		model.addAttribute("photo_modify", dao.photo_modify(p_num));

		return "photo/photo_modify";
	}
	@RequestMapping(method = RequestMethod.POST, value = "/photo/photo_mo")
	public String photo_mo(HttpServletRequest request, Model model) {

		PDao dao = sqlsession.getMapper(PDao.class);
		
		String p_num = request.getParameter("p_num");
		String ptitle = request.getParameter("ptitle");
		String pid = request.getParameter("pid");
		String p_content = request.getParameter("p_content");

		dao.photo_mo(p_num, ptitle, pid, p_content);

		return "redirect:photo_list";
	}
}
