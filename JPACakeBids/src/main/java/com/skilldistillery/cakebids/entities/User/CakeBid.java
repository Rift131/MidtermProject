package com.skilldistillery.cakebids.entities.User;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cake_bid")
public class CakeBid {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "bakery_id")
	private int bakeryId;
	
	@Column(name = "cake_id")
	private int cakeId;
	
	private double price;
	
	@Column(name = "bid_date")
	private LocalDateTime bidDate;
	
	@Column(name = "accepted_date")
	private LocalDateTime acceptedDate;
	
	@Column(name = "fulfilled_date")
	private LocalDateTime fulfilledDate;

	private String description;

	public CakeBid() {
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
		CakeBid other = (CakeBid) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBakeryId() {
		return bakeryId;
	}

	public void setBakeryId(int bakeryId) {
		this.bakeryId = bakeryId;
	}

	public int getCakeId() {
		return cakeId;
	}

	public void setCakeId(int cakeId) {
		this.cakeId = cakeId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public LocalDateTime getBidDate() {
		return bidDate;
	}

	public void setBidDate(LocalDateTime bidDate) {
		this.bidDate = bidDate;
	}

	public LocalDateTime getAcceptedDate() {
		return acceptedDate;
	}

	public void setAcceptedDate(LocalDateTime acceptedDate) {
		this.acceptedDate = acceptedDate;
	}

	public LocalDateTime getFulfilledDate() {
		return fulfilledDate;
	}

	public void setFulfilledDate(LocalDateTime fulfilledDate) {
		this.fulfilledDate = fulfilledDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "CakeBid [id=" + id + ", bakeryId=" + bakeryId + ", cakeId=" + cakeId + ", price=" + price + ", bidDate="
				+ bidDate + ", acceptedDate=" + acceptedDate + ", fulfilledDate=" + fulfilledDate + ", description="
				+ description + "]";
	}

}
