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

class CakeReviewTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CakeReview cakeReview;

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
		cakeReview = em.find(CakeReview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cakeReview = null;
	}

	@Test
	void test_CakeReview_entity_mapping() {
		assertNotNull(cakeReview);
		assertEquals("so delish", cakeReview.getReview());
		assertEquals(2, cakeReview.getRating());
	}
	
	@Test
	void test_CakeReview_entity_mapping_to_User_Table() {
		assertNotNull(cakeReview);
		assertEquals(1, cakeReview.getUser().getId());
	}

}
