package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.ExamSubjectStudentCompositTableDAO;
import com.app.DAO.SubjectDivCompositDAO;
import com.app.pojo.ExamSubjectStudentCompositTable;
import com.app.pojo.SubjectDivComposit;
import com.app.service.ExamSubjectStudentCompositTableService;

@Service("examSubjectStudentCompositTableService")
public class ExamSubjectStudentCompositTableServiceImpl implements ExamSubjectStudentCompositTableService{

	@Autowired
	ExamSubjectStudentCompositTableDAO examSubStudCompDAO;
	
	@Override
	public void create(ExamSubjectStudentCompositTable examSubjectStudentComp) {
		examSubStudCompDAO.create(examSubjectStudentComp);
		
	}

	@Override
	public void update(ExamSubjectStudentCompositTable examSubjectStudentComp) {
		examSubStudCompDAO.update(examSubjectStudentComp);
		
	}

	@Override
	public ExamSubjectStudentCompositTable edit(int id) {
		return examSubStudCompDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		examSubStudCompDAO.delet(id);
	}

	@Override
	public ExamSubjectStudentCompositTable find(int id) {
		return examSubStudCompDAO.find(id);
	}

	@Override
	public List<ExamSubjectStudentCompositTable> getall() {
		return examSubStudCompDAO.getall();
	}

	@Override
	public List<SubjectDivComposit> findByExamId(int examId) {
		return examSubStudCompDAO.findByExamId(examId);
	}

}