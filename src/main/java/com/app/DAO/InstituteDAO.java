package com.app.DAO;

import java.util.List;

import com.app.pojo.Institute;

public interface InstituteDAO {
	
	public void create(Institute institute);
	public void update(Institute institute);
	public Institute edit(int id);
	public void delet(int id );
	public Institute find(int id);
	public List<Institute> getall();

}
