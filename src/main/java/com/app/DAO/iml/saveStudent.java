package com.app.DAO.iml;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojo.Student;

@Repository
public class saveStudent {

	 @Autowired
	 SessionFactory sessionFactory;
	 
	
	 @Transactional
	 public int save(Student student)
	 {	Session sess = this.sessionFactory.getCurrentSession(); 
		 int num = (int) sess.save(student);
		return num;
	}
}
