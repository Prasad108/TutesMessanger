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
	public List<Subject> findByDivId(int divId) {
		Query query=currentSession().createQuery("select sdc.subject from SubjectDivComposit sdc where sdc.division.id = :id");
		query.setParameter("id",divId);
		return query.list();
	}

	@Override
	@Transactional
	public void deleteByDivId(int subId, int divId) {
		Query query=currentSession().createQuery("delete from SubjectDivComposit sdc where sdc.subject.id= :subId and sdc.division.id= :divId");
		query.setParameter("subId",subId);
		query.setParameter("divId",divId);
		query.executeUpdate();
	}

}
