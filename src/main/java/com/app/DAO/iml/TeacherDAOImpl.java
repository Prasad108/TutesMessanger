package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.TeacherDAO;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Teacher;

@Repository("TeacherDAO")
@Transactional
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

	@Override
	 @Transactional
	public Teacher findByLoginId(int id) {
		Query query=currentSession().createQuery("from Teacher  where loginid = :id");
		query.setParameter("id",id);
		
		return (Teacher) query.uniqueResult();
	}

	@Override
	@Transactional
	public Institute GetInstitute(int id) {
		/*Query query=currentSession().createQuery("from Teacher  where loginid = :id");
		query.setParameter("id",id);
		
		return (Institute) query.uniqueResult();*/
		Query query = currentSession().createQuery("select t.institute from Teacher t where t.id= :id");
		query.setParameter("id",id);
		System.out.println((Institute) query.uniqueResult());
		return (Institute) query.uniqueResult();
		
		
	}

	@Override
	public Login getLoginIdByEmail(String email) {
		Query query = currentSession().createQuery("select l from Login l where l.username= :email");
		query.setParameter("email",email);
		 Login login = (Login)query.uniqueResult();
		 System.out.println(login.getId());
		 return login;
	}

	@Override
	public void changePassword(String newPassword , Login login) {
		
		
		
		String query = "UPDATE login SET password = '"+ newPassword +"' WHERE id = '"+ login.getId() + "'";

		 currentSession().createSQLQuery(query);
		 SQLQuery sqlQuery = currentSession().createSQLQuery(query);
		 sqlQuery.executeUpdate();
	}

	@Override
	public Boolean checkPassword(String oldPassword, Integer id) {
		Login  login = (Login) currentSession().createQuery("select l from Login l where l.id= :id and l.password= :oldPassword").setParameter("id", id).setParameter("oldPassword", oldPassword).uniqueResult();
		
		 if(login != null)
			 return true;
		 return false;
	}

}
