package com.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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



@Controller
public class HelloController {
	
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
			if(userRole.getId()==4)
			{
				output="appAdmin/dashboard";
			}
			else{
				model.addAttribute("message", login.toString());
				output="hello";
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
	  
	  
	  
	  //***********************app Admin******************
	  
	  @RequestMapping(value="/GoToAddInstitute",method = RequestMethod.GET)  
	    public String  goToAddInstitute(Model model,Institute inst,Map<String,Object> map) {  
		  model.addAttribute("Institute",inst);
		  
	  
			System.out.println("this is from AppAdmin/GoToAddInstitute controller");
			map.put("instituteList", instituteService.getall());
			
			String output="appAdmin/addInstitute";
			
	        return output;  
	    }  
	    
	    @RequestMapping(value="/RegisterInstitute",method = RequestMethod.POST)  
	    public String  RegisterInstitute(Model model,@ModelAttribute("Institute") Institute inst,Map<String,Object> map) {  
	    	
	    	System.out.println("this is RegisterInstitute controller");
			
			System.out.println(inst);
			instituteService.create(inst);
			model.addAttribute("Message", "institute Saved");
			map.put("instituteList", instituteService.getall());
			String output="appAdmin/addInstitute";
			
	        return output;  
	    }
	  
}
