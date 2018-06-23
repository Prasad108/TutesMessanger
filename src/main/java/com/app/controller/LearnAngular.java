package com.app.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Classes;
import com.app.pojo.Role;
import com.app.service.RoleService;
import com.google.gson.Gson;

@Controller
@SessionAttributes({ "teacher"})
public class LearnAngular {
	
	@Autowired
	RoleService roleService;
	
	private static final Logger LOGGER = Logger.getLogger(LearnAngular.class);
	
	@RequestMapping(value="/angular",method = RequestMethod.GET)  
	 public String angular(){
		 LOGGER.info("**********inside angular controller**********");
	    return "template/angular";  	
	    }
	
	@RequestMapping(value="/angular/hhtp1",method = RequestMethod.GET)  
	 public String angularhhtp1(){
		 LOGGER.info("**********inside angularhhtp1 controller**********");
	    return "template/angular/hhtp1";  	
	    }
		
	
	
	@RequestMapping(value="/angular/role",method = RequestMethod.GET)  
	 public String angularrole(Model model){
		 LOGGER.info("**********inside angularrole controller**********");
		 			 
		 List<Role> roleList=roleService.getall();		
		 Gson gson = new Gson();				
		 String JSON_RolesList= gson.toJson(roleList);	
		 model.addAttribute("roleList", JSON_RolesList);			
		 Role r=new Role(1, "student");
		 model.addAttribute("role", r);		 
	    return "template/angular/role";  	
	    }

	@RequestMapping(value="/angular/getRoles",method = RequestMethod.GET)  
	 @ResponseBody public String angularGetRoles(){
		 LOGGER.info("**********inside angular/role/GetRoles controller**********");
		 List<Role> roleList=roleService.getall();			
		 Gson gson = new Gson();				
		 String JSON_RolesList= gson.toJson(roleList);	
		 LOGGER.info(JSON_RolesList);
	    return JSON_RolesList;  	
	    }
		
	@Secured("permitAll")
	@RequestMapping(value="/angular/saveRole",method = RequestMethod.POST)  
	 @ResponseBody public String saveRole(@RequestBody Role role){
		 LOGGER.info("**********inside angular/role/saveRole controller**********");
		 LOGGER.info(role);
		 String result="";
		 try {
		 roleService.create(role);
		 result="object is saved";
		 LOGGER.info("object is saved");
		 }catch(Exception e) {
			 result="object is not saved";	
			 LOGGER.info("error in object saving");
		 }	
		 
		 Role r=roleService.findByName(role.getName());
		 LOGGER.info("saved role is "+r);
		 
		 Gson gson = new Gson();
		 result=gson.toJson(r);
		 LOGGER.info("saved object in json "+result);
	    return result;  	
	    }
	
	@Secured("permitAll")
	 @RequestMapping(value = "/angular/deleteRole/{id}", method = RequestMethod.POST)
	 @ResponseBody
	  public String deleteRole( @PathVariable("id") int id ){
		 
			LOGGER.info("**********from /angular/deleteRole/{id} controller**********");
			
			String result="";
			
			
				
			LOGGER.info("object to be deleted is with id"+id);
			if(id>5)
			{
				roleService.delet(id);
				LOGGER.info("Role is deleted with the id "+id);
				result="{\"message\":\"Role with id "+id+" is deleted \"}";
			}else {
				result="{\"message\":\"Role is important ie.cannot be deleted\"}";
				LOGGER.info(" This is imp role -cannot be deleted or some other error");
			}
			
			LOGGER.info(result);
		return result;
}
	 
	@Secured("permitAll")
	 @RequestMapping(value="/angular/UpdateRole",method = RequestMethod.POST)  
	 @ResponseBody public String updatRole(@RequestBody Role role){
		 LOGGER.info("**********inside angular/role/updatRole controller**********");
		 LOGGER.info(role);
		 String result="";
		 try {
			 
			 if(role.getId()>5)
			 {
				 roleService.update(role);
				 result="{\"message\":\"Role :"+role+"is updated \"}";
				 LOGGER.info("Role is updated");
			 }else {
				 result="{\"message\":\"Role :"+role+"is cannot be updated as it is important to APP \"}";
				 LOGGER.info("cannot update srole imp role ");
			 }
		
		 }catch(Exception e) {
			 result="{\"message\":\"Role is important ie.cannot be updated\"}";
			 LOGGER.info("error in object saving");
		 }	
		 
		LOGGER.info(result);
	    return result;  	
	    }


}
