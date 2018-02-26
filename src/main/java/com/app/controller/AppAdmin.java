package com.app.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Branch;
import com.app.pojo.Exam;
import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Subject;
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
	
	Gson gson =new Gson();
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
	
	
	
	
	 @RequestMapping(value="/",method = RequestMethod.GET)  
	    public    String  appAdminDashboard() {  
	    	
	    	System.out.println("*************this is /appAdmin/dashboard controller*********************");	    		    				
	        return "appAdmin/index";
	    }
	
	    
	    
	    
	   
	    	
	    
	    @RequestMapping(value="/SaveInstituteAdminInstitute",consumes=MediaType.APPLICATION_JSON_VALUE,method = RequestMethod.POST)
	    @ResponseBody
	    public ResponseEntity SaveInstituteAdmin(@RequestBody com.app.pojo.composit.InstituteNameAdminName instadmin,Model model) {  
	    	 
	    	System.out.println("**********this is SaveInstituteAdmin controller**********");
	    	ResponseEntity output; 
	    	Institute inst=new Institute();
	    	inst.setAddress(instadmin.getInstAddress());
	    	inst.setEmail(instadmin.getInstEmail());
	    	
	    	inst.setName(instadmin.getInstName());
	    	inst.setSubscriptionTill(instadmin.getInstSubscriptionTill());
	    	inst.setContactno(instadmin.getInstContactNo());
	    	Teacher teacher=new Teacher(instadmin.getAdminName(),instadmin.getAdminSurname(),instadmin.getAdminEmail(),instadmin.getAdminContactNo());
	    	
			try{	
				
				//call to the service which creates the institute with its Admin, uid-pwd and permissions
				appAdminService.AddInstituteWithAdmin(inst, teacher);
				
		    
				output=new ResponseEntity(HttpStatus.OK);
				
			}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				
		    	System.out.println("duplicate key unique key voilation");
		    	//e.printStackTrace();
		    	output=new ResponseEntity(HttpStatus.FAILED_DEPENDENCY);
			}   	
			
			
	        return output;  
	    }
	    
	 
	    @RequestMapping(value="/GetExistingInstitutes",method=RequestMethod.GET,produces="application/json")
	    @ResponseBody
		public String ExistingInstitutes1()
		{
	    	ArrayList<Institute> Institutelist= new ArrayList<Institute>();
			Institutelist.addAll(instituteService.getall());
		
			Institute inst= new Institute();
		
	    	System.out.println("**********this is from AppAdmin/GetAllInstitute controller**********");
		
			String response=gson.toJson(Institutelist);
		
			return response;
		}  
	    
	    
	    
	    
	    @RequestMapping(value="/updateInstitute",consumes=MediaType.APPLICATION_JSON_VALUE,method = RequestMethod.POST)
	    @ResponseBody
	    public String  updateInstitute(@RequestBody Institute inst,Model model) {  			
	    	
	    
				System.out.println("**********this is from updateInstitute controller**********");	
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
		        return gson.toJson(inst);			
	} 
	   
	  
	    
	    	
}
