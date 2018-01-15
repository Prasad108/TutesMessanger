package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.app.DAO.ExamDAO;
import com.app.pojo.Exam;
import com.app.service.ExamService;

@Service("examService")
public class ExamServiceImpl implements ExamService {

	@Autowired
	ExamDAO examDAO;
	
	@Override
	public void create(Exam exam) {
		examDAO.create(exam);

	}

	@Override
	public void update(Exam exam) {
		examDAO.update(exam);

	}

	@Override
	public Exam edit(int id) {
		return examDAO.edit(id);
	}

	@Override
	public void delet(Exam exam) {
		examDAO.delet(exam);

	}

	@Override
	public Exam find(int id) {
		return examDAO.find(id);
	}

	@Override
	public List<Exam> getallOfParticularInstitute(int instituteId) {
		return examDAO.getallOfParticularInstitute(instituteId);

	}

}
