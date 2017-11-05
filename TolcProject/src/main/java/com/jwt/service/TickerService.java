package com.jwt.service;

import java.util.List;

import com.jwt.model.Ticker;

public interface TickerService {

	public void addNotification(Ticker ticker);

	public List<Ticker> getAllNotifications();

	public List<Ticker> getCoursesCompleted(int empId,String courseName);


}	
