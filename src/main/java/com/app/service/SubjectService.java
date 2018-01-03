package com.app.service;

import java.util.List;

import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;

public interface SubjectService {

	public void create(Subject subject);
	public void update(Subject subject);
	public Subject edit(int id);
	public void delet(int id);
	public Subject find(int id);
	public List<Subject> getall();

	public List<Subject> findByDivId(int divId);
	public void deleteByDivId(int subId,int divId);
}
