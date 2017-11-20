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
	public String processMessage(String actualMessage, int empId, boolean introPage,boolean topicPage) {
		String processedMessage = actualMessage;
		ArrayList<String> algorithms = new ArrayList<>();
		algorithms.add("algorithms"); //1
		algorithms.add("algorithms".toUpperCase()); //2
		algorithms.add("algo "); //3
		algorithms.add("algo ".toUpperCase()); //4
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
						processedMessage = actualMessage.replace(temp, "<a href=\"intro?id=999\">"+ temp +"</a>");
				} else if (i==5 || i==6){
						processedMessage = actualMessage.replace(temp, "<a href=\"greedyApproach?id=999\">"+ temp +"</a>");
				} else if (i==7 || i==8){
						processedMessage = actualMessage.replace(temp, "<a href=\"dynamicProgramming?id=999\">"+ temp +"</a>");
				} else if (i==9 || i==10){
						processedMessage = actualMessage.replace(temp, "<a href=\"divideAndConquer?id=999\">"+ temp +"</a>");
				} 
			}
		}
		
		ArrayList<String> databases = new ArrayList<>();
		databases.add("databases"); //1
		databases.add("databases".toUpperCase()); //2
		databases.add("database"); //3
		databases.add("database".toUpperCase()); //4
		databases.add("dbms"); //5
		databases.add("dbms".toUpperCase()); //6
		databases.add("architecture");//7
		databases.add("architecture".toUpperCase());//8
		databases.add("models");//9
		databases.add("models".toUpperCase());//10
		databases.add("schemas");//11
		databases.add("schemas".toUpperCase());//12
		int j=0;
		for (String temp : databases) {
			j+=1;
			if(actualMessage.contains(temp) || actualMessage.contains(temp.toUpperCase())) {
				if(j==1 || j==2 || j==3 || j==4 || j==5 || j==6) {
					processedMessage = actualMessage.replace(temp, "<a href=\"intro?id=999\">"+ temp +"</a>");
				} else if (j== 7 || j==8){
					processedMessage = actualMessage.replace(temp, "<a href=\"architecture?id=999\">"+ temp +"</a>");
				} else if (j==9 || j==10 ){
					processedMessage = actualMessage.replace(temp, "<a href=\"models?id=999\">"+ temp +"</a>");
				} else if (j==11 || j==12){
					processedMessage = actualMessage.replace(temp, "<a href=\"schemas?id=999\">"+ temp +"</a>");
				} 
			}
		}
		
		ArrayList<String> operatingSystems = new ArrayList<>();
		operatingSystems.add("operating systems"); //1
		operatingSystems.add("operating systems".toUpperCase()); //2
		operatingSystems.add(" os "); //3
		operatingSystems.add(" os ".toUpperCase()); //4
		operatingSystems.add("cache"); //5
		operatingSystems.add("cache".toUpperCase()); //6
		operatingSystems.add("memory management");//7
		operatingSystems.add("memory management".toUpperCase());//8
		operatingSystems.add("secondary storage");//9
		operatingSystems.add("secondary storage".toUpperCase());//10
		int k=0;
		for (String temp : operatingSystems) {
			k+=1;
			if(actualMessage.contains(temp) || actualMessage.contains(temp.toUpperCase())) {
				if(k==1 || k==2 || k==3 || k==4 ) {
					processedMessage = actualMessage.replace(temp, "<a href=\"intro?id=999\">"+ temp +"</a>");
				} else if (k==5 || k==6) {
					processedMessage = actualMessage.replace(temp, "<a href=\"cache?id=999\">"+ temp +"</a>");
				} else if (k==7 || k==8){
					processedMessage = actualMessage.replace(temp, "<a href=\"memoryManagement?id=999\">"+ temp +"</a>");
				} else if (k==9 || k==10){
					processedMessage = actualMessage.replace(temp, "<a href=\"secondaryStorage?id=999\">"+ temp +"</a>");
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

	@Override
	public List<Chat> getAllMessageRequests(int empId) {
		return chatDAO.getAllMessageRequests(empId);
	}


}
