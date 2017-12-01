package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ClassesDAO;
import com.app.pojo.Branch;
import com.app.pojo.Classes;

@Repository("ClassDAO")
public class ClassesDAOimpl implements ClassesDAO {

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	@Override
	 @Transactional
	public void create(Classes classes) {
		currentSession().save(classes);

	}

	@Override
	 @Transactional
	public void update(Classes classes) {
		currentSession().update(classes);

	}

	@Override
	 @Transactional
	public Classes edit(int id) {
		return find(id);
	}

	@Override
	 @Transactional
	public void delet(int id) {
		currentSession().delete(find(id));

	}

	@Override
	 @Transactional
	public Classes find(int id) {
		return (Classes)currentSession().get(Classes.class,id);
	}

	@Override
	 @Transactional
	public List<Classes> getall() {
		return currentSession().createCriteria(Classes.class).list();
	}

	@Override
	 @Transactional
	public List<Classes> getallOfParticularBranch(Branch branch) {
		Query query=currentSession().createQuery("from Classes  where branch = :branch");
		query.setParameter("branch",branch);
		return query.list();
	}

}
