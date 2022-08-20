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
@Table(name="bakery_review")
public class BakeryReview {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int rating;
	
	@Column(name= "review_date")
	private LocalDateTime reviewDate;
	@Column(name= "review_title")
	private String reviewTitle;
	
	private String review;
	@Column(name= "user_id")
	private int userId;
	@Column(name= "bakery_id")
	private int bakeryId;
	public BakeryReview() {
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
		BakeryReview other = (BakeryReview) obj;
		return id == other.id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public LocalDateTime getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(LocalDateTime reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBakeryId() {
		return bakeryId;
	}
	public void setBakeryId(int bakeryId) {
		this.bakeryId = bakeryId;
	}
	@Override
	public String toString() {
		return "BakeryReview [id=" + id + ", rating=" + rating + ", reviewDate=" + reviewDate + ", reviewTitle="
				+ reviewTitle + ", review=" + review + ", userId=" + userId + ", bakeryId=" + bakeryId + "]";
	}
}
