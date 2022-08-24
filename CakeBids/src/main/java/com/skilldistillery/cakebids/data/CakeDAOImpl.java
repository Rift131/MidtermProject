package com.skilldistillery.cakebids.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cakebids.entities.Bakery;
import com.skilldistillery.cakebids.entities.Cake;
import com.skilldistillery.cakebids.entities.CakeType;
import com.skilldistillery.cakebids.entities.DeliveryMethod;
import com.skilldistillery.cakebids.entities.Filling;
import com.skilldistillery.cakebids.entities.Flavor;

@Service
@Transactional
public class CakeDAOImpl implements CakeDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Cake findById(Integer id) {
		return em.find(Cake.class, id);
	}
	@Override
	public Cake createCake(Cake cake) {
		em.persist(cake);
		return cake;
	}
	@Override
	public Cake updateCake(Cake cake, Integer id) {
		Cake cakeUpdate = em.find(Cake.class, id);
		
		if(cakeUpdate != null) {
//			Remove anything not getting updated
			cakeUpdate.setName(cake.getName());
			cakeUpdate.setDescription(cake.getDescription());
			cakeUpdate.setSpecialInstructions(cake.getSpecialInstructions());
			cakeUpdate.setDateAdded(cake.getDateAdded());
			cakeUpdate.setOccasion(cake.getOccasion());
			cakeUpdate.setCakeType(cake.getCaketype());
			cakeUpdate.setDeliveryMethods(cake.getDeliveryMethods());
			cakeUpdate.setCakeInspiration(cake.getCakeInspiration());
			cakeUpdate.setBudget(cake.getBudget());
			cakeUpdate.setFillings(cake.getFillings());
			cakeUpdate.setFlavors(cake.getFlavors());
			cakeUpdate.setCakeImages(cake.getCakeImages());
		}
		
		return cakeUpdate;
	}
	
	@Override
	public List<Flavor> getFlavors(){
		String jpql = "SELECT f FROM Flavor f ORDER BY f.name";
		return em.createQuery(jpql, Flavor.class).getResultList();
	}
	@Override
	public List<Filling> getFillings() {
		String jpql = "SELECT f FROM Filling f ORDER BY f.fillingType";
		return em.createQuery(jpql, Filling.class).getResultList();
	}
	@Override
	public List<Bakery> getBakeries(){
		String jpql = "SELECT b FROM Bakery b ORDER BY b.name";
		return em.createQuery(jpql, Bakery.class).getResultList();
	}
	@Override
	public List<DeliveryMethod> getDeliveryMethods() {
		String jpql = "SELECT dm FROM DeliveryMethod dm ORDER BY dm.deliveryType";
		return em.createQuery(jpql, DeliveryMethod.class).getResultList();
	}
	@Override
	public List<CakeType> getCakeTypes() {
		String jpql = "SELECT ct FROM CakeType ct ORDER BY ct.name";
		return em.createQuery(jpql, CakeType.class).getResultList();
	}
	
	@Override
	public boolean deleteCake(Integer id) {
		Cake cake = em.find(Cake.class, id);
		boolean cakeDeleted = false;
		if(cake != null) {
			em.remove(cakeDeleted);
			cakeDeleted = !em.contains(cake);
		}
		return cakeDeleted;
	}
	@Override
	public List<Cake> findAll() {
		String jpql = "Select c FROM Cake c"; //Add cakes only if order has not been fulfilled
		
		return em.createQuery(jpql, Cake.class).getResultList();
	}

}
