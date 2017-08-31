package com.app.controller;

 

 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Role;
import com.app.pojo.Teacher;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.TeacherService;

@Controller
@SessionAttributes({ "teacher", "institute" })
public class SignUpController {

	@Autowired
	LoginService loginService;

	@Autowired
	TeacherService teacherService;

	@Autowired
	InstituteService instituteService;


	
	@RequestMapping(value="/SignUp",method = RequestMethod.GET)  
    public String  SignUp(Model model ) {  
    	
    	System.out.println("this is SignUp controller");
    	
        return "signup/Choice";	
    }
	
    
    
    @RequestMapping(value="/RegisterTeacher",method = RequestMethod.GET)  
    public String  RegisterTeacher(Model model) {  
    	
    	System.out.println("this is Register Teacher controller");     
    	Teacher t= new Teacher();
    	model.addAttribute("Teacher", t);    	
    	List<Institute> teacherlist =	instituteService.getall();
    	model.addAttribute("teacherlist",teacherlist);
    //	model.put("inf", teacherlist);
    	System.out.println("institutes"+teacherlist.toString());

		
        return "signup/addTeacher";  
    }
    @RequestMapping(value="/SaveTeacher",method = RequestMethod.POST)  
    public String  SaveTeacher(Model model,@ModelAttribute("Teacher") Teacher teach) {  
    	
    	System.out.println("this is save Teacher controller");     
   
		System.out.println(""+teach);
        return "signup/demo";  
    }
	
	
	
	


}