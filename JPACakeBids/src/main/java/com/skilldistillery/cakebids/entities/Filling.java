package com.skilldistillery.cakebids.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
@Entity
public class Filling {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="filling_type")
	private String fillingType;

	@ManyToMany
	@JoinTable(
			name="cake_has_fillings",
			joinColumns= @JoinColumn(name="fillings_type_id"),
			inverseJoinColumns = @JoinColumn(name="cake_id"))
	private List<Cake> cakes;
	
	
	public Filling() {
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
		Filling other = (Filling) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFillingType() {
		return fillingType;
	}

	public void setFillingType(String fillingType) {
		this.fillingType = fillingType;
	}


	public List<Cake> getCakes() {
		return cakes;
	}

	public void setCakes(List<Cake> fillings) {
		this.cakes = fillings;
	}
	
	public void addCake(Cake cake) {
		if(cakes == null) {
			cakes = new ArrayList<>();
		}
		if(!cakes.contains(cake)) {
			cakes.add(cake);
			cake.addFilling(this);
		}
	}
	
	public void removeCake(Cake cake) {
		
	}

	@Override
	public String toString() {
		return "Filling [id=" + id + ", fillingType=" + fillingType + "]";
	}
	
}
