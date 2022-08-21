package com.skilldistillery.cakebids.entities.User;

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
	private List<Cake> fillings;
	
	
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


	public List<Cake> getFillings() {
		return fillings;
	}

	public void setFillings(List<Cake> fillings) {
		this.fillings = fillings;
	}

	@Override
	public String toString() {
		return "Filling [id=" + id + ", fillingType=" + fillingType + "]";
	}
	
}
