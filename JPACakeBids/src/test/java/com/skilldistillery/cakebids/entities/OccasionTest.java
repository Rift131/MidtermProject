package com.skilldistillery.cakebids.entities;

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

import com.skilldistillery.cakebids.entities.Occasion;

class OccasionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Occasion occasion;

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
		occasion = em.find(Occasion.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		occasion = null;
	}

	@Test
	void test_Occasion_entity_mapping() {
		assertNotNull(occasion);
		assertEquals("wedding", occasion.getName());
		assertEquals(00, occasion.getDate().getSecond());
		assertEquals("3 tier watercolor cake", occasion.getDescription());
	}
	@Test
	void test_Occasion_entity_mapping_ManyToOne_with_address_table() {
		assertNotNull(occasion);
		assertNotNull(occasion.getAddress());
		assertEquals(2, occasion.getAddress().getId());
	}

}
