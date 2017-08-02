package com.app.service;

import java.util.List;

import com.app.pojo.Institute;

public interface InstituteService {

	public void create(Institute institute);
	public void update(Institute institute);
	public Institute edit(int id);
	public void delet(int id );
	public Institute find(int id);
	public Institute find(String name);
	public List<Institute> getall();

}
