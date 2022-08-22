package com.skilldistillery.cakebids.controllers;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.cakebids.data.BakeryDAO;
import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.BakeryReview;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeBid;

public class BakeryController {

	private BakeryDAO dao;

	@RequestMapping(path = { "openRequests.do" })
	public String findOpenRequests(Model model, CakeBid cakeId, Integer id) {

		model.addAttribute("requests", dao.findOpenRequests(cakeId, id));

		return "openRequests";
	}

	@RequestMapping(path = { "findReviews.do" })
	public String findReviews(Model model, BakeryReview review, Integer id) {

		model.addAttribute("reviews", dao.findReviews(review, id));

		return "findReviews";
	}

	@RequestMapping(path = { "findOrders.do" })
	public String getOrders(Model model, Cake cakeId) {

		model.addAttribute("orders", dao.getOrders(cakeId));

		return "findOrders";
	}

	@RequestMapping(path = { "updateOrder.do" })
	public String updateOrders(Model model, Cake cakeId) {
		Bakery order = dao.getOrders(cakeId);

		model.addAttribute("order", order);

		return "updateOrder";

	}

	@RequestMapping(path = { "orderUpdated.do" })
	public String orderUpdated(Model model, Cake cakeId) {
		dao.updateOrders(cakeId);
		model.addAttribute("order", cakeId);
		return "orderUpdated";
	}

	@RequestMapping(path = "orderDeleted.do")
	public String deleteOrder(Model model, Cake cakeId) {
		Bakery order = dao.getOrders(cakeId);
		dao.deleteOrder(cakeId);
		return "orderDeleted";
	}
}
