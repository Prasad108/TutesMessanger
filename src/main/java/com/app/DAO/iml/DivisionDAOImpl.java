package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.DivisionDAO;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.pojo.Login;

@Repository("DivisionDAO")
public class DivisionDAOImpl implements DivisionDAO {
	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }

	@Override
	 @Transactional
	public void create(Division div) {
		currentSession().save(div);

	}

	@Override
	 @Transactional
	public void update(Division div) {
		currentSession().update(div);


	}

	@Override
	 @Transactional
	public Division edit(int id) {
		return find(id);
	}

	@Override
	 @Transactional
	public void delet(int id) {
		currentSession().delete(id);

	}

	@Override
	 @Transactional
	public Division find(int id) {
		
		Query query=currentSession().createQuery("from Division where id = :id");
		query.setParameter("id",id);
		Division d=(Division) query.uniqueResult();
		System.out.println("division d is "+d);
		return d;
	}

	@Override
	 @Transactional
	public List<Division> getall() {
		return currentSession().createCriteria(Division.class).list();
	}

	@Override
	 @Transactional
	public List<Division> getallOfParticularClass(Classes classes) {
		Query query=currentSession().createQuery("from Division where classes = :classes");
		query.setParameter("classes",classes);
		return query.list();
	}

}
