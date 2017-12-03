package com.jwt.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author  Prannoy Chandra
 *
 */
@Entity
@Table(name = "COURSE")
public class Course implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name= "COURSE_ID")
	private int id;

	@Column(name="COURSE_NAME")
	private String courseName;
	
	@Column(name="TOPIC_NAME")
	private String topicName;
	
	@Column(name="TOPIC_LEVEL")
	private String topicLevel;
	
	@Column(name="TOPIC_URL")
	private String topicUrl;

	@Column(name="TOPIC_MENTION_COUNT")
	private int topicCountChat;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getTopicLevel() {
		return topicLevel;
	}

	public void setTopicLevel(String topicLevel) {
		this.topicLevel = topicLevel;
	}

	public String getTopicUrl() {
		return topicUrl;
	}

	public void setTopicUrl(String topicUrl) {
		this.topicUrl = topicUrl;
	}

	public int getTopicCountChat() {
		return topicCountChat;
	}

	public void setTopicCountChat(int topicCountChat) {
		this.topicCountChat = topicCountChat;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	};
	
	
}