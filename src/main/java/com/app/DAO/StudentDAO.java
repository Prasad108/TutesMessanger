package com.app.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Teacher;


public interface StudentDAO {
	
	public void create(Student student);
	public void update(Student student);
	public Student edit(int id);
	public void delet(int id );
	public Student find(int id);
	public List<Student> getall();
	public Student findByLoginId(int id);
	public List<Student> findByDivId(int id);
	public Institute GetInstitute(int id);
	public void SetDivisionId(int StudentId,int DiviID);

}
