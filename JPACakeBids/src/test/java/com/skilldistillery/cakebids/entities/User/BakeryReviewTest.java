package com.skilldistillery.cakebids.entities.User;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BakeryReviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BakeryReview bakeryReview;

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
		bakeryReview = em.find(BakeryReview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bakeryReview = null;
	}

	@Test
	void test_BakeryReview_entity_mapping() {
		assertNotNull(bakeryReview);
		assertEquals(5, bakeryReview.getRating());
		assertEquals(2022, bakeryReview.getReviewDate().getYear());
	}
	@Test
	void test_BakeryReview_mapping_to_user_table() {
		assertNotNull(bakeryReview);
		assertEquals("nyeGuy", bakeryReview.getUser().getUsername());
	}
	@Test
	void test_BakeryReview_test_mapping_to_bakery_table() {
		assertNotNull(bakeryReview);
		assertEquals(1, bakeryReview.getBakery().getId());
	}

}
