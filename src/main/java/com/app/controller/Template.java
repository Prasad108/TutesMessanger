package com.app.controller;


import java.lang.reflect.Modifier;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.app.pojo.Role;
import com.app.service.RoleService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



@Controller
public class Template {
	
	
	@Autowired
	RoleService roleService;
	
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
	
	/*@RequestMapping(value="/login",method = RequestMethod.GET)  
	 public String login(){
		 System.out.println("inside login controller");
	    return "template/login";  	
	    }*/
	
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
	
	
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,HttpSession session,Model model) {
		System.out.println("*************** This is login controller **********************");

			
		if (error != null) {
			System.out.println("Invalid username and password!");
			model.addAttribute("error", "Invalid username and password!");
		}

		 if (logout != null) {
			System.out.println("You've been logged out successfully.");
			model.addAttribute("msg", "You've been logged out successfully.");
			model.asMap().clear();
			    session.invalidate();
			    model.asMap().clear();
		}		
		 
		/*model.setViewName("login");*/

		return "login";

	}
	
	
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,HttpSession session,Model model) {
		System.out.println("*************** This is logout controller **********************");

		
			System.out.println("You've been logged out successfully.!!!");
			model.addAttribute("msg", "You've been logged out successfully.");
			model.asMap().clear();
			    session.invalidate();
			    model.asMap().clear();
				
		return "login";

	}
	
	
	}













