package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojo.Branch;
import com.app.pojo.Student;

@Repository("StudentDAO")
public class StudentDAO implements com.app.DAO.StudentDAO {
	

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }

	@Override
	@Transactional
	public void create(Student student) {
		currentSession().save(student);

	}

	@Override
	@Transactional
	public void update(Student student) {
		currentSession().update(student);

	}

	@Override
	@Transactional
	public Student edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
		currentSession().delete(id);

	}

	@Override
	@Transactional
	public Student find(int id) {
		return (Student)currentSession().get(Branch.class,id);
	}

	@Override
	@Transactional
	public List<Student> getall() {
		return currentSession().createCriteria(Student.class).list();
	}

}
