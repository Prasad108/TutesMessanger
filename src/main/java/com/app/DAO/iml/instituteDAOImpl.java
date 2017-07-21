package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.InstituteDAO;
import com.app.pojo.Institute;
import com.app.pojo.Login;


@Repository("InstituteDAO")
public class instituteDAOImpl implements InstituteDAO {

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	
	 @Override
	 @Transactional
	public void create(Institute institute) {
		currentSession().save(institute);

	}

	@Override
	@Transactional
	public void update(Institute institute) {
		currentSession().update(institute);
	}

	@Override
	@Transactional
	public Institute edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
		currentSession().delete(id);
	}

	@Override
	@Transactional
	public Institute find(int id) {
		return (Institute)currentSession().get(Institute.class,id);
		
	}

	@Override
	@Transactional
	public List<Institute> getall() {
		return currentSession().createCriteria(Institute.class).list();
	}

}
