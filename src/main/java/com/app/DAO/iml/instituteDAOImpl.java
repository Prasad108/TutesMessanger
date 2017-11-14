package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.InstituteDAO;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Role;
import com.app.pojo.Student;
import com.app.pojo.Teacher;


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


	@Override
	@Transactional
	public Institute find(String name) {
		Query query=currentSession().createQuery("from Institute  where name = :name");
		query.setParameter("name",name);
		
		return (Institute) query.uniqueResult();
	}


	@Override
	@Transactional
	public List<Teacher> getallPendingTeacherForApproval(Institute institute) {
		Query query=currentSession().createQuery("SELECT t FROM Login l, Teacher t WHERE l.enableInstitute=FALSE AND l.id=t.login AND t.institute= :institute");
		query.setParameter("institute",institute);
		return query.list();
		
	}


	@Override
	@Transactional
	public List<Student> getallPendingStudentForApproval(Institute institute) {
		Query query=currentSession().createQuery("SELECT s FROM Login l, Student s WHERE l.enableInstitute=FALSE AND l.id=s.login AND s.institute= :institute");
		query.setParameter("institute",institute);
		return query.list();
	}


	@Override
	@Transactional
	public List<Student> getallStudentWhoAreNotInAnyDivision(Institute institute) {
		Query query=currentSession().createQuery("SELECT s FROM Student s WHERE s.division IS NULL AND s.institute= :institute");
		query.setParameter("institute",institute);
		return query.list();
	}

}
