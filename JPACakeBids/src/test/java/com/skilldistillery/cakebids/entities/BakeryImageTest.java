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


class BakeryImageTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BakeryImage bakeryImage;
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
		bakeryImage = em.find(BakeryImage.class, 1);
	}
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bakeryImage = null;
	}

	@Test
	void test_Bakery_image_entity_mapping() {
		assertNotNull(bakeryImage);
		assertEquals("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Pj_6y9xzcpWxjzB4IckMZa_jGYLlWh7nNg&usqp=CAU", bakeryImage.getImageUrl());
	}
	@Test
	void test_Bakery_image_entity_mapping_to_bakery_table() {
		assertNotNull(bakeryImage);
		assertNotNull(bakeryImage.getBakery());
		assertEquals("Chic French bakery", bakeryImage.getBakery().getDescription());
	}

}