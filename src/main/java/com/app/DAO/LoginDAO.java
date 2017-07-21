package com.app.DAO;



import java.util.List;

import com.app.pojo.Login;

public interface LoginDAO {
	
	
	public void create(Login login);
	public void update(Login login);
	public Login edit(int id);
	public void delet(int id );
	public Login find(int id);
	public List<Login> getall();
	public boolean exist(Login login);
	public Login find_By_Uname_pwd(Login l);
	
	
	
	

}
