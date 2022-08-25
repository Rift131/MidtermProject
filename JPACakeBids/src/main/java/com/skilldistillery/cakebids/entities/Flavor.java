package com.skilldistillery.cakebids.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
@Entity
public class Flavor {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;

	@ManyToMany
	@JoinTable(
			name="cake_has_flavor",
			joinColumns= @JoinColumn(name="cake_flavor_id"),
			inverseJoinColumns = @JoinColumn(name="cake_id"))
	private List<Cake> cakes;
	
	
	public Flavor() {
		super();
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Flavor other = (Flavor) obj;
		return id == other.id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Cake> getCakes() {
		return cakes;
	}

	public void setCakes(List<Cake> flavors) {
		this.cakes = flavors;
	}
	
	public void addCake(Cake cake) {
		if(cakes == null) {
			cakes = new ArrayList<>();
		}
		if(!cakes.contains(cake)) {
			cakes.add(cake);
			cake.addFlavor(this);
		}
	}
	
	public void removeCake(Cake cake) {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Flavor [id=" + id + ", name=" + name + "]";
	}
}
