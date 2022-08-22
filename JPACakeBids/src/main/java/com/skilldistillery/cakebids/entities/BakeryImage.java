package com.skilldistillery.cakebids.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bakery_image")
public class BakeryImage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "description")
	private String imgDescription;

	@ManyToOne
	@JoinColumn(name = "bakery_id")
	private Bakery bakery;

	public BakeryImage() {
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
		BakeryImage other = (BakeryImage) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getImgDescription() {
		return imgDescription;
	}

	public void setImgDescription(String imgDescription) {
		this.imgDescription = imgDescription;
	}


	public Bakery getBakery() {
		return bakery;
	}

	public void setBakery(Bakery bakery) {
		this.bakery = bakery;
	}

	@Override
	public String toString() {
		return "BakeryImage [id=" + id + ", imageUrl=" + imageUrl + ", imgDescription=" + imgDescription + ", bakery="
				+ bakery + "]";
	}

}
