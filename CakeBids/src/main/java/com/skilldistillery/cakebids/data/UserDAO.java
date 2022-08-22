package com.skilldistillery.cakebids.data;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.User;

public interface UserDAO {

	User findById(int userId);

	User logIn(String username, String password);
	
//	User logOut(String username, String password);
	
	User createAccount(User user);
	
	User updateAccount(User user, Integer id);

	boolean deactivateAccount(Integer id);
	
	Bakery createBakeryAccount(Bakery bakery);

	Bakery updateBakeryAccount(Bakery bakery, Integer id);
	
	
}
