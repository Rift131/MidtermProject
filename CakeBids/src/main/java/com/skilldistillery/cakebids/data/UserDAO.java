package com.skilldistillery.cakebids.data;

import java.util.List;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.BakeryReview;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeReview;
import com.skilldistillery.cakebids.entities.User;

public interface UserDAO {

	User findById(int userId);

	User logIn(String username, String password);
	
//	User logOut(String username, String password);
	
	User createAccount(User user);
	
	User updateAccount(User user, Integer id);

	boolean deactivateAccount(Integer id);
	
	Bakery createBakeryAccount(Bakery bakery);
	
	Bakery findBakeryById(int bakeryId);

	Bakery updateBakeryAccount(Bakery bakery, Integer id);
	
	User createBakeryReview(BakeryReview review, Integer id);
	
	User updateBakeryReview(BakeryReview review, Integer id);
	
	User createCakeReview(CakeReview review, Integer id);
	
	User updateCakeReview(CakeReview review, Integer id);
	
	User commentOnBakeryReview(BakeryReview review, Integer id);
	
	User commentOnCakeReview(CakeReview review, Integer id);

	List<Bakery> getOrders(Bakery cakeBids);
	
	List<Bakery> findBakery(String keyword);
	
}
