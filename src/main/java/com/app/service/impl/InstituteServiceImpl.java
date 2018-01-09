package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.InstituteDAO;
import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Teacher;
import com.app.service.InstituteService;


@Service("instituteService")
public class InstituteServiceImpl implements InstituteService {

	@Autowired
	InstituteDAO InstituteDAO;
	
	@Override
	public void create(Institute institute) {
		InstituteDAO.create(institute);

	}

	@Override
	public void update(Institute institute) {
		InstituteDAO.update(institute);

	}

	@Override
	public Institute edit(int id) {
		
		return InstituteDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		InstituteDAO.delet(id);

	}

	@Override
	public Institute find(int id) {
	
		return InstituteDAO.find(id);
	}

	@Override
	public List<Institute> getall() {
		
		return InstituteDAO.getall();
	}

	@Override
	public Institute find(String name) {
		
		return InstituteDAO.find(name);
	}

	@Override
	public List<Teacher> getallPendingTeacherForApproval(Institute institute) {
		// TODO Auto-generated method stub
		return InstituteDAO.getallPendingTeacherForApproval(institute);
	}

	@Override
	public List<Student> getallPendingStudentForApproval(Institute institute) {
		// TODO Auto-generated method stub
		return InstituteDAO.getallPendingStudentForApproval(institute);
	}

	@Override
	public List<Student> getallStudentWhoAreNotInAnyDivision(Institute institute) {
		// TODO Auto-generated method stub
		return InstituteDAO.getallStudentWhoAreNotInAnyDivision(institute);
	}

	@Override
	public String GetSubjectTree(int InstId) {
		
		return InstituteDAO.GetSubjectTree(InstId);
	}

}
