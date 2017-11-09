package com.jwt.dao;

import java.util.List;

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


}