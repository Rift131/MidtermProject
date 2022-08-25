package com.skilldistillery.cakebids.data;

import java.util.List;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeType;
import com.skilldistillery.cakebids.entities.DeliveryMethod;
import com.skilldistillery.cakebids.entities.Filling;
import com.skilldistillery.cakebids.entities.Flavor;
import com.skilldistillery.cakebids.entities.User;


public interface CakeDAO {
	
	Cake findById(Integer id);

	Cake updateCake(Cake cake, Integer id);
	
	boolean deleteCake(Integer id);
	
	List<Cake> findAll();

	List<Flavor> getFlavors();

	List<Filling> getFillings();

	List<Bakery> getBakeries();

	List<DeliveryMethod> getDeliveryMethods();

	List<CakeType> getCakeTypes();

	Cake createCake(Cake cake, User user, Integer bakeryId, Integer [] flavorIds, Integer [] fillingIds);
}
