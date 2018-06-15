package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ParentDAO;
import com.app.pojo.Branch;
import com.app.pojo.Parent;


@Repository("ParentDAO")
public class ParentDAoImpl implements ParentDAO {
	@Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	
	@Override
	 @Transactional
	public void create(Parent parent) {
		currentSession().save(parent);

	}

	@Override
	@Transactional
	public void update(Parent parent) {
		currentSession().update(parent);

	}

	@Override
	@Transactional
	public Parent edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(Parent parent) {
		currentSession().delete(parent);

	}

	@Override
	@Transactional
	public Parent find(int id) {
		return (Parent)currentSession().get(Parent.class,id);
	}

	@Override
	@Transactional
	public List<Parent> getall() {
		return currentSession().createCriteria(Parent.class).list();
	}


	@Override
	@Transactional
	public Parent findByStudentId(int studId) {
		Parent p=null;
		Query query=currentSession().createQuery("select p from Parent p where p.id =(select s.parent.id from Student s where s.id = :studId)");
		query.setParameter("studId", studId);
		p=(Parent) query.uniqueResult();
		return p;
	}

}
