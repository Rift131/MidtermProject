package com.skilldistillery.cakebids.entities.User;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="cake_has_fillings")
public class CakeFillings {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "cake_id")
	private int id;
	
	@Column(name="fillings_filling_id")
	private int fillingsId;

	public CakeFillings() {
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
		CakeFillings other = (CakeFillings) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFillingsId() {
		return fillingsId;
	}

	public void setFillingsId(int fillingsId) {
		this.fillingsId = fillingsId;
	}

	@Override
	public String toString() {
		return "CakeFillings [id=" + id + ", fillingsId=" + fillingsId + "]";
	}
	
}
