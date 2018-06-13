package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.ResultDAO;
import com.app.service.ResultService;

@Service("smsSubjectStudentResult")
public class ResultServiceImpl implements ResultService{

	@Autowired
	ResultDAO resultDAO;
	
	@Override
	public String smsSubjectStudentResult(int ExamId, int SubdivId) {
		// TODO Auto-generated method stub
		return resultDAO.smsSubjectStudentResult(ExamId, SubdivId);
	}

}
