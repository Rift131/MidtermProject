package com.skilldistillery.cakebids.entities.User;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="cake_has_flavor")
public class CakeFlavor {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "cake_flavor_id")
	private int id;
	@Column(name="cake_id")
	private int cakeId;
	
	public CakeFlavor() {
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
		CakeFlavor other = (CakeFlavor) obj;
		return id == other.id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCakeId() {
		return cakeId;
	}
	public void setCakeId(int cakeId) {
		this.cakeId = cakeId;
	}
	@Override
	public String toString() {
		return "CakeFlavor [id=" + id + ", cakeId=" + cakeId + "]";
	}
}
