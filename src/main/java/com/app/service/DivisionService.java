package com.app.service;

import java.util.List;

import com.app.pojo.Division;

public interface DivisionService {

public void create(Division div);
	
	public void update(Division classes);
	public Division edit(int id);
	public void delet(int id );
	public Division find(int id);
	public List<Division> getall();
}
