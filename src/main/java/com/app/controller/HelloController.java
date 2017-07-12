package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.DAO.iml.saveStudent;
import com.app.pojo.Student;



@Controller
public class HelloController {
	
	@Autowired
	saveStudent save;
	
	@RequestMapping("/hello")  
    public ModelAndView helloWorld() {  
  
		System.out.println("this is from hello controller");
		
		Student s= new Student("Prasad", "dukale");
		int i= save.save(s);
	    String message = "";  
		if(i>0)
		{
			message+="Student saved";
		}
		else {
			message+="error student not saved ";
		}
		
    
        return new ModelAndView("hello", "message", message);  
    }  
}
