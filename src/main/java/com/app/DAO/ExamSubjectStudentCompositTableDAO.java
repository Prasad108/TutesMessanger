package com.app.DAO;

import java.util.List;

import com.app.pojo.ExamSubjectStudentCompositTable;
import com.app.pojo.Student;
import com.app.pojo.SubjectDivComposit;

public interface ExamSubjectStudentCompositTableDAO {

	public void create(ExamSubjectStudentCompositTable examSubjectStudentComp);
	public void update(ExamSubjectStudentCompositTable examSubjectStudentComp);
	public ExamSubjectStudentCompositTable edit(int id);
	public void delet(int id);
	public ExamSubjectStudentCompositTable find(int id);
	public List<ExamSubjectStudentCompositTable> getall();
	
	public List<SubjectDivComposit> findByExamId(int examId);
	public List<Student> findByExamId(int examId,int subDivId);
	public ExamSubjectStudentCompositTable findByExamSubDivId(int examId,int subDivId);
	public void deletStudentFromExam(int StudId,int subDivId,int examId);
	
}
