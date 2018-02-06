package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ExamSubjectStudentCompositTableDAO;
import com.app.pojo.ExamSubjectStudentCompositTable;
import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.SubjectDivComposit;

@Repository("ExamSubjectStudentCompositTableDAO")
public class ExamSubjectStudentCompositTableDAOImpl implements ExamSubjectStudentCompositTableDAO{

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	@Override
	@Transactional
	public void create(ExamSubjectStudentCompositTable examSubjectStudentComp) {
     currentSession().save(examSubjectStudentComp);
		
	}

	@Override
	@Transactional
	public void update(ExamSubjectStudentCompositTable examSubjectStudentComp) {
	 currentSession().update(examSubjectStudentComp);
		
	}

	@Override
	@Transactional
	public ExamSubjectStudentCompositTable edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
	 currentSession().delete(id);
	}

	@Override
	@Transactional
	public ExamSubjectStudentCompositTable find(int id) {
		return (ExamSubjectStudentCompositTable)currentSession().get(ExamSubjectStudentCompositTable.class, id);
	}

	@Override
	@Transactional
	public List<ExamSubjectStudentCompositTable> getall() {
		return currentSession().createCriteria(ExamSubjectStudentCompositTable.class).list();
	}

	@Override
	@Transactional
	public List<SubjectDivComposit> findByExamId(int examId) {
	 Query query=currentSession().createQuery("select distinct sdc.subjectDivComposit from ExamSubjectStudentCompositTable sdc where sdc.exam.id = :id");
	 query.setParameter("id",examId);
		return query.list();
	}

	@Override
	@Transactional
	public List<Student> findByExamId(int examId, int subDivId) {
		 Query query=currentSession().createQuery("select sdc.student from ExamSubjectStudentCompositTable sdc where sdc.exam.id = :examId and sdc.subjectDivComposit.id = :subDivId and sdc.student.id is not null");
		 query.setParameter("examId",examId);
		 query.setParameter("subDivId",subDivId);
			return query.list();
	}

	@Override
	@Transactional
	public ExamSubjectStudentCompositTable findByExamSubDivId(int examId, int subDivId) {
		 Query query=currentSession().createQuery("from ExamSubjectStudentCompositTable sdc where sdc.exam.id = :examId and sdc.subjectDivComposit.id = :subDivId and sdc.student.id is null");
		 query.setParameter("examId",examId);
		 query.setParameter("subDivId",subDivId);
		 return (ExamSubjectStudentCompositTable) query.uniqueResult();
	}

	@Override
	@Transactional
	public void deletStudentFromExam(int StudId, int subDivId, int examId) {
		 Query query=currentSession().createQuery("delete from ExamSubjectStudentCompositTable sdc where sdc.exam.id = :examId and sdc.subjectDivComposit.id = :subDivId and sdc.student.id =:StudId");
		 query.setParameter("examId",examId);
		 query.setParameter("subDivId",subDivId);
		 query.setParameter("StudId",StudId);
		 query.executeUpdate();
	}

}
