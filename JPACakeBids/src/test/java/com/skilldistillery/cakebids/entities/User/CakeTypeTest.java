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

class CakeTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CakeType cakeType;

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
		cakeType = em.find(CakeType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cakeType = null;
	}

	@Test
	void test_CakeType_entity_mapping() {
		assertNotNull(cakeType);
		assertEquals("tiered", cakeType.getName());
	}
	@Test
	void test_CakeType_entity_mapping_OneToMany_with_cake_table() {
		assertNotNull(cakeType);
		assertNotNull(cakeType.getCakes());
		assertTrue(cakeType.getCakes().size() > 0);
	}

}
