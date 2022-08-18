package com.skilldistillery.cakebids.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.cakebids.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
}
