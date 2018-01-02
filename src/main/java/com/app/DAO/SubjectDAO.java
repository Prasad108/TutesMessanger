package com.app.DAO;

import java.util.List;

import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;

public interface SubjectDAO {
	
	public void create(Subject subject);
	public void update(Subject subject);
	public Subject edit(int id);
	public void delet(int id);
	public Subject find(int id);
	public List<Subject> getall();

	public List<Subject> findByDivId(int divId);
	
	public void deleteByDivId(int subId,int divId);
}
