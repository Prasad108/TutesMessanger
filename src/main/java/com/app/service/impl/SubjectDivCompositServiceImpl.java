package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.SubjectDivCompositDAO;
import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;
import com.app.service.SubjectDivCompositService;

@Service("subjectDivCompositService")
public class SubjectDivCompositServiceImpl implements SubjectDivCompositService{

	@Autowired
	SubjectDivCompositDAO subDivCompDAO;
	
	@Override
	public void create(SubjectDivComposit subDivComp) {
		subDivCompDAO.create(subDivComp);
		
	}

	@Override
	public void update(SubjectDivComposit subDivComp) {
		subDivCompDAO.update(subDivComp);
		
	}

	@Override
	public SubjectDivComposit edit(int id) {
		return subDivCompDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		subDivCompDAO.delet(id);
		
	}

	@Override
	public SubjectDivComposit find(int id) {
		return subDivCompDAO.find(id);
	}

	@Override
	public List<SubjectDivComposit> getall() {
		return subDivCompDAO.getall();
	}

	@Override
	public List<Subject> findByDivId(int divId) {
		return subDivCompDAO.findByDivId(divId);
	}

	@Override
	public void deleteByDivId(int subId, int divId) {
		subDivCompDAO.deleteByDivId(subId, divId);
		
	}

	@Override
	public String findSubjectName(int subDivCompId) {
		return subDivCompDAO.findSubjectName(subDivCompId);
	}

}
