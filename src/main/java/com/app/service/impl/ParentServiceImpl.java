package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.BranchDAO;
import com.app.DAO.ParentDAO;
import com.app.pojo.Parent;
import com.app.service.ParentService;


@Service("parentService")
public class ParentServiceImpl implements ParentService {

	@Autowired
	ParentDAO parentDAO;
	
	
	@Override
	public void create(Parent parent) {
		parentDAO.create(parent);

	}

	@Override
	public void update(Parent parent) {
		parentDAO.update(parent);

	}

	@Override
	public Parent edit(int id) {
		
		return parentDAO.edit(id);
	}

	@Override
	public void delet(Parent parent) {
		parentDAO.delet(parent);
	}

	@Override
	public Parent find(int id) {
		
		return parentDAO.find(id);
	}

	@Override
	public List<Parent> getall() {
		
		return parentDAO.getall();
				
	}

}
