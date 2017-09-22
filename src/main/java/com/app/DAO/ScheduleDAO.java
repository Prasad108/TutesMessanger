package com.app.DAO;

import java.util.List;

import com.app.pojo.Division;
import com.app.pojo.Schedule;



public interface ScheduleDAO {
	
	public void create(Schedule  schedule);
	public void update(Schedule schedule);
	public Schedule edit(int id);
	public void delet(int id );
	public Schedule find(int id);
	public List<Schedule> getall();
	public Schedule fordivision(int divID);
	public int updateScheduleOfinstitute(Schedule schedule);
	


}
