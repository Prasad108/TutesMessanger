package com.app.service;

import java.util.List;

import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;

public interface SubjectDivCompositService {

	public void create(SubjectDivComposit subDivComp);
	public void update(SubjectDivComposit subDivComp);
	public SubjectDivComposit edit(int id);
	public void delet(int id);
	public SubjectDivComposit find(int id);
	public List<SubjectDivComposit> getall();
	
    public List<Subject> findByDivId(int divId);
	
	public void deleteByDivId(int subId,int divId);
}
