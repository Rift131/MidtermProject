package com.skilldistillery.cakebids.entities.User;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

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
	
	@ManyToOne
	@JoinColumn(name="delivery_id")
	private DeliveryMethod deliveryMethods;
	
	@Column(name = "cake_inspiration")
	private String cakeInspiration;

	private double budget;

	@ManyToOne
	@JoinColumn(name="cake_type_id")
	private CakeType cakeType;
	
	@ManyToMany(mappedBy="fillings")
	private List<Filling> fillings;
	
	
	
	
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



	public void setDeliveryMethods(DeliveryMethod deliveryMethods) {
		this.deliveryMethods = deliveryMethods;
	}

	public DeliveryMethod getDeliveryMethods() {
		return deliveryMethods;
	}

	public CakeType getCaketype() {
		return cakeType;
	}

	public void setCaketype(CakeType caketype) {
		this.cakeType = caketype;
	}

	public CakeType getCakeType() {
		return cakeType;
	}

	public void setCakeType(CakeType cakeType) {
		this.cakeType = cakeType;
	}


	public List<Filling> getFillings() {
		return fillings;
	}

	public void setFillings(List<Filling> fillings) {
		this.fillings = fillings;
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
				+ specialInstructions + ", dateAdded=" + dateAdded + ", occasionId=" + occasionId + ", deliveryMethods="
				+ deliveryMethods + ", cakeInspiration=" + cakeInspiration + ", budget=" + budget + ", cakeType="
				+ cakeType + ", filling=" + "]";
	}
}
