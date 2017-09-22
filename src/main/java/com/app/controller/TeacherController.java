package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Schedule;
import com.app.pojo.Teacher;
import com.app.service.BranchService;
import com.app.service.ClassesService;
import com.app.service.DivisionService;
import com.app.service.InstituteService;
import com.app.service.ScheduleService;
import com.app.service.TeacherService;

@Controller
@SessionAttributes({ "teacher", "appAdmin", "student" })
public class TeacherController {
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	ClassesService classesService;
	
	@Autowired
	DivisionService divisionService;
	
	@Autowired
	InstituteService instituteService;
	
	@Autowired
	ScheduleService scheduleService;
	
	 @RequestMapping(value="/ModifyInstitueStructure",method = RequestMethod.GET)  
	    public String  ModifyInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is ModifyInstitueStructure controller");
	    			
			Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
			Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
			
			 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current isntitute :");
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
				
		
				
			model.addAttribute("BranchesOfInst",branchlist );
			
	        return "Teacher/ModifyInstitueStructure";
	    }
	       	 
	 
	 @RequestMapping(value="/AddNewBranch",method = RequestMethod.POST)  
	    public String  AddNewBranch(Model model,@ModelAttribute("Branch") Branch branch1,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is AddNewBranch controller");
	    	branch1.setInstitute(teacher.getInstitute());
	    	
	    	branchService.create(branch1);
	    	System.out.println("new Branch is saved ");
	    	model.addAttribute("SaveSuccessMessage", "New branch is Saved with the name "+branch1.getName());
	    	
	    	Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	
	    	
	    	Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
	    	
	    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current isntitute :");
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
				
		
				
			model.addAttribute("BranchesOfInst",branchlist );
	    				
	        return "Teacher/ModifyInstitueStructure";
	    }
	 	 

	 @RequestMapping(value="/AddNewClass",method = RequestMethod.POST)  
	    public String  AddNewClass(Model model,@ModelAttribute("Classes") Classes clas,@ModelAttribute("teacher") Teacher teacher) {  
	    	
		 
	    	System.out.println("this is AddNewClass controller");
	    	
	    	
	    	Branch branch= branchService.find(clas.getBranch().getId()) ;
	    	Classes c=new Classes(branch, clas.getName());
	    	try{	
			    	classesService.create(c);	    		
			    	System.out.println("new Classes is saved ");
			    	model.addAttribute("SaveSuccessMessage", "New Class is Saved with the name "+clas.getName());
			    	
	    	}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("ErrorMessage", "Duplicate entry Name of the Class or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	
			}
	    	finally {
	    		
	    		
		    	Branch branch1= new Branch();
				Classes clsess=new Classes();
				Division division =new Division();
				model.addAttribute("Branch", branch1);
				model.addAttribute("Classes", clsess);
				model.addAttribute("Division", division);
	    		Institute inst=teacherService.GetInstitute(teacher.getId());
				System.out.println("institute is :"+inst);
		    	
		    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
				 System.out.println("we are going to print the branches of current isntitute :");
				 for (Branch b : branchlist) {
					    System.out.println(b);
					}
					
			
					
				model.addAttribute("BranchesOfInst",branchlist );
	    	}
	        return "Teacher/ModifyInstitueStructure";
	    }
	 
	 
	 @RequestMapping(value = "/GetClassesList/{id}", method = RequestMethod.GET)
	 @ResponseBody
	  public String GetClassesList( @PathVariable("id") int id ){
		 
			System.out.println("from GetClassesList controller");
			
			List<Classes> classList=classesService.getallOfParticularBranch(branchService.find(id));
			String JSON="[{\"value\":0,\"name\":\"--- Select Class---\"},";
			for (Classes c : classList) {
				JSON+="{";
				JSON+="\"value\":"+c.getId()+",";
				JSON+="\"name\":\""+c.getName()+"\"";
				JSON+="},";
			    System.out.println(c);
			}
			JSON=JSON.substring(0, JSON.length() - 1);
			JSON+="]";
			System.out.println(JSON);
			
			
		return JSON;
}
	 
	 
	 @RequestMapping(value="/AddNewDivision",method = RequestMethod.POST)  
	   public String  AddNewDivision(Model model,@ModelAttribute("Division") Division div,@ModelAttribute("teacher") Teacher teacher) {  
	    	
		 
	    	System.out.println("this is AddNewDivision controller");	    	
	    	Classes clas2=classesService.find(div.getClasses().getId());	    	
	    	Division newDiv=new Division(clas2, div.getName());
	    		    	
	    	try{	
	    		divisionService.create(newDiv);	    		
			    	System.out.println("new Division is saved ");
			    	model.addAttribute("SaveSuccessMessage", "New Division is Saved with the name "+newDiv.getName());
			    	
	    	}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("ErrorMessage", "Duplicate entry Name of the Class or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	
			} 
	    	finally {
	    		Branch branch1= new Branch();
				Classes clsess=new Classes();
				Division division =new Division();
				model.addAttribute("Branch", branch1);
				model.addAttribute("Classes", clsess);
				model.addAttribute("Division", division);
	    		Institute inst=teacherService.GetInstitute(teacher.getId());
				System.out.println("institute is :"+inst);
		    	
		    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
				 System.out.println("we are going to print the branches of current isntitute :");
				 for (Branch b : branchlist) {
					    System.out.println(b);
					}
					
			
					
				model.addAttribute("BranchesOfInst",branchlist );
	    	}
	    	 return "Teacher/ModifyInstitueStructure";
	    }

	 
	 @RequestMapping(value="/ViewInstitueStructure",method = RequestMethod.GET)  
	    public String  ViewInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute) {  
	    	
		 
		 String str=teacherService.InstituteStucture(teacher);
				
		 System.out.println(str);
		 model.addAttribute("structure", str);
		 		 
	        return "Teacher/ExistingInstituteStructure";
	    }

	 
	 @RequestMapping("/teacherChangePassword")
	 public String changePasswordShow(Model map) 
	 {
		 String oldPassword = "a", newPassword = "a";
		 map.addAttribute("oldPassword",oldPassword);
		 map.addAttribute("newPassword", newPassword);
		 return "Teacher/changePassword";
	 }

	 
	 @RequestMapping(value="/teacherChangePassword" , method=RequestMethod.POST)
	 public String changePassword(Model map ,@RequestParam("oldPassword") String oldPassword ,@RequestParam("newPassword") String newPassword,@ModelAttribute("teacher") Teacher teacher ) 
	 {
		
		System.out.println(teacher.toString());
		Login login =  teacherService.getLoginIdByEmail(teacher.getEmail());
		System.out.println(login.getId());
		teacher.setLogin(login);
		System.out.println(teacher.getLogin().getId());
		System.out.println(oldPassword+"taking password");
		System.out.println(newPassword+"taking password");
		
		Boolean flag=  teacherService.checkPassword(oldPassword , login.getId());
		
		if(flag)
			teacherService.changePassword(newPassword , login );
		
		 return "Teacher/changePassword";
	 }

	 
	 
	 @RequestMapping(value="/scheduletree",method = RequestMethod.GET)  
	    public String  scheduletree(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute) {  
	    	
	    	System.out.println("this is scheduletree controller");
	    	String str=teacherService.InstituteStuctureForSchedule(teacher);
			Schedule schedule= new Schedule();
					
			 model.addAttribute("structure", str);
			 model.addAttribute("Schedule", schedule);
	    
			
	        return "Teacher/InstStructForSchedule";
	    }

	 
	 
	 @RequestMapping(value = "/GetCalender/{id}", method = RequestMethod.GET)
	 @ResponseBody
	  public String GetCalender( @PathVariable("id") int id ){
		 
		 
			System.out.println("from GetCalender controller and division id is :"+id );		
			Division d=divisionService.find(id);
			System.out.println("division is "+d);
			Schedule schedule= scheduleService.fordivision(id);
			
			System.out.println(schedule);
			String result="";
			try {
				result=schedule.getString();
				
				
			}catch(Exception e)
			{
				result="<div class='alert alert-block alert-danger fade in'>";
				result+="<button data-dismiss='alert' class='close close-sm' type='button'>";
				result+="<i class='icon-remove'></i>";
				result+="</button>";
				result+="<strong>No Calender Saved !</strong> Please save calender for division.";
				result+="</div> ";
			}		
				
			System.out.println(result);
			
			
		return result;
	 }
	 
	 	 	 
	 @RequestMapping(value="/updateDivisionSchedule",method = RequestMethod.POST)  
	    public  String  updateDivisionSchedule(Model model,@ModelAttribute("Schedule") Schedule schedule,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is updateDivisionSchedule controller");
	    	
	    	System.out.println(schedule);
	    	// if the schedule already exist update it 
	    	try { 
	    		
	    		
	    		// get the id of the existing schedule 
	    		Schedule s1=scheduleService.fordivision(schedule.getDivision().getId());
	    		s1.setString(schedule.getString());
	    		
	    		System.out.println("we are updating the record :"+s1);
	    		// update the variable for the calender string 
	    		scheduleService.update(s1);
	    		System.out.println("------------------------schedule is updated------------------------- ");
	    		model.addAttribute("SaveSuccessMessage", "Schedule Updated for the division");
	    	
	    	}catch(Exception e)
	    	{
	    		
	    		System.out.println("shcedule do not exist for this division creating new ");
	    		try {
	    			
	    			System.out.println("finding the division of the schedule with the id :"+schedule.getDivision().getId());
	    			
	    			Division d=divisionService.find(schedule.getDivision().getId());
	    			
	    			System.out.println("------devision is :"+d);
	    			schedule.setDivision(d);
	    			System.out.println("we are going to create the new shcedule");
	    			System.out.println("we aer about to save the :"+schedule );
	    			scheduleService.create(schedule);
	    			
	    			System.out.println("------------------------schedule is saved------------------------- ");
	    			 model.addAttribute("SaveSuccessMessage", "Schedule created for the  division");
	    			
	    		}catch(Exception e1)
	    		{
	    			
	    		 model.addAttribute("ErrorMessage", "error in saving Schedule for the division");
	    		 System.out.println("------------------------error in schedule creation------------------------- ");
	    		}
	    	}
	    	
			Schedule schedule2= new Schedule();
			String str=teacherService.InstituteStuctureForSchedule(teacher);
					
			 model.addAttribute("structure", str);
			 model.addAttribute("Schedule", schedule2);
	    
			
	        return "Teacher/InstStructForSchedule";
	    }
	 
	 
	 @RequestMapping(value="/updateDivisionScheduleService",method = RequestMethod.POST)  
	    public    String  updateDivisionScheduleService(@RequestBody Schedule schedule, HttpServletRequest request,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is updateDivisionScheduleService controller");
	    	
	    	String result="";
	    	
	    	try {
	    		
	    	scheduleService.update(schedule);
	    	System.out.println("shcedule updated successfully");
	    	result="shcedule updated successfully";
	    	
	    	
	    	}catch(Exception e)
	    	{
	    		System.out.println("error in chedule update");
	    		result="error in updating shcedule";
	    		
	    		
	    	}
	    	
			    
			
	        return result;
	    }
}
