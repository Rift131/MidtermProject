package com.skilldistillery.cakebids.entities.User;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CakeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Cake cake;

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
		cake = em.find(Cake.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cake = null;
	}

	@Test
	void test_Cake_entity_mapping() {
		assertNotNull(cake);
		assertEquals("Bill Nye's birthday!", cake.getName());
		assertEquals("2 tier science theme cake", cake.getDescription());
	}
	@Test
	void test_Cake_entity_mapping_ManyToOne_with_delivery_method_table() {
		DeliveryMethod deliveries = cake.getDeliveryMethods(); 
		assertNotNull(deliveries);
		assertNotNull(deliveries.getCakes());
		assertEquals("pick-up", deliveries.getDeliveryType());
	}
	@Test
	void test_Cake_entity_mapping_ManyToOne_with_cake_type_table() {
		CakeType cakeType = cake.getCaketype(); 
		assertNotNull(cakeType);
		assertNotNull(cakeType.getCakes());
		assertEquals("tiered", cakeType.getName());
	}
	@Test
	void test_Cake_entity_mapping_OneToMany_join_table_with_filling_table() {
		assertNotNull(cake);
		assertNotNull(cake.getFillings());
		assertFalse(cake.getFillings().size() > 0);
	}
	

}
