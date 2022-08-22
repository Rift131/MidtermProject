package com.skilldistillery.cakebids.entities;

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
	private List<Cake> flavors;
	
	
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

	public List<Cake> getFlavors() {
		return flavors;
	}

	public void setFlavors(List<Cake> flavors) {
		this.flavors = flavors;
	}

	@Override
	public String toString() {
		return "Flavor [id=" + id + ", name=" + name + "]";
	}
}
