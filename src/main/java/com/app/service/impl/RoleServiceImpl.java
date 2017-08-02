package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.RoleDAO;
import com.app.pojo.Role;
import com.app.service.RoleService;


@Service("RoleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleDAO RoleDAO;
	
	@Override
	public void create(Role role) {
		RoleDAO.create(role);

	}

	@Override
	public void update(Role role) {
		RoleDAO.update(role);

	}

	@Override
	public Role edit(int id) {
		
		return RoleDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		RoleDAO.delet(id);
	}

	@Override
	public Role find(int id) {
		
		return RoleDAO.find(id);
	}

	@Override
	public List<Role> getall() {
		
		return RoleDAO.getall();
	}

	@Override
	public Role findByName(String name) {
		
		return RoleDAO.findByName(name);
	}

}
