package com.skilldistillery.cakebids.data;

import java.util.List;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeType;
import com.skilldistillery.cakebids.entities.DeliveryMethod;
import com.skilldistillery.cakebids.entities.Filling;
import com.skilldistillery.cakebids.entities.Flavor;


public interface CakeDAO {
	
	Cake findById(Integer id);

	Cake createCake(Cake cake);
	
	Cake updateCake(Cake cake, Integer id);
	
	boolean deleteCake(Integer id);
	
	List<Cake> findAll();

	List<Flavor> getFlavors();

	List<Filling> getFillings();

	List<Bakery> getBakeries();

	List<DeliveryMethod> getDeliveryMethods();

	List<CakeType> getCakeTypes();
}
