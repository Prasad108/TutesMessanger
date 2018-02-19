package com.app.service;

import java.util.List;

import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Student;

public interface StudentService {
	public void create(Student student);
	public void update(Student student);
	public void deleteSelectedFromDiv(int id);
	public Student edit(int id);
	public void delet(int id );
	public Student find(int id);
	public List<Student> getall();
	public Student findByLoginId(int id);
	
	public void changePassword(String newPassword , Login login);
	public Boolean checkPassword(String oldPassword, Integer id);
	public void changeUserName(String newUserName, Login login);
	
	public List<Student> findByDivId(int id);
	public Institute GetInstitute(int id);
	public void SetDivisionId(int StudentId,int DiviID);

}
