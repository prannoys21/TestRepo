package com.jwt.dao;

import java.util.List;

import com.jwt.model.Chat;

public interface ChatDAO {

	public void addMessage(Chat chat);

	public List<Chat> getAllMessages();

	public Integer getMessageCount();


}
