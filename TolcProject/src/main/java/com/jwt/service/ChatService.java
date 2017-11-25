package com.jwt.service;

import java.util.List;
import java.util.Map;

import com.jwt.model.Chat;

/**
 * @author  Prannoy Chandra
 *
 */
public interface ChatService {

	public void addMessage(Chat chat);

	public List<Chat> getAllMessages();

	public String processMessage(String actualMessage, int empId, boolean introPage, boolean topicPage);

	public Integer getMessageCount();

	public List<Chat> getAllInCourseMessages(int senderId, int recipientId);
	
	public List<Chat> getSentMessageCount(int empId);

	public List<Chat> getReceivedMessageCount(int empId);

	public int getListOfUsersHelped(int empId);

	public Map<String,Integer> getTopicWiseHelpingCount(int empId, String courseName);

	public List<Chat> getAllMessageRequests(int empId);



}	
