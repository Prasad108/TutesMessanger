package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.SubjectDivCompositDAO;
import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;

@Repository("SubjectDivCompositDAO")
public class SubjectDivCompositDAOImpl implements SubjectDivCompositDAO{

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	@Override
	@Transactional
	public void create(SubjectDivComposit subDivComp) {
		currentSession().save(subDivComp);
		
	}

	@Override
	@Transactional
	public void update(SubjectDivComposit subDivComp) {
		currentSession().update(subDivComp);
		
	}

	@Override
	@Transactional
	public SubjectDivComposit edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
	 currentSession().delete(id);
		
	}

	@Override
	@Transactional
	public SubjectDivComposit find(int id) {
		return (SubjectDivComposit)currentSession().get(SubjectDivComposit.class, id);
	}

	@Override
	@Transactional
	public List<SubjectDivComposit> getall() {
		return currentSession().createCriteria(SubjectDivComposit.class).list();
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

	@Override
	@Transactional
	public String findSubjectName(int subDivCompId) {
		Query query=currentSession().createQuery("SELECT sub.name FROM Subject sub WHERE sub.id = (SELECT subDivComp.subject.id FROM SubjectDivComposit subDivComp WHERE subDivComp.id= :subDivCompId)");
		query.setParameter("subDivCompId",subDivCompId);
		
		return query.uniqueResult().toString();
	}

}
