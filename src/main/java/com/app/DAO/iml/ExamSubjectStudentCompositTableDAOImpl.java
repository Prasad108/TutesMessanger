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
import com.google.gson.Gson;

@Repository("ExamSubjectStudentCompositTableDAO")
public class ExamSubjectStudentCompositTableDAOImpl implements ExamSubjectStudentCompositTableDAO{

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	 Gson gson = new Gson();
	
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
		
		 query.executeUpdate();
	}

	@Override
	@Transactional
	public String examSubjectStudentResult(int ExamId, int SubdivId) {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();  
		 Query query=currentSession().createQuery("from ExamSubjectStudentCompositTable essct LEFT JOIN Result r  on  essct.id=r.examSubjectStudentCompositTable.id  LEFT JOIN Student s on essct.student.id=s.id where essct.exam.id= :ExamId and essct.subjectDivComposit.id = :subDivId and essct.student.id is not null");
		 query.setParameter("ExamId", ExamId);
		 query.setParameter("subDivId", SubdivId);
		 
        List lst = query.list();
        sb.append("[");
       // System.out.println("" + lst.size());
        //System.out.println("gooing to display result");
        for (int i = 0; i < lst.size(); i++) {
        	 sb.append("{");
        	 sb.append("\"examSubjectStudentCompositTable\":"+gson.toJson(((Object[]) lst.get(i))[0]));
        	 sb.append(",\"result\":"+gson.toJson(((Object[]) lst.get(i))[1]));
        	 sb.append(",\"student\":"+gson.toJson(((Object[]) lst.get(i))[2]));
            //System.out.println("first obj"+((Object[]) lst.get(i))[0]);     //account bean, actually this is in reverse order - so this is user bean
           // System.out.println("second obj"+((Object[]) lst.get(i))[1]); 
           // System.out.println("third obj"+((Object[]) lst.get(i))[2]); //user bean         & this account bean
            sb.append("},");
        }
        sb.setLength(sb.length() - 1);
        
        sb.append("]");
       return sb.toString();
		
	}

	@Override
	@Transactional
	public void deletSubjectFromExam(int ExamId, int SubdivId) {
		 Query query=currentSession().createQuery("delete from ExamSubjectStudentCompositTable sdc where sdc.exam.id = :examId and sdc.subjectDivComposit.id = :subDivId");
		 query.setParameter("examId",ExamId);
		 query.setParameter("subDivId",SubdivId);
		 query.executeUpdate();
		
	}

}
