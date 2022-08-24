package com.skilldistillery.cakebids.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.cakebids.data.CakeDAO;
import com.skilldistillery.cakebids.entities.Cake;

@Controller
public class CakeController {
	@Autowired
	private CakeDAO dao;
	
	@RequestMapping(path = { "createCake.do" })
	public String createCake(Cake cake, Model model) {
		model.addAttribute("flavors", dao.getFlavors());
		model.addAttribute("fillings", dao.getFillings());
		model.addAttribute("bakeries", dao.getBakeries());
		model.addAttribute("deliveryMethods", dao.getDeliveryMethods());
		model.addAttribute("cakeTypes", dao.getCakeTypes());
		// need occasions to iterate over (and all other tables with choices)
		
		// dao, controller for each 
		
		// call a method from the DAOImpl that will call all the users occasions 
		
		return "createCake";
	}

	@RequestMapping(path = { "cakeCreated.do" })
	public String createdCake(Cake cake, Model model) {
		dao.createCake(cake);
		model.addAttribute("cake", cake);
		return "cakeCreated";
	}
//	@RequestMapping(path = {"updateCake.do"})
//	public String updateCake(Integer id, Model model, HttpSession session) {
//		Cake cake = (Cake) session.getAttribute(id);
//		if (cake != null) {
//			int cakeId = cake.getId();
//			Cake cake = dao.findById(id);
//			model.addAttribute("cake", cake);
//			return "updateCake";
//		} else {
//			return "login";
//		}
//	}
	
	@RequestMapping(path = {"cakeUpdated.do"} )
	public String cakeUpdated(Cake cake, Integer id,  Model model) {
	dao.updateCake(cake, id);
	model.addAttribute("cake", cake);
		return "cakeUpdated";
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
