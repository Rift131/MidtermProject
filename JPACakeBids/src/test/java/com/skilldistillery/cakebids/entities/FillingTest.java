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

import com.skilldistillery.cakebids.entities.Filling;

class FillingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Filling filling;

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
		filling = em.find(Filling.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		filling = null;
	}

	@Test
	void test_Filling_entity_mapping() {
		assertNotNull(filling);
		assertEquals("lemon-curd", filling.getFillingType());
	}
	@Test
	void test_Filling_entity_mapping_ManyToMany_with_cake_table() {
		assertNotNull(filling);
		assertNotNull(filling.getCakes());
		assertTrue(filling.getCakes().size() > 0);
	}

}
