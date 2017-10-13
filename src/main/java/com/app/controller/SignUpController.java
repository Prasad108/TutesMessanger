package com.app.controller;

 

 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Teacher;
import com.app.pojo.Student;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.PermissionsService;
import com.app.service.RoleService;
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

	@Autowired
	RoleService RoleService;
	
	@Autowired
	PermissionsService permissionsService;
	
	@RequestMapping(value="/SignUp",method = RequestMethod.GET)  
    public String  SignUp(Model model ) {  
    	
    	System.out.println("**********this is SignUp controller**********");
    	
        return "signup/Choice";	
    }
	
    
    
    @RequestMapping(value="/RegisterTeacher",method = RequestMethod.GET)  
    public String  RegisterTeacher(Model model) {  
    	
    	System.out.println("**********this is Register Teacher controller**********");     
    	Teacher t= new Teacher();
    	model.addAttribute("Teacher", t);    	
    	List<Institute> teacherlist =	instituteService.getall();
    	model.addAttribute("teacherlist",teacherlist);
    //	model.put("inf", teacherlist);
    	System.out.println("institutes"+teacherlist.toString());

		
        return "signup/addTeacher";  
    }
    
    @Transactional
    @RequestMapping(value="/SaveTeacher",method = RequestMethod.POST)  
    public String  SaveTeacher(Model model,@ModelAttribute("Teacher") Teacher teacher) {  
    	
    	
    	
    	System.out.println("**********this is save Teacher controller**********"); 
    	    	
    	Role r= RoleService.findByName("ROLE_TEACHER"); // got the role of institute admin 		   
    	
    	// created the object of login with username as email-id and pwd as contact no
    	Login login= new Login(r,teacher.getEmail(), teacher.getContactno()); 
    	// save login credentials    
    	loginService.create(login);     	
    	
    	Institute i= instituteService.find(teacher.getInstitute().getId());
    			    	
    	Teacher teach= new Teacher(teacher.getFname(), teacher.getLname(), teacher.getEmail(), teacher.getContactno());
    	teach.setInstitute(i);             //set institute
    	teach.setLogin(login);             //set Login
    //	teach.setPermissions(permissions); //set permissions
    	teacherService.create(teach);      //create teacher
		
		model.addAttribute("msg", "user is registerd wait till approval");
        return "login";  
    }
	
	
	
    @RequestMapping(value="/RegisterStudent",method = RequestMethod.GET)  
    public String  RegisterStudent(Model model) {  
    	
    	System.out.println("**********this is RegisterStudent controller**********");  
    	Student s= new Student();
    	model.addAttribute("Student", s);    	
		
        return "signup/StudentSignUpForm";  
    }


}