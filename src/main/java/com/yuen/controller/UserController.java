package com.yuen.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yuen.domain.User;
import com.yuen.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@GetMapping("/ttsfood")
	public ModelAndView index(){
		ModelAndView model = new ModelAndView("header");
		model.addObject("users", userservice.findAll());
		return model;
	}
	
	
	@GetMapping("/ttsfood/login")
	public String login(Model model){
		model.addAttribute("user", new User());
		return "login";
	}
	@GetMapping("/ttsfood/singUp")
	public String signUp(Model model){
		model.addAttribute("user", new User());
		return "register";
	}
	
	@PostMapping("/ttsfood/saveUser")
	public String save(@Valid User user, BindingResult result, RedirectAttributes redirect){
		 if (result.hasErrors()) {
		        return "login";
		    }
		userservice.save(user);
		return "redirect:/ttsfood";
	}
}
