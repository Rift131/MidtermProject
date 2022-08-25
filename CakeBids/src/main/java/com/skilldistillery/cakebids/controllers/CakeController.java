package com.skilldistillery.cakebids.controllers;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.cakebids.data.CakeDAO;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.User;

@Controller
public class CakeController {
	@Autowired
	private CakeDAO dao;
	
	@RequestMapping(path = { "createCake.do" })
	public String createCake(Cake cake, Model model) {
		
		model.addAttribute("deliveryMethods", dao.getDeliveryMethods());
		model.addAttribute("cakeTypes", dao.getCakeTypes());
		model.addAttribute("fillings", dao.getFillings());
		model.addAttribute("flavors", dao.getFlavors());
		model.addAttribute("bakeries", dao.getBakeries());
		
		return "createCake";
	}

	@RequestMapping(path = { "cakeCreated.do" })
	public String createdCake(Cake cake, Model model, HttpSession session, Integer bakeryId, Integer [] flavorIds, Integer [] fillingIds) {
		System.out.println(Arrays.deepToString(flavorIds));
		System.out.println(Arrays.deepToString(fillingIds));
		User user = (User)session.getAttribute("loggedIn");
		if (user != null) {
			cake = dao.createCake(cake, user, bakeryId, flavorIds, fillingIds);
			
		}
		
		model.addAttribute("cake", cake);
		
		return "cakeCreated";
	}
	
	
	
	
	@RequestMapping(path = "deleted.do")
	public String deleteCake(Integer id) {
		Cake cake = dao.findById(id);
		dao.deleteCake(id);
		
		return "deleted";
	}
	@RequestMapping(path = "showCakes.do")
	public String getCakes( Model model) {
		
		model.addAttribute("cakes", dao.findAll());
		return "showCakes";
	}
}
