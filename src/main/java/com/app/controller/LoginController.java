package com.app.controller;

import java.util.Map;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.app.DAO.iml.saveStudent;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Role;
import com.app.pojo.Teacher;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

//

@Controller
public class LoginController {
	
	@Autowired
	saveStudent save;
	
	@Autowired
	LoginService loginService;
	

	@Autowired
	InstituteService instituteService;
	
	 @RequestMapping(value="/gologin",method = RequestMethod.GET)  
	 public String goToLogin(Model mod,Login l){
		 mod.addAttribute("Login",l);
		 System.out.println("inside gologin controller");
		 
	    return "login";
	    	
	    }
	  
	
	
	  @RequestMapping(value="/Checklogin",method = RequestMethod.POST)  
    public String  login(Model model,@ModelAttribute("login") Login login,Login l) {  
  
		System.out.println("this is from Checklogin controller");
		System.out.println("login credentials are "+login.toString());
		String output="";
		if(loginService.exist(login))
		{
			System.out.println("**********such a user exists ");
			Login userLogin=loginService.find_By_Uname_pwd(login);
			Role userRole=userLogin.getRole();
			int roleId=userRole.getId();
			switch (roleId) {
				case 1:output="hello";//student
				System.out.println("student logged in");
					break;
				case 2:output="Teacher/home";//teacher
				System.out.println("teacher logged in");
					break;
				case 3:output="appAdmin/dashboard";//** institute admin
					System.out.println("institute admin logged in");
					break;
				case 4:output="appAdmin/dashboard";//app Admin
					System.out.println("admin logged in");
					break;
				case 5:output="template/index";//app Admin
				System.out.println("template logged in");
				break;
				default:model.addAttribute("message", login.toString());
					System.out.println("error in login incorect role logged in");	
					output="hello";
					break;
			}		
		}
		else {
			System.out.println("**************no such a user");
			
			model.addAttribute("ErrorMessage", "Username or Password incorrect");
			 model.addAttribute("Login",l);
			output="login";
		}
        return output;  
    }  
	  
	 
	  
}

//comment by rahul pr