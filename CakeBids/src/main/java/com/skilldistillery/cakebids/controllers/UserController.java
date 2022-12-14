package com.skilldistillery.cakebids.controllers;

import java.util.List;

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

	@RequestMapping(path = { "login.do" }, method = RequestMethod.POST)
	public String logIn(HttpSession session, User user) {
		user = dao.logIn(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedIn", user);
			return "customerAccount";
		} else {
			return "failedlogin";
		}
	}

	@RequestMapping(path = { "login.do" }, method = RequestMethod.GET)
	public String logIn() {

		return "login";
	}

	@RequestMapping(path = { "bakerylogin.do" }, method = RequestMethod.POST)
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
		User user = (User) session.getAttribute("loggedIn");
		if (user != null) {
			session.setAttribute("loggedIn", dao.findById(user.getId()));
			return "customerAccount";
		} else {
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

	@RequestMapping(path = { "accountUpdate.do" }, method = RequestMethod.POST)
	public String updateAccount(Integer id, Model model, HttpSession session) {
		User u = (User) session.getAttribute("loggedIn");
		if (u != null) {
			int userId = u.getId();
			User user = dao.findById(userId);
			model.addAttribute("user", user);
			return "accountUpdate";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = { "accountUpdated.do" }, method = RequestMethod.POST)
	public String accountUpdated(User user, Integer id, Model model, HttpSession session) {
		dao.updateAccount(user, id);
		session.setAttribute("loggedIn", user);
		return "accountUpdated";
	}
	@RequestMapping(path = { "bakeryAccountUpdate.do" }, method = RequestMethod.POST)
	public String updateBakeryAccount(Integer id, Model model, HttpSession session) {
		User b = (User) session.getAttribute("loggedIn");
		if(b != null) {
			int userId = b.getId();
			User user = dao.findById(userId);
			model.addAttribute("owner", user);
		return "bakeryAccountUpdate";
		}
		else {
			return "login";
		}
	}
	@RequestMapping(path = { "updatedBakeryAccount.do" }, method = RequestMethod.POST)
	public String bakeryAccountUpdated(Bakery bakery, Integer id, Model model, HttpSession session) {
		dao.updateBakeryAccount(bakery, id);
		session.setAttribute("loggedIn", bakery.getOwner());
		return "updatedBakeryAccount";
	}
	@RequestMapping(path = { "accountDeactivated.do" })
	public String deactivateAccount(Model model, HttpSession session) {
		User u = (User) session.getAttribute("loggedIn");
		if (u != null) {
			int userId = u.getId();

			dao.deactivateAccount(userId);
			session.removeAttribute("loggedIn");
			return "accountDeactivated";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = { "createBakeryAccount.do" })
	public String createBakeryAccount(Bakery bakery) {
		return "createBakeryAccount";
	}

	@RequestMapping(path = { "bakeryAccountCreated.do" }, method = RequestMethod.POST)
	public String createdBakeryAccount(Bakery bakery, Model model, HttpSession session) {
		bakery = dao.createBakeryAccount(bakery);
		session.setAttribute("loggedIn", bakery.getOwner());
		model.addAttribute("bakery", bakery);
		return "bakeryAccountCreated";
	}
	
	@RequestMapping(path= {"bakeryStorefront.do"})
	public String findBakeryById(Integer bakeryId, Model model) {
		
		Bakery bakery = dao.findBakeryById(bakeryId);
		model.addAttribute("bakery", bakery);
		return "bakeryStorefront";
	}
	
	@RequestMapping("searchKeyword.do")
    public String searchByKeyword(Model model, String keyword) {
        List<Bakery> bakery = dao.findBakery(keyword);
        if(bakery.size() > 0) {
        model.addAttribute("bakery", bakery);
        return "showBakeries";
        }else {
            return "home";
        }
    }
}
