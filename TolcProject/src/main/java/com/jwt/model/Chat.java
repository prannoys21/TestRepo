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

@Entity
@Table(name = "CHAT")
public class Chat implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name= "CHAT_ID")
	private int id;

	@ManyToOne
	@JoinColumn(name = "EMPLOYEE_ID")
	private Employee employee;

	@Column(name = "MESSAGE")
	private String message;

	@Column(name = "TIMESTAMP")
	private String timeStamp;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	/*public String getChatUsername() {
		return chatUsername;
	}

	public void setChatUsername(String chatUsername) {
		this.chatUsername = chatUsername;
	}
*/
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

	@Override
	public String toString(){
	  return  "{Name: "        + employee.getFirstName() + "," +  "Message: "         + message + "," +    "TimeStamp: " + timeStamp+ "}";
	}
}