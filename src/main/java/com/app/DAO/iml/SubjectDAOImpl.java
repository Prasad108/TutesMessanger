package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojo.Student;
import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;

@Repository("SubjectDAO")
public class SubjectDAOImpl implements com.app.DAO.SubjectDAO{

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	@Override
	@Transactional
	public void create(Subject subject) {
		currentSession().save(subject);
		
	}

	@Override
	@Transactional
	public void update(Subject subject) {
		currentSession().update(subject);
		
	}

	@Override
	@Transactional
	public Subject edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
		currentSession().delete(id);
		
	}

	@Override
	@Transactional
	public Subject find(int id) {
		return (Subject)currentSession().get(Subject.class,id);
	}

	@Override
	@Transactional
	public List<Subject> getall() {
		return currentSession().createCriteria(Subject.class).list();
	}
	
	@Override
	@Transactional
	public List<Subject> getallOfInstitute(int instituteId) {
		Query query=currentSession().createQuery("from Subject sub where sub.institute.id = :id");
		query.setParameter("id",instituteId);
		return query.list();
	}

	@Override
	@Transactional
	public void deleteFromInstitute(int subId) {
		Query query = currentSession().createQuery("UPDATE Subject s SET s.institute.id=NULL where s.id= :SubId");
		query.setParameter("SubId",subId);
		int result=query.executeUpdate();
		System.out.println(result+" This is query result");
		
	}


}
