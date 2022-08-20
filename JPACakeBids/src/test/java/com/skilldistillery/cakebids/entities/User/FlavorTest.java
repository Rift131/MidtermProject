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

class FlavorTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Flavor flavor;

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
		flavor = em.find(Flavor.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		flavor = null;
	}

	@Test
	void test_Flavor_entity_mapping() {
		assertNotNull(flavor);
		assertEquals("chocolate/chocolate", flavor.getName());
	}

}
