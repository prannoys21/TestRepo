package com.jwt.dao;

import com.jwt.model.Course;

public interface CourseDAO {

	public Course getCourse(int courseId);

	public void addCourse(Course course);
}
