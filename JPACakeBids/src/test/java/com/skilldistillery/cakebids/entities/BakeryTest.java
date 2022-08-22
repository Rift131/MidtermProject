package com.skilldistillery.cakebids.entities;

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

public class BakeryTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Bakery bakery;


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
		bakery = em.find(Bakery.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bakery = null;
	}

	@Test
	void test_Bakery_entity_mapping() {
		assertNotNull(bakery);
		assertEquals("La Patisserie Chouquette", bakery.getName());
		//assertEquals("Apt. 5", Bakery.getBakery2());
	}
	@Test
	void test_Bakery_entity_mapping_to_User_table() {
		User owner = bakery.getOwner();
		assertNotNull(owner);
		assertEquals(1, owner.getId());
	}
	@Test
	void test_Bakery_entity_mapping_to_bakery_review_table() {
		assertNotNull(bakery);
		assertNotNull(bakery.getReviews());
		assertTrue(bakery.getReviews().size() > 0);
	}
	@Test
	void test_Bakery_entity_mapping_to_bakery_image_table() {
		assertNotNull(bakery);
		assertNotNull(bakery.getBakeryImages());
		assertTrue(bakery.getBakeryImages().size() > 0);
	}

	@Test
	void test_Bakery_entity_mapping_to_cake_bid_table() {
		assertNotNull(bakery);
		assertNotNull(bakery.getCakeBids());
		assertTrue(bakery.getCakeBids().size() > 0);
	}

}