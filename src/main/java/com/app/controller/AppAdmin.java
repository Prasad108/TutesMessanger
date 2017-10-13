package com.app.controller;


import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Institute;
import com.app.pojo.Teacher;
import com.app.service.AppAdminService;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.PermissionsService;
import com.app.service.TeacherService;
import com.app.service.RoleService;

@Controller
@SessionAttributes({"addInstitute"})
@RequestMapping("/AppAdmin")
public class AppAdmin {
		
	@Autowired
	InstituteService instituteService;
	
	@Autowired
	RoleService RoleService;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	PermissionsService permissionsService;

	@Autowired
	AppAdminService appAdminService; 
	
	
	
	
	 @RequestMapping(value="/dashboard",method = RequestMethod.GET)  
	    public    String  appAdminDashboard() {  
	    	
	    	System.out.println("*************this is /appAdmin/dashboard controller*********************");	    		    				
	        return "appAdmin/dashboard";
	    }
	
	    @RequestMapping(value="/AddNewInstitute",method = RequestMethod.GET)  
	    public String  AddNewInstitute(Model model) {  
	    	
	    	System.out.println("this is AddNewInstitute controller");
	    	Institute inst= new Institute();
	    	model.addAttribute("Institute", inst);
			String output="appAdmin/AddNewInstitute";
			
	        return output;  
	    }
	    
	    
	    @RequestMapping(value="/RegisterInstitute",method = RequestMethod.POST)  
	    public String  RegisterInstitute(Model model,@ModelAttribute("Institute") Institute inst ) {  
	    	
	    	System.out.println("this is RegisterInstitute controller");
	    	String output="appAdmin/CreateInstituteAdmin";
	    	System.out.println(inst);
	    	model.addAttribute("addInstitute", inst);
	    	Teacher t= new Teacher();
	    	model.addAttribute("Teacher", t);
	    	
			System.out.println("redirecting to the page: "+ output );
			
	        return output;  
	    }
	    	
	    
	    @RequestMapping(value="/SaveInstituteAdmin",method = RequestMethod.POST)  
	    public String  SaveInstituteAdmin(Model model,@ModelAttribute("addInstitute") Institute inst ,@ModelAttribute("Teacher") Teacher teacher ) {  
	    	 
	    	System.out.println("this is SaveInstituteAdmin controller");
	    	String output="appAdmin/";   	 
			try{	
				
				//call to the service which creates the institute with its Admin, uid-pwd and permissions
				appAdminService.AddInstituteWithAdmin(inst, teacher);
				
		    	model.addAttribute("SuccessMessage", "institute Saved with It's Admin"); 
		    	
		    	// add the existing institute into list ans show it on the 
		    	ArrayList<Institute> Institutelist= new ArrayList<Institute>();
				Institutelist.addAll(instituteService.getall());
				model.addAttribute("listOfInstitute", Institutelist);
				Institute inst1= new Institute();
				model.addAttribute("Institute", inst1);
				output+="ExistingInstitutes";
				
			}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("ErrorMessage", "Duplicate entry Name of the Institute or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	output+="AddNewInstitute";
			}   	
			
				
	        return output;  
	    }
	    
	
	    @RequestMapping(value="/ExistingInstitutes",method = RequestMethod.GET)  
	    public String  ExistingInstitutes(Model model) {  			
				System.out.println("this is from AppAdmin/GoToAddInstitute controller");		
				ArrayList<Institute> Institutelist= new ArrayList<Institute>();
				Institutelist.addAll(instituteService.getall());
				model.addAttribute("listOfInstitute", Institutelist);
				Institute inst= new Institute();
				model.addAttribute("Institute", inst);
		        return "appAdmin/ExistingInstitutes";			
	} 
	    
	    @RequestMapping(value="/updateInstitute",method = RequestMethod.POST)  
	    public String  updateInstitute(Model model,@ModelAttribute("Institute") Institute inst) {  			
	    	
	    	System.out.println(inst);
				System.out.println("this is from updateInstitute controller");	
				Institute inst1=instituteService.find(inst.getId());
				inst.setEnable(inst1.getEnable());
				inst.setSubscritionEnable(inst1.getSubscritionEnable());
				instituteService.update(inst);
				System.out.println("institute is updated");
				
				ArrayList<Institute> Institutelist= new ArrayList<Institute>();
				Institutelist.addAll(instituteService.getall());
				model.addAttribute("listOfInstitute", Institutelist);
				Institute inst2= new Institute();
				model.addAttribute("Institute", inst2);
				model.addAttribute("SuccessMessage", "institute updated successfully");
		        return "appAdmin/ExistingInstitutes";			
	} 
	   
	  
	    
	    	
}
