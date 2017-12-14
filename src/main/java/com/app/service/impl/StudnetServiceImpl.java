package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.BranchDAO;
import com.app.DAO.StudentDAO;
import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.service.StudentService;

@Service("studentService")
public class StudnetServiceImpl implements StudentService{
	
	@Autowired
	StudentDAO StudetentDAO;

	@Override
	public void create(Student student) {
		StudetentDAO.create(student);
		
	}

	@Override
	public void update(Student student) {
		StudetentDAO.update(student);
		
	}

	@Override
	public Student edit(int id) {
		return StudetentDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		StudetentDAO.delet(id);
		
	}

	@Override
	public Student find(int id) {
		return StudetentDAO.find(id);
	}

	@Override
	public List<Student> getall() {
		return StudetentDAO.getall();
	}

	@Override
	public Student findByLoginId(int id) {
		
		return StudetentDAO.findByLoginId(id);
	}
	
	@Override
	public List<Student> findByDivId(int id) {
		
		return StudetentDAO.findByDivId(id);
	}

	@Override
	public Institute GetInstitute(int id) {
		
		return StudetentDAO.GetInstitute(id);
	}

	@Override
	public void deleteSelectedFromDiv(int id) {
	  
		StudetentDAO.deleteSelectedFromDiv(id);
		}

	@Override
	public void SetDivisionId(int StudentId, int DiviID) {
		StudetentDAO.SetDivisionId(StudentId, DiviID);
		
	}

}
