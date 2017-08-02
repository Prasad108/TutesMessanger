package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.TeacherDAO;
import com.app.pojo.Teacher;

@Repository("TeacherDAO")
public class TeacherDAOImpl implements TeacherDAO {
	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }

	@Override
	 @Transactional
	public void create(Teacher teacher) {
		currentSession().save(teacher);

	}

	@Override
	 @Transactional
	public void update(Teacher teacher) {
		currentSession().update(teacher);

	}

	@Override
	 @Transactional
	public Teacher edit(int id) {
		return find(id);
	}

	@Override
	 @Transactional
	public void delet(int id) {
		currentSession().delete(id);

	}

	@Override
	 @Transactional
	public Teacher find(int id) {
		return (Teacher)currentSession().get(Teacher.class,id);
	}

	@Override
	 @Transactional
	public List<Teacher> getall() {
		return currentSession().createCriteria(Teacher.class).list();
	}

}
