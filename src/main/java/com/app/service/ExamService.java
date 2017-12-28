package com.app.service;

import java.util.List;

import com.app.pojo.Exam;

public interface ExamService {

	
	public void create(Exam exam);
	public void update(Exam exam);
	public Exam edit(int id);
	public void delet(Exam exam );
	public Exam find(int id);
	public List<Exam> getallOfParticularInstitute(int instituteId);

}
