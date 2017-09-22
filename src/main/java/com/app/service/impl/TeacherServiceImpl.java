package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.TeacherDAO;
import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Teacher;
import com.app.service.BranchService;
import com.app.service.ClassesService;
import com.app.service.DivisionService;
import com.app.service.InstituteService;
import com.app.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
	
	@Autowired
	TeacherDAO TeacherDAO;
	
	
	@Autowired
	BranchService branchService;
		
	
	@Autowired
	ClassesService classesService;
	
	@Autowired
	DivisionService divisionService;
	
	@Autowired
	InstituteService instituteService;
	

	@Override
	public void create(Teacher teacher) {
		TeacherDAO.create(teacher);

	}

	@Override
	public void update(Teacher teacher) {
		TeacherDAO.update(teacher);

	}

	@Override
	public Teacher edit(int id) {
		return TeacherDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		TeacherDAO.delet(id);

	}

	@Override
	public Teacher find(int id) {
		
		return TeacherDAO.find(id);
	}

	@Override
	public List<Teacher> getall() {
		return TeacherDAO.getall();
	}

	@Override
	public Teacher findByLoginId(int id) {
		
		return TeacherDAO.findByLoginId(id);
	}

	@Override
	public Institute GetInstitute(int id) {
		
		return TeacherDAO.GetInstitute(id);
	}

	@Override
	public Login getLoginIdByEmail(String email) {
		return TeacherDAO.getLoginIdByEmail(email);
		
	}

	@Override
	public void changePassword(String newPassword , Login login) {
		TeacherDAO.changePassword(newPassword , login);
		
	}

	@Override
	public Boolean checkPassword(String oldPassword, Integer id) {
		return  TeacherDAO.checkPassword( oldPassword,  id);
		
	}
	
	@Override
	public String InstituteStucture(Teacher teacher)
	{
		
		
		Institute inst=GetInstitute(teacher.getId());
		
		 String str="<ul><li><a href=\"#\">"+inst.getName()+"</a><ul>";
		 System.out.println("isntituet is: "+inst);
		 		 
		// branches of institute
		 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
		 for(Branch b : branchlist)
		 {
			 str+="<li><a href=\"#\">"+b.getName()+"</a><ul>";
			 System.out.println("Branch is: "+b);
			 
			//classes of branch
			 List<Classes> classList=classesService.getallOfParticularBranch(b);
			 for(Classes c : classList)
			 {
				 str+="<li><a href=\"#\">"+c.getName()+"</a><ul>";
				 System.out.println("Class is: "+c);				 
				try
				{
					 // division of Classes
					 List<Division>divList=divisionService.getallOfParticularClass(c);
					 for(Division d :divList)
					 {
						 str+="<li><a href=\"#\">"+d.getName()+"</a></li>";
						 System.out.println("division  is: "+d);
					 }
				}catch(Exception e)
				{
					System.out.println("no further Division in the class");
				}			 
				 str+="</ul></li>";			 
			 }
			 str+="</ul></li>";			 
		 }
		 str+="</ul></li></ul>";		
		
		return str;
	}

	@Override
	public String InstituteStuctureForSchedule(Teacher teacher) {

		Institute inst=instituteService.find(teacher.getInstitute().getId());
		
		 String str="<ul><li><a href=\"#\">"+inst.getName()+"</a><ul>";

		// branches of institute
		 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
		 for(Branch b : branchlist)
		 {
			 str+="<li><a href=\"#\">"+b.getName()+"</a><ul>";
		 
			//classes of branch
			 List<Classes> classList=classesService.getallOfParticularBranch(b);
			 for(Classes c : classList)
			 {
				 str+="<li><a href=\"#\">"+c.getName()+"</a><ul>";
				try
				{
					 // division of Classes
					 List<Division>divList=divisionService.getallOfParticularClass(c);
					 for(Division d :divList)
					 {
						 str+="<li><a class='divisionSchedule' id='"+d.getId()+"' data-toggle='modal'  href='#myModal'>"+d.getName()+"</a></li>";						 
					 }
				}catch(Exception e)
				{
					System.out.println("no further Division in the class");
				}			 				 
				 str+="</ul></li>";				 
			 }
			 str+="</ul></li>";			 
		 }
		 str+="</ul></li></ul>";
			
		return str;
	}

}
