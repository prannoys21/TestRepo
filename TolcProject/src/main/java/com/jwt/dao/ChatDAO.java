package com.jwt.dao;

import java.util.List;
import java.util.Map;

import com.jwt.model.Chat;

/**
 * @author  Prannoy Chandra
 *
 */
public interface ChatDAO {

	public void addMessage(Chat chat);

	public List<Chat> getAllMessages();

	public Integer getMessageCount();

	public List<Chat> getAllInCourseMessages(int senderId, int recipientId);
	
	public List<Chat> getSentMessageCount(int empId);

	public List<Chat> getReceivedMessageCount(int empId);

	public int getListOfUsersHelped(int empId);

	public Map<String,Integer> getTopicWiseHelpingCount(int empId,String courseName);

	public List<Chat> getAllMessageRequests(int empId);



}
