package com.skilldistillery.cakebids.controllers;

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
	public String createCake(Cake cake) {
		return "createCake";
	}

	@RequestMapping(path = { "cakeCreated.do" })
	public String createdCake(Cake cake, Model model) {
		dao.createCake(cake);
		model.addAttribute("cake", cake);
		return "cakeCreated";
	}
	@RequestMapping(path = {"updateCake.do"})
	public String updateCake(Integer id, Model model) {
		Cake cake = dao.findById(id);
		model.addAttribute("cake", cake);
		return "updateCake";
	}
	
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
