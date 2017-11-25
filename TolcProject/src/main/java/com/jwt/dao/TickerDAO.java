package com.jwt.dao;

import java.util.List;

import com.jwt.model.Ticker;

/**
 * @author  Prannoy Chandra
 *
 */
public interface TickerDAO {

	public void addNotification(Ticker ticker);

	public List<Ticker> getAllNotifications();

	public List<Ticker> getCoursesCompleted(int empId,String courseName);

	public List<Ticker> getAlgoTopicsCompleted(int empId);

	public List<Ticker> getDbmsTopicsCompleted(int empId);

	public List<Ticker> getOsTopicsCompleted(int empId);

	



}
