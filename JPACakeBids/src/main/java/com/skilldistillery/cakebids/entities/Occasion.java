package com.skilldistillery.cakebids.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Occasion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private LocalDateTime date;

	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	private String description;

	@ManyToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	@OneToMany(mappedBy="occasion")
	private List<Cake> cakes;
	
	public Occasion() {
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

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Cake> getCakes() {
		return cakes;
	}

	public void setCakes(List<Cake> cakes) {
		this.cakes = cakes;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		Occasion other = (Occasion) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Occasion [id=" + id + ", name=" + name + ", date=" + date + ", userId=" + ", description="
				+ description + ", addressId=" + "]";
	}
	
	
}
