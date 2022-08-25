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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private boolean enabled;
	
	private String role;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
//	@Column(name = "address_id")
//	private int addressId;
	
	@Column(name = "profile_picture")
	private String profilePic;
	
	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "about_me")
	private String aboutMe;
	
	@OneToMany(mappedBy="user") // name of the field inside of the child class
	private List<CakeReview> cakeReview;

	@OneToMany(mappedBy="user") // name of the field inside of the child class
	private List<BakeryReview> BakeryReviews;
	
	@OneToOne
	@JoinColumn(name="address_id") //database fix required for foreign key 
	private Address address;

	@OneToOne(mappedBy="owner")
	private Bakery bakery;
	
	@OneToMany(mappedBy="user")
	private List<Occasion> occasions;
	
	
	public Bakery getBakery() {
		return bakery;
	}

	public void setBakery(Bakery bakery) {
		this.bakery = bakery;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public List<CakeReview> getCakeReview() {
		return cakeReview;
	}

	public void setCakeReview(List<CakeReview> cakeReview) {
		this.cakeReview = cakeReview;
	}

	public List<BakeryReview> getBakeryReviews() {
		return BakeryReviews;
	}

	public void setBakeryReviews(List<BakeryReview> bakeryReviews) {
		BakeryReviews = bakeryReviews;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", addressId=" + ", profilePic=" + profilePic + ", createDate=" + createDate + ", aboutMe=" + aboutMe + "]";
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
		User other = (User) obj;
		return id == other.id;
	}

	public List<Occasion> getOccasions() {
		return occasions;
	}

	public void setOccasions(List<Occasion> occasions) {
		this.occasions = occasions;
	}
	
	
	
}
