package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	

	
	@RequestMapping("/hello")  
    public ModelAndView helloWorld() {  
  
		System.out.println("this is from hello controller");
        String message = "WELCOME SPRING MVC";  
        return new ModelAndView("hello", "message", message);  
    }  
}
