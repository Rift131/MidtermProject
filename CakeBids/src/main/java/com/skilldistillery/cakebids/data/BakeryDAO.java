package com.skilldistillery.cakebids.data;

import java.util.List;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.BakeryReview;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeBid;

public interface BakeryDAO {

		Bakery findOpenRequests(CakeBid cakeId, Integer id);
		
		Bakery findReviews(BakeryReview review, Integer id);
		
		Bakery getOrders(Cake cakeId);

		Bakery updateOrders(Cake cakeId);
		
		Bakery updateBid(CakeBid cakeId, Integer id);
		
		Bakery deleteOrder(Cake cakeId);
		
		List<Bakery> findAll();
}
