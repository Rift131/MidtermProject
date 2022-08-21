package com.skilldistillery.cakebids.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.cakebids.entities.User.Bakery;
import com.skilldistillery.cakebids.entities.User.BakeryImage;
import com.skilldistillery.cakebids.entities.User.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User logIn(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :u AND u.password = :p AND u.enabled = 1";
		User user = null;
		
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("u", username)
					.setParameter("p", password)
					.getSingleResult();
		} catch (Exception e) {
			System.out.println("Incorrect Login Info");
		}
		
		return user;
	}


	@Override
	public User createAccount(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateAccount(User user, Integer id) {
		User updateUser = em.find(User.class, id);

		if (updateUser != null) {
			updateUser.setUsername(user.getUsername());
			updateUser.setPassword(user.getPassword());
			updateUser.setFirstName(user.getFirstName());
			updateUser.setLastName(user.getLastName());
			updateUser.setAddress(user.getAddress()); // Check for address line 2 being retrieved
			updateUser.setProfilePic(user.getProfilePic());
			updateUser.setAboutMe(user.getAboutMe());
			updateUser.setRole(user.getRole()); // Regular user or Bakery
		}

		return updateUser;
	}

	@Override
	public boolean deactivateAccount(Integer id) {
		boolean successful = false;
		User userDeactivated = em.find(User.class, id);
		boolean user = userDeactivated.isEnabled();

		if (user) {
			user = false;
			successful = true;
		}
		return successful;
	}

	@Override
	public Bakery createBakeryAccount(Bakery bakery) {
		em.persist(bakery);		
		return bakery;
	}
	
	@Override
	public Bakery updateBakeryAccount(Bakery bakery, Integer id) {
		Bakery updateBakery = em.find(Bakery.class, id);

		if (updateBakery != null) {
			updateBakery.setOwner(bakery.getOwner());
			updateBakery.setName(bakery.getName());
			updateBakery.setDescription(bakery.getDescription());
			updateBakery.setImageUrl(bakery.getImageUrl());
			updateBakery.setWebsiteUrl(bakery.getWebsiteUrl());
			updateBakery.setHoursOfOperation(bakery.getHoursOfOperation());
			updateBakery.setBakeryImages(bakery.getBakeryImages());
			updateBakery.setBakeryImages(bakery.get);
		}

		return updateBakery;
	}
	
}
