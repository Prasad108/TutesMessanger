package com.app.DAO;

import java.util.List;

import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Teacher;

public interface TeacherDAO {
	public void create(Teacher teacher);
	public void update(Teacher teacher);
	public Teacher edit(int id);
	public void delet(Teacher teacher);
	public Teacher find(int id);
	public Teacher findByLoginId(int id);
	public Institute GetInstitute(int id);
	public List<Teacher> getall();
	public Login getLoginIdByEmail(String email);
	public void changePassword(String newPassword  , Login login);
	public Boolean checkPassword(String oldPassword, Integer id);
	
	

}
