package com.app.service;

import java.util.List;

import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Teacher;

public interface InstituteService {

	public void create(Institute institute);
	public void update(Institute institute);
	public Institute edit(int id);
	public void delet(int id );
	public Institute find(int id);
	public Institute find(String name);
	public List<Institute> getall();
	public List<Teacher> getallPendingTeacherForApproval(Institute institute);
	public List<Student> getallPendingStudentForApproval(Institute institute);
	public List<Student> getallStudentWhoAreNotInAnyDivision(Institute institute);
	public String GetSubjectTree(int InstId);
	public String GetInstituteTree(int InstId);
	public String TreeStructureSujectsNotInExam(int InstId,int ExamId);
	public String TreeStructureSujectsOFExam(int InstId,int ExamId);

	


}
