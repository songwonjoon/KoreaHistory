package com.tech.history.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewsController {

	@RequestMapping("/news/introduce")
	public String introduce() {

		return "news/introduce";
	}

	@RequestMapping("/introduce")
	public String introduce2() {

		return "introduce";
	}
	
	

	

	
}