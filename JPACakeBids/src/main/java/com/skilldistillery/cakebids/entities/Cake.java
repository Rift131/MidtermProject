package com.skilldistillery.cakebids.entities;

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
import javax.persistence.OneToMany;

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
	
	@ManyToOne
	@JoinColumn(name="delivery_id")
	private DeliveryMethod deliveryMethods;
	
	@Column(name = "cake_inspiration")
	private String cakeInspiration;

	private double budget;

	@ManyToOne
	@JoinColumn(name="cake_type_id")
	private CakeType cakeType;
	
	@ManyToOne
	@JoinColumn(name="occasion_id")
	private Occasion occasion;
	
	@ManyToMany(mappedBy="fillings")
	private List<Filling> fillings;

	@ManyToMany(mappedBy="flavors")
	private List<Flavor> flavors;
	
	@OneToMany(mappedBy="cake")
	private List<CakeImage> cakeImages;
	
	
	
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

	public List<Flavor> getFlavors() {
		return flavors;
	}

	public void setFlavors(List<Flavor> flavors) {
		this.flavors = flavors;
	}

	public List<CakeImage> getCakeImages() {
		return cakeImages;
	}

	public void setCakeImages(List<CakeImage> cakeImage) {
		this.cakeImages = cakeImage;
	}

	public Occasion getOccasion() {
		return occasion;
	}

	public void setOccasion(Occasion occasion) {
		this.occasion = occasion;
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
				+ specialInstructions + ", dateAdded=" + dateAdded + ", occasionId="  + ", deliveryMethods="
				+ deliveryMethods + ", cakeInspiration=" + cakeInspiration + ", budget=" + budget + ", cakeType="
				+ cakeType + ", filling=" + "Occasion: " + occasion +  "]";
	}
}
