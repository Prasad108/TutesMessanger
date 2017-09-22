package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ScheduleDAO;
import com.app.pojo.Division;
import com.app.pojo.Login;
import com.app.pojo.Schedule;
import com.app.service.DivisionService;


@Repository("ScheduleDAO")
public class ScheduleDAOimpl implements ScheduleDAO {

	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 @Autowired
		DivisionService divisionService;
	 
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	
	
	@Override
	@Transactional
	public void create(Schedule schedule) {
		
		currentSession().save(schedule);

	}

	@Override
	@Transactional
	public void update(Schedule schedule) {
		currentSession().update(schedule);

	}

	@Override
	@Transactional
	public Schedule edit(int id) {
		return find(id);
	}

	@Override
	@Transactional
	public void delet(int id) {
		currentSession().delete(id);

	}

	@Override
	@Transactional
	public Schedule find(int id) {
		return (Schedule)currentSession().get(Schedule.class,id);
	}

	@Override
	@Transactional
	public List<Schedule> getall() {
		return currentSession().createCriteria(Schedule.class).list();
	}


	@Override
	@Transactional
	public Schedule fordivision(int divID) {
		
		Division d= divisionService.find(divID);
		System.out.println("before query ");
		Query query=currentSession().createQuery("from Schedule  where division = :div");
		query.setParameter("div",d);
		
	
		
		Schedule s= (Schedule) query.uniqueResult();
		System.out.println("after query ");
		return s; 
		
	}


	@Override
	@Transactional
	public int updateScheduleOfinstitute(Schedule schedule) {
		// TODO Auto-generated method stub
		
		Division d=divisionService.find(schedule.getDivision().getId());
		schedule.setDivision(d);
		Query query=currentSession().createQuery("update Schedule sert string =:url where division = :div");
		query.setParameter("div",d);
		query.setParameter("url",schedule.getString());
		
		
		return query.executeUpdate();
	}


	


	
}
