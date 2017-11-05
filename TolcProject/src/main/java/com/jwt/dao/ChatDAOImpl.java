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
		String sqlQuery = "SELECT * FROM CHAT;";
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Chat.class);
		@SuppressWarnings("unchecked")
		List<Integer> result = query.list();
		Integer messageCount= result.size();
		return messageCount;
	}


}