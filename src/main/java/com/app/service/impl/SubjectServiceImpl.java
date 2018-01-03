package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.StudentDAO;
import com.app.DAO.SubjectDAO;
import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;
import com.app.service.StudentService;
import com.app.service.SubjectService;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	SubjectDAO subjectDAO;
	
	@Override
	public void create(Subject subject) {
		subjectDAO.create(subject);
	}

	@Override
	public void update(Subject subject) {
		subjectDAO.update(subject);
		
	}

	@Override
	public Subject edit(int id) {
	 return subjectDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		subjectDAO.delet(id);
		
	}

	@Override
	public Subject find(int id) {
		return subjectDAO.find(id);
	}

	@Override
	public List<Subject> getall() {
		return subjectDAO.getall();
	}
	
	@Override
	public List<Subject> getallOfInstitute(int instituteId) {
		return subjectDAO.getallOfInstitute(instituteId);
	}


}
