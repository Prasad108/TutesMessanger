package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.ScheduleDAO;
import com.app.pojo.Division;
import com.app.pojo.Schedule;
import com.app.service.ScheduleService;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	
	@Autowired
	ScheduleDAO scheduleDAO;
	
	@Override
	public void create(Schedule schedule) {
		scheduleDAO.create(schedule);

	}

	@Override
	public void update(Schedule schedule) {
		scheduleDAO.update(schedule);

	}

	@Override
	public Schedule edit(int id) {
	
		return scheduleDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		scheduleDAO.delet(id);

	}

	@Override
	public Schedule find(int id) {
	
		return scheduleDAO.find(id);
	}

	@Override
	public List<Schedule> getall() {
		
		return scheduleDAO.getall();
	}

	@Override
	public Schedule fordivision(int divID) {
		// TODO Auto-generated method stub
		return scheduleDAO.fordivision(divID);
	}

	
	

}
