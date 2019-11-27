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
import com.tech.history.dao.PDao1;
import com.tech.history.page.SearchPhoto;

@Controller
public class PhotoControler1 {

	@Autowired
	private SqlSession sqlsession;
@RequestMapping("/photo1/photo_list1")
public String photo_list1(HttpServletRequest request,SearchPhoto searchPhoto,Model model) {
	
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
	
	 PDao1 dao=sqlsession.getMapper(PDao1.class);
	 int total=0;
	 
	 if (ptitle.equals("ptitle")&& p_content.equals("")) {
		 total=dao.selCount1(sWord,"1");
	}else if (ptitle.equals("")&& p_content.equals("p_content")) {
		 total=dao.selCount1(sWord,"2");
	}else if (ptitle.equals("ptitle")&& p_content.equals("p_content")) {
		 total=dao.selCount1(sWord,"3");
	}else if (ptitle.equals("")&& p_content.equals("")) {
		 total=dao.selCount1(sWord,"0");
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
			model.addAttribute("photo_list1", dao.photo_list1(rowStart, rowEnd, sWord, "1"));
			model.addAttribute("totRowCnt", dao.selCount1(sWord, "1"));
		} else if (ptitle.equals("") && p_content.equals("p_content")) {
			model.addAttribute("photo_list1", dao.photo_list1(rowStart, rowEnd, sWord, "2"));
			model.addAttribute("totRowCnt", dao.selCount1(sWord, "2"));
		} else if (ptitle.equals("ptitle") && p_content.equals("p_content")) {
			model.addAttribute("photo_list1", dao.photo_list1(rowStart, rowEnd, sWord, "3"));
			model.addAttribute("totRowCnt", dao.selCount1(sWord, "3"));
		} else if (ptitle.equals("") && p_content.equals("")) {
			model.addAttribute("photo_list1", dao.photo_list1(rowStart, rowEnd, sWord, "0"));
			model.addAttribute("totRowCnt", dao.selCount1(sWord, "0"));
		}

		
		model.addAttribute("searchPhoto", searchPhoto);
	
		
	
	
	return "photo1/photo_list1";
}
	@RequestMapping("/photo1/photo_write1")
	public String photo_write1(HttpServletRequest request,Model model) {
			System.out.println("qwrite");
		return "photo1/photo_write1";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/photo1/pwrite1")
	public String pwrite(HttpServletRequest request,Model model) throws Exception {
		 System.out.println("prite");
		 String attachPath = "\\resources\\upload\\";
			String uploadPath = request.getSession().getServletContext().getRealPath("/");
			String path = uploadPath + attachPath;
			
			MultipartRequest preq = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
					new DefaultFileRenamePolicy());

			PDao1 dao = sqlsession.getMapper(PDao1.class);
			
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
				dao.pwrite1( ptitle,pid,p_content,pname);
				
			} catch (Exception e) {
				System.out.println("Fuck U MAN");
			}
		 
		 
		return "redirect:photo_list1";
	}
	@RequestMapping("/photo1/pdownload1")
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

		return "photo_modify1?pid=" + pid;
	}
	@RequestMapping("/photo1/pdelete1")
	public String qdelete(HttpServletRequest request, Model model) {
		PDao1 dao = sqlsession.getMapper(PDao1.class);
		String p_num = request.getParameter("p_num");
		dao.pdelete1(p_num);

		return "redirect:photo_list1";
	}
	@RequestMapping("/photo1/photo_view1")
	public String photo_view(HttpServletRequest request, Model model) {
		System.out.println("content passing");

		PDao1 dao = sqlsession.getMapper(PDao1.class);
		
		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		
		String p_num = request.getParameter("p_num");
		String pid=request.getParameter("pid");

		model.addAttribute("photo_view1", dao.photo_view1(p_num));

		return "photo1/photo_view1";
	}
	@RequestMapping("/photo1/photo_modify1")
	public String photo_modify(HttpServletRequest request, Model model) {
		PDao1 dao = sqlsession.getMapper(PDao1.class);
		
		HttpSession session=request.getSession();
		String id="";
		id=(String)session.getAttribute("id");
		
		String p_num = request.getParameter("p_num");
		
		model.addAttribute("photo_modify1", dao.photo_modify1(p_num));

		return "photo1/photo_modify1";
	}
	@RequestMapping(method = RequestMethod.POST, value = "/photo1/photo_mo1")
	public String photo_mo(HttpServletRequest request, Model model) {

		PDao1 dao = sqlsession.getMapper(PDao1.class);
		
		String p_num = request.getParameter("p_num");
		String ptitle = request.getParameter("ptitle");
		String pid = request.getParameter("pid");
		String p_content = request.getParameter("p_content");

		dao.photo_mo1(p_num, ptitle, pid, p_content);

		return "redirect:photo_list1";
	}
}
