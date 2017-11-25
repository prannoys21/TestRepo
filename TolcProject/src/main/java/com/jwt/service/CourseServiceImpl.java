package com.jwt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CourseDAO;
import com.jwt.model.Course;

/**
 * @author  Prannoy Chandra
 *
 */
@Service
@Transactional
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDAO courseDAO;

	

	public Course getCourse(int courseId) {
		return courseDAO.getCourse(courseId);
	}



	@Override
	public void addCourse(Course course) {
		courseDAO.addCourse(course);
		
	}

	

}
