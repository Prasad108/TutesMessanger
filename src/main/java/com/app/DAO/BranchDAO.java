package com.app.DAO;

import java.util.List;

import com.app.pojo.Branch;


public interface BranchDAO {
	
	public void create(Branch branch);
	public void update(Branch branch);
	public Branch edit(int id);
	public void delet(int id );
	public Branch find(int id);
	public List<Branch> getall();
	public List<Branch> getallOfParticularInstitute(int id);

}
