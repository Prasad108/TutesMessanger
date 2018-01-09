package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.ExamTypeDAO;
import com.app.pojo.ExamType;
import com.app.service.ExamTypeService;

@Service("examTypeService")
public class ExamTypeServiceImpl implements ExamTypeService {

	@Autowired
	ExamTypeDAO examTypeDAO;
	
	@Override
	public List<ExamType> getAll() {
		
		return examTypeDAO.getAll();
	}

}
