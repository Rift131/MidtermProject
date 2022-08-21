package com.skilldistillery.cakebids.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class BakeryDAOImpl implements BakeryDAO {
	@PersistenceContext
	private EntityManager em;
	
}
