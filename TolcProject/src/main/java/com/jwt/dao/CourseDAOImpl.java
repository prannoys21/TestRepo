package com.jwt.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Course;

@Repository
public class CourseDAOImpl implements CourseDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Course getCourse(int courseId) {
		return (Course) sessionFactory.getCurrentSession().get(Course.class, courseId);
	}

	@Override
	public void addCourse(Course course) {
		sessionFactory.getCurrentSession().saveOrUpdate(course);
	}

}