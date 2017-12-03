package com.jwt.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author  Prannoy Chandra
 *
 */
@Entity
@Table(name = "EMPLOYEE")
public class Employee implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name= "ID")
	private int id;

	@Column(name="FIRSTNAME")
	private String firstName;
	
	@Column(name="SURNAME")
	private String surName;

	@Column(name="EMAIL")
	private String email;

	@Column(name="MOBILE_NUMBER")
	private String mobileNumber;
	
	@Column(name="USERNAME")
	private String userName;

	@Column(name="PASSWORD")
	private String password;
	
	@Column(name="CONTRIBUTION_POS")
	private int contributionPos;
	
	@Column(name="CONTRIBUTION_NEG")
	private int contributionNeg;

	

	public int getContributionPos() {
		return contributionPos;
	}

	public void setContributionPos(int contributionPos) {
		this.contributionPos = contributionPos;
	}

	public int getContributionNeg() {
		return contributionNeg;
	}

	public void setContributionNeg(int contributionNeg) {
		this.contributionNeg = contributionNeg;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}