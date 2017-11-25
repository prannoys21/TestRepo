package com.jwt.service;

import com.jwt.model.Course;

/**
 * @author  Prannoy Chandra
 *
 */
public interface CourseService {

	public void addCourse(Course course);

	public Course getCourse(int courseId);
}	
