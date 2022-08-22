package com.skilldistillery.cakebids.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="delivery_method")
public class DeliveryMethod {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="delivery_type")
	private String deliveryType;
	
	@OneToMany(mappedBy="deliveryMethods")
	private List<Cake> cakes;

	public DeliveryMethod() {
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
		DeliveryMethod other = (DeliveryMethod) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public List<Cake> getCakes() {
		return cakes;
	}

	public void setCakes(List<Cake> cakes) {
		this.cakes = cakes;
	}

	@Override
	public String toString() {
		return "DeliveryMethod [id=" + id + ", deliveryType=" + deliveryType + "]";
	}
	
	
	
}
