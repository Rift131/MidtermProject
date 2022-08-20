package com.skilldistillery.cakebids.entities.User;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPACakeBids");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("nyeGuy", user.getUsername());
	}
	
	@Test
	void test_User_mapping_to_cake_review() {
		assertNotNull(user);
		assertNotNull(user.getCakeReview());
		assertTrue(user.getCakeReview().size() > 0);
	}
	@Test
	void test_User_mapping_to_bakery_review_table() {
		assertNotNull(user);
		assertNotNull(user.getBakeryReviews());
		assertTrue(user.getBakeryReviews().size() > 0);
	}
	@Test
	void test_User_mapping_to_address_table() {
		Address address = user.getAddress();
		assertNotNull(address);
		assertNotNull(address.getAddress());
		assertEquals("TX", user.getAddress().getState());
	}

}
