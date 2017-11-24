package com.jwt.dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Chat;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addMessage(Chat chat) {
		sessionFactory.getCurrentSession().saveOrUpdate(chat);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Chat> getAllMessages() {
		return sessionFactory.getCurrentSession().createQuery("from Chat")
				.list();
	}

	@Override
	public Integer getMessageCount() {
		Integer messageCount=0;
		String sqlQuery = "SELECT * FROM CHAT;";
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Chat.class);
		@SuppressWarnings("unchecked")
		List<Integer> result = query.list();
		if(!result.isEmpty()) {
		messageCount= result.size();
		}
		return messageCount;
	}

	@Override
	public List<Chat> getAllInCourseMessages(int senderId, int recipientId) {
		//SELECT * FROM `chat` WHERE SENDER = 1 AND RECIPIENT =5 	UNION		SELECT * FROM `chat`WHERE SENDER = 5 AND RECIPIENT =1 ORDER BY TIMESTAMP ASC;
		String sqlQuery = "SELECT * FROM CHAT WHERE SENDER = " + senderId + " AND RECIPIENT = "+ recipientId + " UNION	SELECT * FROM CHAT  WHERE SENDER = "+recipientId+ " AND RECIPIENT = "+ senderId+" ORDER BY TIMESTAMP ASC" ;
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Chat.class);
		@SuppressWarnings("unchecked")
		List<Chat> result = query.list();
		if(result.isEmpty()) {
			result = null;
		}
		return result;
	}

	@Override
	public List<Chat> getSentMessageCount(int empId) {
		String sqlQuery = "SELECT * FROM `chat` WHERE SENDER = " + empId; 
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Chat.class);
		@SuppressWarnings("unchecked")
		List<Chat> result = query.list();
		return result;
	}

	@Override
	public List<Chat> getReceivedMessageCount(int empId) {
		String sqlQuery = "SELECT * FROM `chat` WHERE RECIPIENT = " + empId; 
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Chat.class);
		@SuppressWarnings("unchecked")
		List<Chat> result = query.list();
		return result;
	}

	@Override
	public int getListOfUsersHelped(int empId) {
		String sqlQuery = "SELECT COUNT(DISTINCT (SENDER)) FROM CHAT WHERE RECIPIENT = " + empId; 
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery);
		@SuppressWarnings("unchecked")
		List<BigInteger> result = query.list();
		int finalVal = 0;
		if(!result.isEmpty()) {
			finalVal = result.get(0).intValue();
		}
		return finalVal;
	}


	@Override
	public Map<String,Integer>  getTopicWiseHelpingCount(int empId, String courseName) {
		String sqlQuery = "SELECT COUNT(DISTINCT (SENDER)) AS HELPING_COUNT, TOPIC_NAME FROM CHAT WHERE RECIPIENT = "+empId +" AND COURSE_NAME = '"+ courseName +"' GROUP BY TOPIC_NAME;"; 
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery);
		@SuppressWarnings({ "unchecked"})
		List <Object[]> result=  query.list();
		Map<String,Integer> finalMap = new HashMap<String,Integer>();
		Map<String,Integer> resultSetObtainedAlgo = new HashMap<String,Integer>();
		Map<String,Integer> resultSetObtainedDb = new HashMap<String,Integer>();
		Map<String,Integer> resultSetObtainedOs = new HashMap<String,Integer>();
	/*	resultSetObtainedAlgo.put("Introduction to Algorithms", 0);
		resultSetObtainedAlgo.put("Greedy Approach", 0);
		resultSetObtainedAlgo.put("Divide And Conquer", 0);
		resultSetObtainedAlgo.put("Dynamic Programming", 0);
		
		
		Map<String,Integer> resultSetObtainedDb = new HashMap<String,Integer>();
		resultSetObtainedDb.put("Introduction to Databases", 0);
		resultSetObtainedDb.put("Architecture", 0);
		resultSetObtainedDb.put("Models", 0);
		resultSetObtainedDb.put("Schemas", 0);
		
		Map<String,Integer> resultSetObtainedOs = new HashMap<String,Integer>();
		resultSetObtainedOs.put("Introduction to Operating Systems", 0);
		resultSetObtainedOs.put("Secondary Storage", 0);
		resultSetObtainedOs.put("Memory Management", 0);
		resultSetObtainedOs.put("Cache", 0);
		
		*/
		if(!result.isEmpty()) {
			for (Object[] sss : result) {
				if(courseName.equals("Algorithms")) {
					resultSetObtainedAlgo.put((String) sss[1],(Integer)((BigInteger) sss[0]).intValue() );
					finalMap = resultSetObtainedAlgo;
				} else if (courseName.equals("Databases")) {
					resultSetObtainedDb.put((String) sss[1],(Integer)((BigInteger) sss[0]).intValue() );
					finalMap = resultSetObtainedDb;
				} else if (courseName.equals("Operating Systems")) {
					resultSetObtainedOs.put((String) sss[1],(Integer)((BigInteger) sss[0]).intValue() );
					finalMap = resultSetObtainedOs;
				}
			}
		} 
		return finalMap;
	}

	@Override
	public List<Chat> getAllMessageRequests(int empId) {
		String sqlQuery = "SELECT * FROM CHAT WHERE RECIPIENT = "+ empId +" ORDER BY TIMESTAMP DESC ;"; 
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Chat.class);
		@SuppressWarnings("unchecked")
		List<Chat> result = query.list();
		return result;
	}

	

}