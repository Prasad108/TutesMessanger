package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.InstituteDAO;
import com.app.pojo.Institute;
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

}
