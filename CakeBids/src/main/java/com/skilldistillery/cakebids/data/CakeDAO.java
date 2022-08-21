package com.skilldistillery.cakebids.data;

import java.util.List;

import com.skilldistillery.cakebids.entities.User.Cake;


public interface CakeDAO {
	
	Cake findById(Integer id);

	Cake createCake(Cake cake);
	
	Cake updateCake(Cake cake, Integer id);
	
	boolean deleteCake(Integer id);
	
	List<Cake> findAll();
}
