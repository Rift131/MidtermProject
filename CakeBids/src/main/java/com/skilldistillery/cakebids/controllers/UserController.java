package com.skilldistillery.cakebids.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.cakebids.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		
		model.addAttribute("SMOKETEST", dao.findById(1));
		
		return "home";
	}
	
}
