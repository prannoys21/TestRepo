package com.jwt.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.ChatDAO;
import com.jwt.model.Chat;

@Service
@Transactional
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;

	@Override
	@Transactional
	public void addMessage(Chat chat) {
		chatDAO.addMessage(chat);
	}

	@Override
	@Transactional
	public List<Chat> getAllMessages() {
		return chatDAO.getAllMessages();
	}

	@Override
	public String processMessage(String actualMessage, int empId) {
		String processedMessage = actualMessage;
		ArrayList<String> algorithms = new ArrayList<>();
		algorithms.add("algorithms"); //1
		algorithms.add("algorithms".toUpperCase()); //2
		algorithms.add("algo"); //3
		algorithms.add("algo".toUpperCase()); //4
		algorithms.add("greedy approach"); //5
		algorithms.add("greedy approach".toUpperCase()); //6
		algorithms.add("dynamic programming");//7
		algorithms.add("dynamic programming".toUpperCase());//8
		algorithms.add("divide and conquer");//9
		algorithms.add("divide and conquer".toUpperCase());//10
		int i=0;
		for (String temp : algorithms) {
			i+=1;
			if(actualMessage.contains(temp) || actualMessage.contains(temp.toUpperCase())) {
				if(i==1 || i==2 || i==3 || i==4) {
					processedMessage = actualMessage.replace(temp, "<a href=\"algorithms?id=999\">"+ temp +"</a>");
				} else if (i==5 || i==6){
					processedMessage = actualMessage.replace(temp, "<a href=\"algorithms/greedyApproach?id=999\">"+ temp +"</a>");
				} else if (i==7 || i==8){
					processedMessage = actualMessage.replace(temp, "<a href=\"algorithms/dynamicProgramming?id=999\">"+ temp +"</a>");
				} else if (i==9 || i==10){
					processedMessage = actualMessage.replace(temp, "<a href=\"algorithms/divideAndConquer?id=999\">"+ temp +"</a>");
				} 
			}
		}
		
		ArrayList<String> databases = new ArrayList<>();
		databases.add("databases"); //1
		databases.add("databases".toUpperCase()); //1
		databases.add("database"); //2
		databases.add("dbms"); //3
		databases.add("architecture");//4
		databases.add("models");//5
		databases.add("schemas");//6
		int j=0;
		for (String temp : databases) {
			j+=1;
			if(actualMessage.contains(temp) || actualMessage.contains(temp.toUpperCase())) {
				if(j==1 || j==2 || j==3) {
					processedMessage = actualMessage.replace(temp, "<a href=\"databases?id=999\">"+ temp +"</a>");
				} else if (j==4){
					processedMessage = actualMessage.replace(temp, "<a href=\"databases/architecture?id=999\">"+ temp +"</a>");
				} else if (j==5){
					processedMessage = actualMessage.replace(temp, "<a href=\"databases/models?id=999\">"+ temp +"</a>");
				} else if (j==6){
					processedMessage = actualMessage.replace(temp, "<a href=\"databases/schemas?id=999\">"+ temp +"</a>");
				} 
			}
		}
		
		ArrayList<String> operatingSystems = new ArrayList<>();
		operatingSystems.add("operating systems"); //1
		operatingSystems.add(" os "); //2
		operatingSystems.add("cache"); //3
		operatingSystems.add("memory management");//4
		operatingSystems.add("secondary storage");//5
		int k=0;
		for (String temp : operatingSystems) {
			k+=1;
			if(actualMessage.contains(temp) || actualMessage.contains(temp.toUpperCase())) {
				if(k==1 || k==2) {
					processedMessage = actualMessage.replace(temp, "<a href=\"operatingSystems?id=999\">"+ temp +"</a>");
				} else if (k==3){
					processedMessage = actualMessage.replace(temp, "<a href=\"operatingSystems/cache?id=999\">"+ temp +"</a>");
				} else if (k==4){
					processedMessage = actualMessage.replace(temp, "<a href=\"operatingSystems/memoryManagement?id=999\">"+ temp +"</a>");
				} else if (k==5){
					processedMessage = actualMessage.replace(temp, "<a href=\"operatingSystems/secondaryStorage?id=999\">"+ temp +"</a>");
				} 
			}
		}
		
		return processedMessage;
	}

	@Override
	public Integer getMessageCount() {
		return chatDAO.getMessageCount();
	}

	@Override
	public List<Chat> getAllInCourseMessages(int senderId, int recipientId) {
		return chatDAO.getAllInCourseMessages(senderId, recipientId);
	}
	
	public List<Chat> getSentMessageCount(int empId) {
		return chatDAO.getSentMessageCount(empId);
	}

	@Override
	public List<Chat> getReceivedMessageCount(int empId) {
		return chatDAO.getReceivedMessageCount(empId);
	}

	@Override
	public int getListOfUsersHelped(int empId) {
		return chatDAO.getListOfUsersHelped(empId);
	}

	

	@Override
	public Map<String,Integer>   getTopicWiseHelpingCount(int empId,String courseName) {
		return chatDAO.getTopicWiseHelpingCount(empId,courseName);
	}


}
