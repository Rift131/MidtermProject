package com.skilldistillery.cakebids.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.cakebids.data.UserDAO;
import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {

		model.addAttribute("SMOKETEST", dao.findById(1));

		return "home";
	}

	@RequestMapping(path = { "login.do" }, method=RequestMethod.POST)
	public String logIn(HttpSession session, User user) {
		user = dao.logIn(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedIn", user);
			return "customerAccount";
		} else {
			return "failedlogin";
		}
	}
	
	@RequestMapping(path = { "login.do" }, method=RequestMethod.GET)
	public String logIn() {
		
		return "login";
		}
	
	@RequestMapping(path = { "bakerylogin.do" }, method=RequestMethod.POST)
	public String logInBakery(HttpSession session, User user) {
		user = dao.logIn(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedIn", user);
			return "customerAccount";
		} else {
			return "failedlogin";
		}
	}
	@RequestMapping(path = { "customerAccount.do" })
	public String viewAcct(HttpSession session) {
		if(session.getAttribute("loggedIn") != null) {
			return "customerAccount";
		}
		else {
			return "login";
		}
		
	}
	
	
	@RequestMapping(path = { "logout.do" })
	public String logOut(HttpSession session) {
		session.removeAttribute("loggedIn");
		return "home";
	}

	@RequestMapping(path = { "createAccount.do" })
	public String createAccount(User user) {
		return "createAccount";
	}

	@RequestMapping(path = { "accountCreated.do" })
	public String createdAccount(User user, Model model, HttpSession session) {
		user = dao.createAccount(user);
		session.setAttribute("loggedIn", user);
		model.addAttribute("user", user);
		return "accountCreated";
	}
	
	@RequestMapping(path = {"accountUpdate.do"})
	public String updateAccount(Integer id, Model model) {
		User user = dao.findById(id);
		model.addAttribute("user", user);
		return "accountUpdate";
	}
	
	@RequestMapping(path = {"accountUpdated.do"} )
	public String accountUpdated(User user, Integer id,  Model model) {
	dao.updateAccount(user, id);
	model.addAttribute("user", user);
		return "accountUpdated";
	}
	
	@RequestMapping(path = {"accountDeactivated.do"})
	public String deactivateAccount(Model model, Integer id, HttpSession session) {
		dao.deactivateAccount(id);
		session.removeAttribute("loggedIn");
		return "home";
	}
	
	@RequestMapping(path = { "createBakeryAccount.do" })
	public String createBakeryAccount(Bakery bakery) {
		return "createBakeryAccount";
	}

	@RequestMapping(path = { "bakeryAccountCreated.do" }, method=RequestMethod.POST)
	public String createdBakeryAccount(Bakery bakery, Model model, HttpSession session) {
		bakery = dao.createBakeryAccount(bakery);
		session.setAttribute("loggedIn", bakery.getOwner());
		model.addAttribute("bakery", bakery);
		return "bakeryAccountCreated";
	}
	@RequestMapping(path = {"bakeryAccountUpdate.do"})
	public String updateBakeryAccount(Integer id, Model model) {
		User bakery = dao.findById(id);
		model.addAttribute("bakery", bakery);
		return "bakeryAccountUpdate";
	}
}
