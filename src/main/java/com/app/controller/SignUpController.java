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
import com.app.pojo.Parent;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Teacher;
import com.app.pojo.Student;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.ParentService;
import com.app.service.PermissionsService;
import com.app.service.RoleService;
import com.app.service.TeacherService;
import com.app.service.StudentService;

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
	
	@Autowired
	StudentService StudentService;
	
	@Autowired
	ParentService parentService;
	
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
    	List<Institute> institutelist =	instituteService.getall();
    	model.addAttribute("institutelist",institutelist);
		
        return "signup/StudentSignUpForm";  
    }

    @Transactional
    @RequestMapping(value="/SaveStudent",method = RequestMethod.POST)  
    public String  SaveStudent(Model model,@ModelAttribute("Student") Student student) {  
    	
    	System.out.println("**********this is SaveStudent controller**********");  
    	
    	String result="";
    	try
		{
    	
    	System.out.println("student is "+student);
    	
    	Role r= RoleService.findByName("ROLE_STUDENT"); // got the role of institute admin 	
    	
    	// created the object of login with username as email-id and pwd as contact no
    	Login login= new Login(r,student.getEmail(),student.getContactno());
    	// save login credentials    
    	loginService.create(login);    
    	
    	Institute i= instituteService.find(student.getInstitute().getId());
    	
    	student.getParent().setFname(student.getFather());
    	student.getParent().setLname(student.getLname());
    	
    	student.setLogin(login);
    	student.setInstitute(i);
    	
    	Parent p=student.getParent();
    	
    	parentService.create(p);
    			student.setParent(p);  	
    	StudentService.create(student);
    	
    	System.out.println("student created");
    	
    	model.addAttribute("SuccessMessage","Student Saved succesffully. Please wait till Institute sanctions your account");
    	
    	result="signup/SaveStudentResult";
    	
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println(e);
			System.out.println("error in saving student ");
			model.addAttribute("ErrorMessage","Error in Saaving Student...!!!");
			result="signup/SaveStudentResult";
		}
    		
        return result;  
    }

}