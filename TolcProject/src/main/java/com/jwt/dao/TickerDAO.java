package com.jwt.dao;

import java.util.List;

import com.jwt.model.Chat;
import com.jwt.model.Ticker;

public interface TickerDAO {

	public void addNotification(Ticker ticker);

	public List<Ticker> getAllNotifications();

	public List<Ticker> getCoursesCompleted(int empId,String courseName);



}
