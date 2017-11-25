package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author  Prannoy Chandra
 *
 */
@Entity
@Table(name = "CHAT")
public class Chat implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name= "CHAT_ID")
	private int id;

	@ManyToOne
	@JoinColumn(name = "SENDER")
	private Employee sender;
	
	@ManyToOne
	@JoinColumn(name = "RECIPIENT")
	private Employee recipient;

	@Column(name = "MESSAGE")
	private String message;

	@Column(name = "TIMESTAMP")
	private String timeStamp;
	
	@Column(name = "TOPIC_NAME")
	private String globalTopicName;
	
	@Column(name = "COURSE_NAME")
	private String globalCourseName;
	
	
	
	
	

	public String getGlobalCourseName() {
		return globalCourseName;
	}

	public void setGlobalCourseName(String globalCourseName) {
		this.globalCourseName = globalCourseName;
	}

	public String getGlobalTopicName() {
		return globalTopicName;
	}

	public void setGlobalTopicName(String globalTopicName) {
		this.globalTopicName = globalTopicName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Employee getSender() {
		return sender;
	}

	public void setSender(Employee sender) {
		this.sender = sender;
	}

	public Employee getRecipient() {
		return recipient;
	}

	public void setRecipient(Employee recipient) {
		this.recipient = recipient;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	
}