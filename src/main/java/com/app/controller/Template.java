package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.pojo.Login;

@Controller
public class Template {
	
	@RequestMapping(value="/index",method = RequestMethod.GET)  
	 public String templateIndex(){
		 System.out.println("inside index controller");
	    return "template/index";	
	    }
	
	@RequestMapping(value="/404",method = RequestMethod.GET)  
	 public String errorPage(){
		 System.out.println("inside 404 controller");
	    return "template/404";	
	    }
	
	@RequestMapping(value="/basic_table",method = RequestMethod.GET)  
	 public String basic_table(){
		 System.out.println("inside basic_table controller");
	    return "template/basic_table";
	    }
	
	@RequestMapping(value="/buttons",method = RequestMethod.GET)  
	 public String buttons(){
		 System.out.println("inside buttons controller");
	    return "template/basic_table";  	
	    }
	
	@RequestMapping(value="/chart-chartjs",method = RequestMethod.GET)  
	 public String chartchartjs(){
		 System.out.println("inside chart-chartjs controller");
	    return "template/chart-chartjs";  	
	    }
	
	@RequestMapping(value="/form_component",method = RequestMethod.GET)  
	 public String form_component(){
		 System.out.println("inside form_component controller");
	    return "template/form_component";  	
	    }
	
	@RequestMapping(value="/form_validation",method = RequestMethod.GET)  
	 public String form_validation(){
		 System.out.println("inside form_validation controller");
	    return "template/form_validation";  	
	    }
	
	@RequestMapping(value="/general",method = RequestMethod.GET)  
	 public String general(){
		 System.out.println("inside general controller");
	    return "template/general";  	
	    }
	
	@RequestMapping(value="/grids",method = RequestMethod.GET)  
	 public String grids(){
		 System.out.println("inside grids controller");
	    return "template/grids";  	
	    }
	
	@RequestMapping(value="/login",method = RequestMethod.GET)  
	 public String login(){
		 System.out.println("inside login controller");
	    return "template/login";  	
	    }
	
	@RequestMapping(value="/profile",method = RequestMethod.GET)  
	 public String profile(){
		 System.out.println("inside profile controller");
	    return "template/profile";  	
	    }
	
	@RequestMapping(value="/blank",method = RequestMethod.GET)  
	 public String blank(){
		 System.out.println("inside widgets controller");
	    return "template/blank";  	
	    }
	
	@RequestMapping(value="/widgets",method = RequestMethod.GET)  
	 public String widgets(){
		 System.out.println("inside widgets controller");
	    return "template/widgets";  	
	    }
	
	

}
