package com.jwt.service;

import com.jwt.model.Course;

public interface CourseService {

	public void addCourse(Course course);

	public Course getCourse(int courseId);
}	
