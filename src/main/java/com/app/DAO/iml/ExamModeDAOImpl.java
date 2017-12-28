package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.app.DAO.ExamModeDAO;
import com.app.pojo.ExamMode;

@Repository("ExamModeDAO")
public class ExamModeDAOImpl implements ExamModeDAO{

	@Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	@Override
	 @Transactional
	public List<ExamMode> getAll() {
		
		return currentSession().createCriteria(ExamMode.class).list();
	}

}
