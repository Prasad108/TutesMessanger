package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.DAO.iml.saveStudent;
import com.app.pojo.Institute;
import com.app.pojo.Login;


import com.app.pojo.Teacher;



@Controller
public class HelloController {
	
	@Autowired
	saveStudent save;
	
	@RequestMapping("/hello")  
    public ModelAndView helloWorld() {  
  
		System.out.println("this is from hello controller");
		
		
		
		
		Teacher t= new Teacher("Prasad", "Dukale", "pdukale9@gmail.com", "9657939975");
		save.saveTeacher(1, "Prasad", "Dukale", t);
		
		Login l= new Login("Prasad", "Dukale");
		int i=save.findlogin(l);
		
		System.out.println("teacher saved");
	    String message = "";  
		if(i>0)
		{
			message+="teacher saved";
		}
		else {
			message+="error teacher not saved ";
		}
		
    
        return new ModelAndView("hello", "message", message);  
    }  
}
