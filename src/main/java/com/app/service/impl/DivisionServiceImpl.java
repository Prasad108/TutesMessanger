package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.ClassesDAO;
import com.app.DAO.DivisionDAO;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.service.DivisionService;

@Service("divisionService")
public class DivisionServiceImpl implements DivisionService {

	@Autowired
	DivisionDAO divisionDAO;
	
	@Override
	public void create(Division div) {
		divisionDAO.create(div);

	}

	@Override
	public void update(Division classes) {
		divisionDAO.update(classes);

	}

	@Override
	public Division edit(int id) {
		
		return divisionDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		divisionDAO.delet(id);
	}

	@Override
	public Division find(int id) {
		
		return divisionDAO.find(id);
	}

	@Override
	public List<Division> getall() {
		
		return divisionDAO.getall();
	}

	@Override
	public List<Division> getallOfParticularClass(Classes classes) {
		
		return divisionDAO.getallOfParticularClass(classes);
	}

}
