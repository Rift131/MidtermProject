package com.skilldistillery.cakebids.entities.User;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cake {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;
	@Column(name = "special_instructions")
	private String specialInstructions;
	@Column(name = "date_added")
	private LocalDateTime dateAdded;
	@Column(name = "occasion_id")
	private int occasionId;
	@Column(name = "cake_type_id")
	private int cakeTypeId;
	@Column(name = "delivery_id")
	private int deliveryId;
	@Column(name = "cake_inspiration")
	private String cakeInspiration;

	private double budget;

	public Cake() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSpecialInstructions() {
		return specialInstructions;
	}

	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}

	public LocalDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(LocalDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public int getOccasionId() {
		return occasionId;
	}

	public void setOccasionId(int occasionId) {
		this.occasionId = occasionId;
	}

	public int getCakeTypeId() {
		return cakeTypeId;
	}

	public void setCakeTypeId(int cakeTypeId) {
		this.cakeTypeId = cakeTypeId;
	}

	public int getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(int deliveryId) {
		this.deliveryId = deliveryId;
	}

	public String getCakeInspiration() {
		return cakeInspiration;
	}

	public void setCakeInspiration(String cakeInspiration) {
		this.cakeInspiration = cakeInspiration;
	}

	public double getBudget() {
		return budget;
	}

	public void setBudget(double budget) {
		this.budget = budget;
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
		Cake other = (Cake) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Cake [id=" + id + ", name=" + name + ", description=" + description + ", specialInstructions="
				+ specialInstructions + ", dateAdded=" + dateAdded + ", occasionId=" + occasionId + ", cakeTypeId="
				+ cakeTypeId + ", deliveryId=" + deliveryId + ", cakeInspiration=" + cakeInspiration + ", budget="
				+ budget + "]";
	}
}
