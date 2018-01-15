package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ExamDAO;
import com.app.pojo.Division;
import com.app.pojo.Exam;

@Repository("ExamDAO")
public class ExamDAOImpl implements ExamDAO {

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	
	@Override
	 @Transactional
	public void create(Exam exam) {
		currentSession().save(exam);

	}

	@Override
	 @Transactional
	public void update(Exam exam) {
		currentSession().update(exam);

	}

	@Override
	 @Transactional
	public Exam edit(int id) {
		return find(id);
	}

	@Override
	 @Transactional
	public void delet(Exam exam) {
		currentSession().delete(exam);

	}

	@Override
	 @Transactional
	public Exam find(int id) {

		Query query=currentSession().createQuery("from Exam where id = :id");
		query.setParameter("id",id);
		Exam e=(Exam) query.uniqueResult();
		
		return e;
	}


	@Override
	@Transactional
	public List<Exam> getallOfParticularInstitute(int instituteId) {
		Query query=currentSession().createQuery("from Exam e where e.institute.id = :id");
		query.setParameter("id",instituteId);
		return query.list();
	}

}
