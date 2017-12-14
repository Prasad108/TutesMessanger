package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Teacher;

@Repository("StudentDAO")
public class StudentDAOImpl implements com.app.DAO.StudentDAO {
	

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
		return (Student)currentSession().get(Student.class,id);
	}

	@Override
	@Transactional
	public List<Student> getall() {
		return currentSession().createCriteria(Student.class).list();
	}

	@Override
	@Transactional
	public Student findByLoginId(int id) {
		Query query=currentSession().createQuery("from Student  where loginid = :id");
		query.setParameter("id",id);
		
		return (Student) query.uniqueResult();
	}
	
	@Override
	@Transactional
	public List<Student> findByDivId(int id) {
		Query query=currentSession().createQuery("from Student  where divid = :id");
		query.setParameter("id",id);
		return query.list();
	}

	@Override
	@Transactional
	public Institute GetInstitute(int id) {
		Query query = currentSession().createQuery("select t.institute from Student t where t.id= :id");
		query.setParameter("id",id);
		System.out.println((Institute) query.uniqueResult());
		return (Institute) query.uniqueResult();
	}

	@Override
	@Transactional
	public void SetDivisionId(int StudentId,int DiviID) {
		Query query = currentSession().createQuery("UPDATE Student s SET s.division.id=:DiviID  where s.id= :StudentId");
		query.setParameter("DiviID",DiviID);
		query.setParameter("StudentId",StudentId);
		int result=query.executeUpdate();
		System.out.println(result+" This is query result");
		
	}


@Override
	@Transactional
	public void deleteSelectedFromDiv(int id) {
	
		Query query=currentSession().createQuery("UPDATE Student s SET s.division.id=NULL WHERE s.id =:id");
		query.setParameter("id", id);
		query.executeUpdate();
		//query.setParameter("status", null);
		System.out.println("success query");
		
	}


}
