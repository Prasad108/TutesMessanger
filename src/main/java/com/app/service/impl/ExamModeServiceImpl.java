package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.app.DAO.ExamModeDAO;
import com.app.pojo.ExamMode;
import com.app.service.ExamModeService;

@Service("examModeService")
public class ExamModeServiceImpl implements ExamModeService {

	@Autowired
	ExamModeDAO examModeDAO;
	
	@Override
	public List<ExamMode> getAll() {
		
		return examModeDAO.getAll();
	}

}
