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

class CakeImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CakeImage cakeImage;

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
		cakeImage = em.find(CakeImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cakeImage = null;
	}

	@Test
	void test_CakeImage_entity_mapping() {
		assertNotNull(cakeImage);
		assertEquals("chocolate cake", cakeImage.getDescription());
	}
	
	@Test
	void test_CakeImage_entity_mapping_ManyToOne_with_Cake() {
		assertNotNull(cakeImage);
		assertNotNull(cakeImage.getCake().getCaketype());
		assertEquals("Bill Nye's birthday!", cakeImage.getCake().getName());
	}

}
