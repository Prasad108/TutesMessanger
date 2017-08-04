package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.BranchDAO;
import com.app.pojo.Branch;
import com.app.pojo.Institute;


@Repository("BranchDAO")
public class BranchDAOImpl implements BranchDAO {
	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	

	@Override
	 @Transactional
	public void create(Branch branch) {
		currentSession().save(branch);
		
	}

	@Override
	 @Transactional
	public void update(Branch branch) {
		currentSession().update(branch);
		
	}

	@Override
	 @Transactional
	public Branch edit(int id) {
		return find(id);
	}

	@Override
	 @Transactional
	public void delet(int id) {
		currentSession().delete(id);
		
	}

	@Override
	 @Transactional
	public Branch find(int id) {
		return (Branch)currentSession().get(Branch.class,id);
	}

	@Override
	 @Transactional
	public List<Branch> getall() {
		return currentSession().createCriteria(Branch.class).list();
	}

}
