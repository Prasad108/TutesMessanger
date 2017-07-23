package com.app.DAO.iml;

import javax.management.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Student;
import com.app.pojo.Teacher;

@Repository
public class saveStudent {

	 @Autowired
	 SessionFactory sessionFactory;
	 
	
	 @Transactional
	 public int save(Institute i,Login l,Teacher t)
	 {	
		
		 Session sess = this.sessionFactory.getCurrentSession(); 
		 System.out.println("getting institute id");
		 Criteria criteria = sess.createCriteria(Login.class);
		 Login log = (Login) criteria.add(Restrictions.eq("username", i.getName()))
		                              .uniqueResult();
		 
		/* System.out.println("institute name is "+inst.getName()+" and id is "+inst.getId());
		 
		 Teacher t2= new Teacher(inst, l, fname, lname, email, contactno)
		 int num = (int) sess.save(t);*/
		return 1;
	}
	 @Transactional
	 public int saveinst(Institute i)
	 {	Session sess = this.sessionFactory.getCurrentSession(); 
		 int num = (int) sess.save(i);
		return num;
	}
	 @Transactional
	 public int loginsave(Login l)
	 {	Session sess = this.sessionFactory.getCurrentSession(); 
		 int num = (int) sess.save(l);
		return num;
	}
	 
	 @Transactional
	 public int findlogin(Login i)
	 {	Session sess = this.sessionFactory.getCurrentSession(); 
	 
	 System.out.println("getting login id");
	 Criteria criteria = sess.createCriteria(Login.class);
	 Login log = (Login) criteria.add(Restrictions.eq("username", i.getUsername()))
	                              .uniqueResult();
	 
	 System.out.println("login  username is "+log.getUsername()+" and password is "+log.getPassword());
	 
	 
		return 1;
	}
	 
	 @Transactional
	 public int saveTeacher(int instid,String username,String Password,Teacher t)
	 {	Session sess = this.sessionFactory.getCurrentSession(); 
	 
	 
	 int result = 0;
	 
	 
	 
	 Criteria rolecriteria = sess.createCriteria(Role.class);
	 Role role = (Role) rolecriteria.add(Restrictions.eq("id", 2))
	                              .uniqueResult();
	 
	 System.out.println("**********Role is "+role.toString());
	 
	 Login login= new Login(role, username, Password);
	 

	 
	 
	 int j=(int) sess.save(login);
	 if (j<=0)
	 {
		
		 System.out.println("*********login not created");
	 }else
	 {
		 System.out.println("*********login created");
		 Criteria logincriteria = sess.createCriteria(Login.class);
		 Login teacherlogin = (Login) logincriteria.add(Restrictions.eq("username", username	))
		                              .uniqueResult();
		 
		 System.out.println("******** login is "+teacherlogin.toString());
		
		 
		 
		 Criteria inst = sess.createCriteria(Institute.class);
		 Institute institute = (Institute) inst.add(Restrictions.eq("id", instid))
		                              .uniqueResult();
		 System.out.println("**********istitute is "+institute.toString());
		 Permissions p=new  
				 Permissions(1,true, true, true, true, true, true, true, true, true, true, true, true);
		 
		 
		 Teacher teacher= new Teacher(institute, teacherlogin, p,t.getFname(), t.getLname(), t.getEmail(), t.getContactno());
		 
		 result=(int)sess.save(teacher);
		 if(result<=0)
		 {
			 System.out.println("***********teacher not created");
		 }else
		 {
			 System.out.println("***********teacher is created");
		 }
	 }
	 
	 
	
		
		return result;
	}
	 
}
