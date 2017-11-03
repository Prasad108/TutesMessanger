package com.app.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.app.pojo.Student;


public interface StudentDAO {
	
	public void create(Student student);
	public void update(Student student);
	public Student edit(int id);
	public void delet(int id );
	public Student find(int id);
	public List<Student> getall();

}
