package com.app.service;

import java.util.List;

import com.app.pojo.Role;

public interface RoleService {


	public void create(Role role);
	public void update(Role role);
	public Role edit(int id);
	public void delet(int id );
	public Role find(int id);
	public Role findByName(String name);
	public List<Role> getall();
}
