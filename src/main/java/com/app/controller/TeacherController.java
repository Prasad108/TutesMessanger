package com.app.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Teacher;
import com.app.service.BranchService;
import com.app.service.LoginService;

@Controller
@SessionAttributes({ "teacher", "appAdmin", "student" })
public class TeacherController {
	
	@Autowired
	BranchService branchService;
	
	
	 @RequestMapping(value="/ModifyInstitueStructure",method = RequestMethod.GET)  
	    public String  ModifyInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is ModifyInstitueStructure controller");
	    			
			Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
			
			 List <Branch> branchlist=branchService.getallOfParticularInstitute(teacher.getInstitute().getId());
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
				
		
				
			model.addAttribute("BranchesOfInst",branchlist );
			
	        return "Teacher/ModifyInstitueStructure";
	    }
	       
	 
	 
	 @RequestMapping(value="/AddNewBranch",method = RequestMethod.POST)  
	    public String  AddNewBranch(Model model,@ModelAttribute("Branch") Branch branch,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is AddNewBranch controller");
	    	branch.setInstitute(teacher.getInstitute());
	    	
	    	branchService.create(branch);
	    	System.out.println("new Branch is saved ");
	    				
	        return "Teacher/ExistingInstituteStructure";
	    }

}
