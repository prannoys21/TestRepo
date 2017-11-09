package com.jwt.service;

import java.util.List;

import com.jwt.model.Chat;

public interface ChatService {

	public void addMessage(Chat chat);

	public List<Chat> getAllMessages();

	public String processMessage(String actualMessage, int empId);

	public Integer getMessageCount();

	public List<Chat> getAllInCourseMessages(int senderId, int recipientId);

}	
