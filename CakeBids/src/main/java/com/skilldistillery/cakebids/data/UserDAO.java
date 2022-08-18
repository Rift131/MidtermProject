package com.skilldistillery.cakebids.data;

import com.skilldistillery.cakebids.entities.User.User;

public interface UserDAO {
	
	
	User findById(int userId);
	
	
}
