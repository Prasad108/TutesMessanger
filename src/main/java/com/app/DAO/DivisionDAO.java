package com.app.DAO;

import java.util.List;

import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Division;

public interface DivisionDAO {
	
	public void create(Division div);
	
	public void update(Division div);
	public Division edit(int id);
	public void delet(int id );
	public Division find(int id);
	public List<Division> getall();
	public List<Division> getallOfParticularClass(Classes classes);

}
