package com.app.DAO;

import java.util.List;

import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Institute;

public interface ClassesDAO {
	
	public void create(Classes classes);
	public void update(Classes classes);
	public Classes edit(int id);
	public void delet(int id );
	public Classes find(int id);
	public List<Classes> getall();
	public List<Classes> getallOfParticularBranch(Branch branch);

}
