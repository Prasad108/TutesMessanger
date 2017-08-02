package com.app.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Teacher;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.PermissionsService;
import com.app.service.TeacherService;
import com.app.service.RoleService;

@Controller
@SessionAttributes({"addInstitute"})
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
	    
	

	    @Transactional
	    @RequestMapping(value="/SaveInstituteAdmin",method = RequestMethod.POST)  
	    public String  SaveInstituteAdmin(Model model,@ModelAttribute("addInstitute") Institute inst ,@ModelAttribute("Teacher") Teacher teacher ) {  
	    	 
	    	System.out.println("this is SaveInstituteAdmin controller");
	    	String output="appAdmin/";   	 
			try{		
				
				// save institute 
				instituteService.create(inst);	
				model.addAttribute("SuccessMessage", "institute Saved"); 
		    	System.out.println("institue saved");
		    	
		    	
		    	
		    	Role r= RoleService.findByName("institute admin"); // got the role of institute admin 		    	System.out.println(r);
		    	
		    	// created the object of login with username as emailid and pwd as contact no
		    	Login login= new Login(r,teacher.getEmail(), teacher.getContactno()); 
		    	// save login credentials    
		    	loginService.create(login);   
		    	
		    	
		    	//create permission for admin he has all the permissions and SAVE them
		    	Permissions permissions= new Permissions(true, true, true, true, true, true, true, true, true, true, true, true); 
		    	permissionsService.create(permissions);
		    	
		    	Institute i= instituteService.find(inst.getName());
		    			    	
		    	Teacher teach= new Teacher(teacher.getFname(), teacher.getLname(), teacher.getEmail(), teacher.getContactno());
		    	teach.setInstitute(i);
		    	teacherService.create(teach);
		    	
		    	ArrayList<Institute> Institutelist= new ArrayList<Institute>();
				Institutelist.addAll(instituteService.getall());
				model.addAttribute("listOfInstitute", Institutelist);
				output+="ExistingInstitutes";
			}
			catch(Exception e)
			{
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
		        return "appAdmin/ExistingInstitutes";			
	} 
	    
	   
	  
}
