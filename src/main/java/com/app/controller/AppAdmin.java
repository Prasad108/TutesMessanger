package com.app.controller;

import java.util.Map;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.pojo.Institute;
import com.app.service.InstituteService;

@Controller
public class AppAdmin {

	
	
	@Autowired
	InstituteService instituteService;

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
			try{
				instituteService.create(inst);
				model.addAttribute("Message", "institute Saved");
		    	System.out.println("institue saved");
			}
			catch(ConstraintViolationException e)
			{
				model.addAttribute("ErrorMessage", "Duplicate entry Name of the enistitute already exist");
		    	System.out.println("duplicate key unique key voilation");
			}
			
		    map.put("instituteList", instituteService.getall());
			String output="appAdmin/addInstitute";
			
	        return output;  
	    }
	  
}
