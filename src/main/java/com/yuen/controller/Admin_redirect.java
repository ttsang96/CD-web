package com.yuen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_redirect {

	@RequestMapping("/manageFood")
	public ModelAndView food_page(){
		ModelAndView model = new ModelAndView("Admin_page/Admin-food");
		
		return model;
		
	}
	
}
