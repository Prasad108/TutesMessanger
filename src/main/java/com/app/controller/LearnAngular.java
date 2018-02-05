package com.app.controller;

import java.util.List;

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
	

	@RequestMapping(value="/angular",method = RequestMethod.GET)  
	 public String angular(){
		 System.out.println("**********inside angular controller**********");
	    return "template/angular";  	
	    }
	
	@RequestMapping(value="/angular/hhtp1",method = RequestMethod.GET)  
	 public String angularhhtp1(){
		 System.out.println("**********inside angularhhtp1 controller**********");
	    return "template/angular/hhtp1";  	
	    }
		
	
	
	@RequestMapping(value="/angular/role",method = RequestMethod.GET)  
	 public String angularrole(Model model){
		 System.out.println("**********inside angularrole controller**********");
		 			 
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
		 System.out.println("**********inside angular/role/GetRoles controller**********");
		 List<Role> roleList=roleService.getall();			
		 Gson gson = new Gson();				
		 String JSON_RolesList= gson.toJson(roleList);	
		 System.out.println(JSON_RolesList);
	    return JSON_RolesList;  	
	    }
		
	@Secured("permitAll")
	@RequestMapping(value="/angular/saveRole",method = RequestMethod.POST)  
	 @ResponseBody public String saveRole(@RequestBody Role role){
		 System.out.println("**********inside angular/role/saveRole controller**********");
		 System.out.println(role);
		 String result="";
		 try {
		 roleService.create(role);
		 result="object is saved";
		 System.out.println("object is saved");
		 }catch(Exception e) {
			 result="object is not saved";	
			 System.out.println("error in object saving");
		 }	
		 
		 Role r=roleService.findByName(role.getName());
		 System.out.println("saved role is "+r);
		 
		 Gson gson = new Gson();
		 result=gson.toJson(r);
		 System.out.println("saved object in json "+result);
	    return result;  	
	    }
	
	@Secured("permitAll")
	 @RequestMapping(value = "/angular/deleteRole/{id}", method = RequestMethod.POST)
	 @ResponseBody
	  public String deleteRole( @PathVariable("id") int id ){
		 
			System.out.println("**********from /angular/deleteRole/{id} controller**********");
			
			String result="";
			
			
				
			System.out.println("object to be deleted is with id"+id);
			if(id>5)
			{
				roleService.delet(id);
				System.out.println("Role is deleted with the id "+id);
				result="{\"message\":\"Role with id "+id+" is deleted \"}";
			}else {
				result="{\"message\":\"Role is important ie.cannot be deleted\"}";
				System.out.println(" This is imp role -cannot be deleted or some other error");
			}
			
			System.out.println(result);
		return result;
}
	 
	@Secured("permitAll")
	 @RequestMapping(value="/angular/UpdateRole",method = RequestMethod.POST)  
	 @ResponseBody public String updatRole(@RequestBody Role role){
		 System.out.println("**********inside angular/role/updatRole controller**********");
		 System.out.println(role);
		 String result="";
		 try {
			 
			 if(role.getId()>5)
			 {
				 roleService.update(role);
				 result="{\"message\":\"Role :"+role+"is updated \"}";
				 System.out.println("Role is updated");
			 }else {
				 result="{\"message\":\"Role :"+role+"is cannot be updated as it is important to APP \"}";
				 System.out.println("cannot update srole imp role ");
			 }
		
		 }catch(Exception e) {
			 result="{\"message\":\"Role is important ie.cannot be updated\"}";
			 System.out.println("error in object saving");
		 }	
		 
		System.out.println(result);
	    return result;  	
	    }


}
