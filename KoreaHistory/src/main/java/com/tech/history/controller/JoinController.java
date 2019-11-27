package com.tech.history.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tech.history.service.IdCheckServiceImpl;
import com.tech.history.service.JoinMemberServiceImpl;
import com.tech.history.service.MemberService;

@Controller
public class JoinController {
	
	MemberService memberService;
	
	@RequestMapping("/join/join")
	public String join() {
		System.out.println("join Passing");
		return "join/join";
	}

	@RequestMapping("/join/idCheckView")
	public String idCheckView() {
		System.out.println("idCheckView passing");
		
		return "/join/idCheckView";
	}
	
	
	@RequestMapping("/join/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {
		System.out.println("idCheck Passing");
		model.addAttribute("request", request);
		memberService = new IdCheckServiceImpl();
		memberService.execute(model);
		
		return "join/idCheck";
	}
	
	
	
	@RequestMapping(method=RequestMethod.POST ,value="/joinProc")
	public String joinProc(HttpServletRequest request, Model model) {
		System.out.println("joinProc Passing");
		
		model.addAttribute("request", request);
		memberService = new JoinMemberServiceImpl();
		memberService.execute(model);
		
//		return "redirect:/";  //아예 맨처음 화면, 대문으로 보내기
		return "/Html"; //기능 구현 테스트 화면으로 보내기
	}
	
	/*email인증 추가*/
	@RequestMapping("/member/emailAuth")
	public ModelAndView emailAuth(HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		System.out.println("emailAuth passing");
		
		String email = request.getParameter("email");
		String authNum = "";
		
		authNum = RandomNum();
		
		sendEmail(email, authNum);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/emailAuth");
		mv.addObject("email", email);
		mv.addObject("authNum", authNum);
		
		return mv;
	}
	
	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "Korea History 인증번호 전달";
		String fromName = "Korea History 관리자";
		String from = "doosanko37@gmail.com"; //보내는 메일 
		String to1 = email;
		
		String content = "인증번호 [" + authNum + "]";
		
		try {
			Properties props = new Properties();
			// G-Mail SMTP 사용시
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", 
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, 
					new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication("doosanko37@gmail.com", 
									"26197045nk!?"); //해당 gmail 아이디 사용시 보안설정에서 "수준이 낮은 앱 사용을 허용으로 설정"해야만 사용가능함.
						}
					});   
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(
					fromName, "UTF-8", "B"))); // 보내는 사람 설정
			
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);// 받는 사람설정1
			msg.setSubject(subject);// 제목 설정
			msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
			msg.setContent(content, "text/html;charset=euc-kr"); // 내용 설정 (HTML형식)
			
			Transport.send(msg); // 메일 보내기
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	/*email인증 추가 여기까지*/
	
	
	@RequestMapping("/certify/before_emailAuth")
	public String before_emailAuth() {
		System.out.println("before_emailAuth Passing");
		return "certify/before_emailAuth";
	}
	
}
