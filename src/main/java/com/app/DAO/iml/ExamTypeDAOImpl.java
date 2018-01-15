package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ExamTypeDAO;
import com.app.pojo.ExamType;

@Repository("ExamTypeDAO")
public class ExamTypeDAOImpl implements ExamTypeDAO {

	@Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	@Override
	 @Transactional
	public List<ExamType> getAll() {
		
		return currentSession().createCriteria(ExamType.class).list();
	}

}
