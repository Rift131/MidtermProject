package com.skilldistillery.cakebids.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.BakeryReview;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeBid;

@Service
@Transactional
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

	@Override
	public List<Bakery> findAll() {
		String jpql = "SELECT b FROM Bakery b";
		return em.createQuery(jpql, Bakery.class).getResultList();
	}

	
	
	
}
