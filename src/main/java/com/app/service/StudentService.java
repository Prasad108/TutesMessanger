package com.app.service;

import java.util.List;

import com.app.pojo.Student;

public interface StudentService {
	public void create(Student student);
	public void update(Student student);
	public Student edit(int id);
	public void delet(int id );
	public Student find(int id);
	public List<Student> getall();

}
