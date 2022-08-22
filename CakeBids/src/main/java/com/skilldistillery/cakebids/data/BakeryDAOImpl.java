package com.skilldistillery.cakebids.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.BakeryReview;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeBid;

public class BakeryDAOImpl implements BakeryDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Bakery findOpenRequests(CakeBid cakeId, Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bakery findReviews(BakeryReview review, Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bakery getOrders(Cake cakeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bakery updateOrders(Cake cakeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bakery updateBid(CakeBid cakeId, Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bakery deleteOrder(Cake cakeId) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
}
