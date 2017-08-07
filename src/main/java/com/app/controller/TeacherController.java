package com.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Teacher;
import com.app.service.BranchService;
import com.app.service.ClassesService;
import com.app.service.DivisionService;
import com.app.service.LoginService;
import com.app.service.TeacherService;

@Controller
@SessionAttributes({ "teacher", "appAdmin", "student" })
public class TeacherController {
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	ClassesService classesService;
	
	@Autowired
	DivisionService divisionService;
	
	
	 @RequestMapping(value="/ModifyInstitueStructure",method = RequestMethod.GET)  
	    public String  ModifyInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("this is ModifyInstitueStructure controller");
	    			
			Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
			Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
			
			 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current isntitute :");
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
	 
	 

	 @RequestMapping(value="/AddNewClass",method = RequestMethod.POST)  
	    public String  AddNewClass(Model model,@ModelAttribute("Classes") Classes clas,@ModelAttribute("teacher") Teacher teacher) {  
	    	
		 
	    	System.out.println("this is AddNewClass controller");
	    	String output="Teacher/";
	    	
	    	Branch branch= branchService.find(clas.getBranch().getId()) ;
	    	Classes c=new Classes(branch, clas.getName());
	    	try{	
			    	classesService.create(c);	    		
			    	System.out.println("new Classes is saved ");
			    	output+="ExistingInstituteStructure";
	    	}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("duplicateClassErrorMessage", "Duplicate entry Name of the Class or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	output+="ModifyInstitueStructure";
			}   		
	        return output;
	    }
	 
	 
	 @RequestMapping(value = "/GetClassesList/{id}", method = RequestMethod.GET)
	 @ResponseBody
	  public String RemoveProductFromCart( @PathVariable("id") int id ){
		 
			System.out.println("from GetClassesList controller");
			
			List<Classes> classList=classesService.getallOfParticularBranch(branchService.find(id));
			String JSON="[{\"value\":0,\"name\":\"--- Select Class---\"},";
			for (Classes c : classList) {
				JSON+="{";
				JSON+="\"value\":"+c.getId()+",";
				JSON+="\"name\":\""+c.getName()+"\"";
				JSON+="},";
			    System.out.println(c);
			}
			JSON=JSON.substring(0, JSON.length() - 1);
			JSON+="]";
			System.out.println(JSON);
			
			
		return JSON;
}
	 

	 @RequestMapping(value="/AddNewDivision",method = RequestMethod.POST)  
	    public String  AddNewDivision(Model model,@ModelAttribute("Division") Division div) {  
	    	
		 
	    	System.out.println("this is AddNewDivision controller");
	    	String output="Teacher/";
	    	
	    	Branch branch= branchService.find(div.getClasses().getBranch().getId()) ;
	    	
	    	Classes clas2=classesService.find(div.getClasses().getId());
	    	
	    	Division newDiv=new Division(clas2, div.getName());
	    	
	    	
	    	try{	
	    		divisionService.create(newDiv);	    		
			    	System.out.println("new Division is saved ");
			    	output+="ExistingInstituteStructure";
	    	}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("duplicateClassErrorMessage", "Duplicate entry Name of the Class or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	output+="ModifyInstitueStructure";
			}   		
	        return output;
	    }

	 
	 

	 @RequestMapping(value="/ViewInstitueStructure",method = RequestMethod.GET)  
	    public String  ViewInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute) {  
	    	
		 
		 String str="";
		 
	        return "Teacher/ExistingInstituteStructure";
	    }

	 

}
