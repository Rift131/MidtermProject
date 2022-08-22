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

import com.skilldistillery.cakebids.entities.DeliveryMethod;

class DeliveryMethodTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private DeliveryMethod deliveryMethod;

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
		deliveryMethod = em.find(DeliveryMethod.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		deliveryMethod = null;
	}

	@Test
	void test_DeliveryMethod_entity_mapping() {
		assertNotNull(deliveryMethod);
		assertEquals("pick-up", deliveryMethod.getDeliveryType());
	}
	@Test
	void test_DeliveryMethod_entity_mapping_OneToMany_with_cake_table() {
		assertNotNull(deliveryMethod);
		assertNotNull(deliveryMethod.getCakes());
		assertTrue(deliveryMethod.getCakes().size() > 0);
	}

}
