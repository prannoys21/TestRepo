package com.jwt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Ticker;

@Repository
public class TickerDAOImpl implements TickerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addNotification(Ticker ticker) {
		sessionFactory.getCurrentSession().saveOrUpdate(ticker);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticker> getAllNotifications() {
		return sessionFactory.getCurrentSession().createQuery("from Ticker")
				.list();
	}

	@Override
	public List<Ticker> getCoursesCompleted(int empId,String courseName) {
		String sqlQuery = "SELECT * FROM TICKER WHERE EMPLOYEE_ID=" + empId + " AND COURSE_NAME='"+courseName+"' ORDER BY COURSE_LEVEL DESC";
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Ticker.class);
		@SuppressWarnings("unchecked")
		List<Ticker> result = query.list();
		return result;
	}

	@Override
	public List<Ticker> getAlgoTopicsCompleted(int empId) {
		String sqlQuery = "SELECT * FROM TICKER WHERE EMPLOYEE_ID=" + empId + " AND COURSE_NAME= 'Algorithms' ORDER BY COURSE_LEVEL DESC";
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Ticker.class);
		@SuppressWarnings("unchecked")
		List<Ticker> result = query.list();
		return result;
	}

	@Override
	public List<Ticker> getDbmsTopicsCompleted(int empId) {
		String sqlQuery = "SELECT * FROM TICKER WHERE EMPLOYEE_ID=" + empId + " AND COURSE_NAME= 'Databases' ORDER BY COURSE_LEVEL DESC";
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Ticker.class);
		@SuppressWarnings("unchecked")
		List<Ticker> result = query.list();
		return result;
	}

	@Override
	public List<Ticker> getOsTopicsCompleted(int empId) {
		String sqlQuery = "SELECT * FROM TICKER WHERE EMPLOYEE_ID=" + empId + " AND COURSE_NAME= 'Operating Systems' ORDER BY COURSE_LEVEL DESC";
		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sqlQuery).addEntity(Ticker.class);
		@SuppressWarnings("unchecked")
		List<Ticker> result = query.list();
		return result;
	}

	

}