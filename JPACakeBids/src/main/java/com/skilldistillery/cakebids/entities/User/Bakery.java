package com.skilldistillery.cakebids.entities.User;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
@Entity
public class Bakery {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	@Column (name = "image_url")
	private String imageUrl;
	@Column (name = "website_url")
	private String websiteUrl;
	@Column (name = "hours_operation")
	private String hoursOfOperation;
	@Column (name = "address_id")
	private int addressId;
	@Column (name = "user_id")
	private int userId;

	@OneToOne
	@JoinColumn(name="owner_id")
	private User owner;

	@OneToMany(mappedBy="bakery")
	private List<BakeryReview> reviews;

	@OneToMany(mappedBy="bakery")
	private List<BakeryImage> bakeryImages;

	@OneToMany(mappedBy="bakery")
	private List<CakeBid> cakeBids;

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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public String getHoursOfOperation() {
		return hoursOfOperation;
	}

	public void setHoursOfOperation(String hoursOfOperation) {
		this.hoursOfOperation = hoursOfOperation;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public List<BakeryReview> getReviews() {
		return reviews;
	}

	public void setReviews(List<BakeryReview> reviews) {
		this.reviews = reviews;
	}

	public List<BakeryImage> getBakeryImages() {
		return bakeryImages;
	}

	public void setBakeryImages(List<BakeryImage> bakeryImages) {
		this.bakeryImages = bakeryImages;
	}

	public List<CakeBid> getCakeBids() {
		return cakeBids;
	}

	public void setCakeBids(List<CakeBid> cakeBids) {
		this.cakeBids = cakeBids;
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
		Bakery other = (Bakery) obj;
		return id == other.id;
	}

	public Bakery() {
		super();
	}

	@Override
	public String toString() {
		return "Bakery [id=" + id + ", name=" + name + ", description=" + description + "]";
	}






}