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

import com.skilldistillery.cakebids.entities.CakeBid;

class CakeBidTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CakeBid cakeBid;

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
		cakeBid = em.find(CakeBid.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cakeBid = null;
	}

	@Test
	void test_CakeBid_entity_mapping() {
		assertNotNull(cakeBid);
		assertEquals(1, cakeBid.getId());
		assertEquals(150.00, cakeBid.getPrice());
	}
	@Test
	void test_CakeBid_entity_mapping_to_Bakery_table() {
		assertNotNull(cakeBid);
		assertNotNull(cakeBid.getBakery());
		assertEquals(1, cakeBid.getBakery().getId());
		assertTrue(cakeBid.getBakery().getCakeBids().size() > 0);
	}

}
