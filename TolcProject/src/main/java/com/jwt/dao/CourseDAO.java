package com.jwt.dao;

import com.jwt.model.Course;

/**
 * @author  Prannoy Chandra
 *
 */
public interface CourseDAO {

	public Course getCourse(int courseId);

	public void addCourse(Course course);
}
