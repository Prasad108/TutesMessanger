package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.RoleDAO;
import com.app.pojo.Role;

@Repository("RoleDAO")
public class RoleDAOImpl implements RoleDAO{

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }

	@Override
	@Transactional
	public void create(Role role) {
		currentSession().save(role);
		
	}

	@Override
	@Transactional
	public void update(Role role) {
		currentSession().update(role);
		
	}

	@Override
	@Transactional
	public Role edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
		Integer i=id;Role r= new Role();
		r.setId(id);
		currentSession().delete(r);
		
	}

	@Override
	@Transactional
	public Role find(int id) {
		return (Role)currentSession().get(Role.class,id);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Role> getall() {
		return currentSession().createCriteria(Role.class).list();
	}

	@Override
	@Transactional
	public Role findByName(String name) {
		Query query=currentSession().createQuery("from Role  where name = :name");
		query.setParameter("name",name);
		
		return (Role) query.uniqueResult();
	}

	
}
