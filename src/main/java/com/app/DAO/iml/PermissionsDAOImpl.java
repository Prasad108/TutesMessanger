package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.PermissionsDAO;
import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Teacher;


@Repository("PermissionsDAO")
public class PermissionsDAOImpl implements PermissionsDAO {
	

	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }

	@Override
	 @Transactional
	public void create(Permissions permissions) {
		currentSession().save(permissions);

	}

	@Override
	 @Transactional
	public void update(Permissions teacher) {
		currentSession().update(teacher);

	}

	@Override
	 @Transactional
	public Permissions edit(int id) {
		return find(id);
	}

	@Override
	 @Transactional
	public void delet(int id) {
		currentSession().delete(id);

	}

	@Override
	 @Transactional
	public Permissions find(int id) {
		return (Permissions)currentSession().get(Permissions.class,id);
	}

	@Override
	 @Transactional
	public List<Permissions> getall() {
		return currentSession().createCriteria(Permissions.class).list();
	}

	@Override
	@Transactional
	public Permissions GetPermissionOfTeacher(Teacher t) {
		Query query=currentSession().createQuery("select Permissions from Teacher t, Permissions p  where t.permissions = p and t.id = :id");		
		query.setParameter("id",t.getId());		
		return (Permissions) query.uniqueResult();
	}

}
