package com.app.DAO;

import java.util.List;

import com.app.pojo.Parent;


public interface ParentDAO {
	
	public void create(Parent parent);
	public void update(Parent parent);
	public Parent edit(int id);
	public void delet(Parent parent );
	public Parent find(int id);
	public List<Parent> getall();


}
