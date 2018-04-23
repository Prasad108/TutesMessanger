package com.app.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Branch;
import com.app.pojo.Classes;
import com.app.pojo.Division;
import com.app.pojo.Exam;
import com.app.pojo.ExamMode;
import com.app.pojo.ExamSubjectStudentCompositTable;
import com.app.pojo.ExamType;
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Schedule;
import com.app.pojo.Student;
import com.app.pojo.Subject;
import com.app.pojo.SubjectDivComposit;
import com.app.pojo.Teacher;
import com.app.service.BranchService;
import com.app.service.ClassesService;
import com.app.service.DivisionService;
import com.app.service.ExamModeService;
import com.app.service.ExamService;
import com.app.service.ExamSubjectStudentCompositTableService;
import com.app.service.ExamTypeService;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.ParentService;
import com.app.service.PermissionsService;
import com.app.service.ScheduleService;
import com.app.service.StudentService;
import com.app.service.SubjectDivCompositService;
import com.app.service.SubjectService;
import com.app.service.TeacherService;
import com.app.service.impl.SnsService;
/*import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;*/
import com.google.gson.Gson;
/*import com.sun.istack.internal.logging.Logger;*/

@Controller
@SessionAttributes({ "teacher", "appAdmin","institute","login","permissions","teacherJSON"  })
@RequestMapping("/Teacher")
public class TeacherController {
	
	@Autowired
	SnsService snsService;
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	ClassesService classesService;
	 
	@Autowired
	DivisionService divisionService;
	
	@Autowired
	InstituteService instituteService;

	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	PermissionsService permissionsService;

	@Autowired
	StudentService StudentService;
	
	@Autowired
	ParentService parentService;
	
	@Autowired
	ExamService examService;
	
	@Autowired
	ExamModeService examModeService;
	
	@Autowired
	ExamTypeService examTypeService;

	
	@Autowired
	SubjectService subjectService;
	
	@Autowired
	SubjectDivCompositService subjectDivCompositService;
	
	@Autowired
	ExamSubjectStudentCompositTableService examSubStudCompService;

	Gson gson = new Gson();
	
	 private static final Logger LOGGER = Logger.getLogger(TeacherController.class);
	 
	 

	  
	
	 @RequestMapping(value="/",method = RequestMethod.GET)  
	    public String  IndexController(Model model,@ModelAttribute("Branch") Branch branch1,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("**********this is IndexController controller**********");
	    	branch1.setInstitute(teacher.getInstitute());
	    	
	    				
	        return "Teacher/index";
	    }
	 
	 @RequestMapping(value = "/getSessionVariables", method = RequestMethod.GET)
	 @ResponseBody
	   	public String getSessionVariables(@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("teacherJSON") String teacherJson, @ModelAttribute("institute") String instituteJson, @ModelAttribute("permissions") String permissionsJson){
		
			System.out.println("**********from getSessionVariables controller***************** ");		
			String response="{\"teacherJson\":"+teacherJson+",\"instituteJson\":"+instituteJson+",\"permissionsJson\":"+permissionsJson+"}";
			
			
			
		return response;
	 }
	
	 @RequestMapping(value="/ModifyInstitueStructure",method = RequestMethod.GET)  
	    public String  ModifyInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("**********this is ModifyInstitueStructure controller**********");
	    	
	    	/*Logger.getLogger(TeacherController.class.getName(),TeacherController.class).log(Level.INFO, "**********this is ModifyInstitueStructure controller**********");*/	
			Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
			Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
			
			 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current institute :");
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
								
			model.addAttribute("BranchesOfInst",branchlist );
			
	        return "Teacher/ModifyInstitueStructure";
	    }
	       	 
	 @RequestMapping(value="/AddNewBranch",method = RequestMethod.POST)  
	    public String  AddNewBranch(Model model,@ModelAttribute("Branch") Branch branch1,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("**********this is AddNewBranch controller**********");
	    	branch1.setInstitute(teacher.getInstitute());
	    	
	    	branchService.create(branch1);
	    	System.out.println("new Branch is saved ");
	    	model.addAttribute("SuccessMessage", "New branch is Saved with the name "+branch1.getName());
	    	
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
	 	 
	 @RequestMapping(value="/DeleteBranch",method = RequestMethod.POST)  
	    public String  DeleteBranch(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("Classes") Classes clas) {  
	    	
	    	System.out.println("**********this is Delete Branch controller**********");
	   Branch branch1=clas.getBranch();
	    	System.out.println("teacher id is "+teacher);
	    	System.out.println("branch name is "+branch1.getName()+" and its id is "+branch1.getId());
	   
	    	try{
	    		branchService.delet(branch1.getId());
		    	System.out.println("Branch is deleted ");
		    	model.addAttribute("SuccessMessage", "Branch is deleted successfully");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		model.addAttribute("ErrorMessage", "This branch can not be deleted as it contains classes, first delete classes");
	    	}
	    	
	    	
	    	
	    	Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
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
	 
	 @RequestMapping(value="/modalRenameBranch",method = RequestMethod.POST)  
	    public String  modalRenameBranch(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("Classes") Classes clas) {  
	    	
	    	System.out.println("**********this is Rename Branch controller**********");
	        Branch branch1=clas.getBranch();
	    	System.out.println("teacher id is "+teacher);
	    	System.out.println("branch name is "+branch1.getName()+" and its id is "+branch1.getId());
	    	branch1.setInstitute(teacher.getInstitute());
	   
	    	try{
	    		branchService.update(branch1);
		    	System.out.println("Branch is renamed");
		    	model.addAttribute("SuccessMessage", "Branch is renamed successfully");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		model.addAttribute("ErrorMessage", "This branch can not be renamed");
	    	}
	    	
	    	
	    	
	    	Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
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
	 
	 @RequestMapping(value="/AddNewClass",method = RequestMethod.POST)  
	    public String  AddNewClass(Model model,@ModelAttribute("Classes") Classes clas,@ModelAttribute("teacher") Teacher teacher) {  
	    	
		 
	    	System.out.println("**********this is AddNewClass controller**********");
	    	
	    	
	    	Branch branch= branchService.find(clas.getBranch().getId()) ;
	    	Classes c=new Classes(branch, clas.getName());
	    	try{	
			    	classesService.create(c);	    		
			    	System.out.println("new Classes is saved ");
			    	model.addAttribute("SuccessMessage", "New Class is Saved with the name "+clas.getName());
			    	
	    	}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("ErrorMessage", "Duplicate entry Name of the Class or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	
			}
	    	finally {
	    		
	    		
		    	Branch branch1= new Branch();
				Classes clsess=new Classes();
				Division division =new Division();
				model.addAttribute("Branch", branch1);
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
	    	}
	        return "Teacher/ModifyInstitueStructure";
	    }
	 
	 @RequestMapping(value="/DeleteClassFromBranch",method = RequestMethod.POST)  
	    public String  DeleteClassFromBranch(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("Division") Division div) {  
	    	
	    	System.out.println("**********this is Delete Class controller**********");
	        Branch branch1=div.getClasses().getBranch();
	        Classes classes=div.getClasses();
	    	System.out.println("teacher id is "+teacher);
	    	System.out.println("class name is "+classes.getName()+" and its id is "+classes.getId());
	   
	    	try{
	    		classesService.delet(classes.getId());
		    	System.out.println("Class is deleted ");
		    	model.addAttribute("SuccessMessage", "Class is deleted successfully");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		model.addAttribute("ErrorMessage", "This class can not be deleted as it contains division, first delete divisions");
	    	}
	    	
	    	Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
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
	 
	 @RequestMapping(value="/modalRenameClass",method = RequestMethod.POST)  
	    public String  modalRenameClass(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("Division") Division div) {  
	    	
	    	System.out.println("**********this is Rename Class controller**********");
	        Branch branch1=div.getClasses().getBranch();
	        Classes classes=div.getClasses();
	    	System.out.println("teacher id is "+teacher);
	    	System.out.println("class name is "+classes.getName()+" and its id is "+classes.getId());
	     	branch1.setInstitute(teacher.getInstitute());
	        classes.setBranch(branch1);
	    	try{
	    		classesService.update(classes);
		    	System.out.println("Class is renamed");
		    	model.addAttribute("SuccessMessage", "Class is renamed successfully");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		model.addAttribute("ErrorMessage", "This class can not be renamed");
	    	}
	    	
	    	Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
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
	 
	 @RequestMapping(value = "/GetClassesList/{id}", method = RequestMethod.GET)
	 @ResponseBody
	    public String GetClassesList( @PathVariable("id") int id ){
		 
			System.out.println("**********from GetClassesList controller**********");
			
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
	 
	 @RequestMapping(value = "/GetDivisionList/{id}", method = RequestMethod.GET)
	 @ResponseBody
	    public String GetDivisionList( @PathVariable("id") int id ){
		 
			System.out.println("**********from GetDivisionList controller**********");
			List<Division> divisionList=divisionService.getallOfParticularClass(classesService.find(id));
			//List<Classes> classList=classesService.getallOfParticularBranch(branchService.find(id));
			String JSON="[{\"value\":0,\"name\":\"--- Select Division---\"},";
			for (Division div : divisionList) {
				JSON+="{";
				JSON+="\"value\":"+div.getId()+",";
				JSON+="\"name\":\""+div.getName()+"\"";
				JSON+="},";
			    System.out.println(div);
			}
			JSON=JSON.substring(0, JSON.length() - 1);
			JSON+="]";
			System.out.println(JSON);
			
			
		return JSON;
}
	
	 @RequestMapping(value="/AddNewDivision",method = RequestMethod.POST)  
	   	public String  AddNewDivision(Model model,@ModelAttribute("Division") Division div,@ModelAttribute("teacher") Teacher teacher) {  
	    	
		 
	    	System.out.println("**********this is AddNewDivision controller**********");	 
	    	
	    	Classes clas2=classesService.find(div.getClasses().getId());	    	
	    	Division newDiv=new Division(clas2, div.getName());
	    		    	
	    	try{	
	    		divisionService.create(newDiv);	    		
			    	System.out.println("new Division is saved ");
			    	model.addAttribute("SuccessMessage", "New Division is Saved with the name "+newDiv.getName());
			    	
	    	}
			catch(Exception e)
			{
				// mostly error will be that their is duplicate entry in record 
				model.addAttribute("ErrorMessage", "Duplicate entry Name of the Class or other attribute already exist try again with unique values");
		    	System.out.println("duplicate key unique key voilation");
		    	e.printStackTrace();
		    	
			} 
	    	finally {
	    		Branch branch1= new Branch();
				Classes clsess=new Classes();
				Division division =new Division();
				model.addAttribute("Branch", branch1);
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
	    	}
	    	 return "Teacher/ModifyInstitueStructure";
	    }
	 
	 @RequestMapping(value="/DeleteDivisionFromClass",method = RequestMethod.POST)  
	    public String  DeleteDivisionFromClass(Model model,@ModelAttribute("teacher") Teacher teacher,HttpServletRequest req) {  
	    	
	    	System.out.println("**********this is Delete Division controller**********");
	    	String divID=req.getParameter("disabledSelectForDivisionForDelete");
	        int id=Integer.valueOf(divID);
	    	String classID=req.getParameter("disabledSelectForClassesForDeleteDivision");
	    	System.out.println("div id is "+id);
	    	System.out.println("class id is "+classID);
	 
	    	System.out.println("teacher id is "+teacher);
	    
	    	try{
	    		divisionService.delet(id);
		    	System.out.println("Division is deleted ");
		    	model.addAttribute("SuccessMessage", "Division is deleted successfully");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		model.addAttribute("ErrorMessage", "This Division can not be deleted");
	    	}
	    	
	        Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
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
	 
	 @RequestMapping(value="/modalRenameDivision",method = RequestMethod.POST)  
	    public String  modalRenameDivision(Model model,@ModelAttribute("teacher") Teacher teacher,HttpServletRequest req) {  
	    	
	    	System.out.println("**********this is Rename Division controller**********");
	    	String id=req.getParameter("selectedDivisionIdToRename");
	    	
	    	Integer intObject = new Integer(id);
	    	int DivId = intObject.intValue();
	     	String DivName=req.getParameter("selectedDivisionForRename");
	    	System.out.println("Div is "+DivName+" and its id is "+DivId);
	    	
	  
	    	String id1=req.getParameter("selectedClassIdToRenameDivision");
	    	Integer intObject1 = new Integer(id1);
	    	int ClassId = intObject1.intValue();
	    	String ClassName=req.getParameter("selectedClassForRenameDivision");
	    	
	    	
	    	String id2=req.getParameter("selectedBranchIdrenameDivision");
	    	Integer intObject2 = new Integer(id2);
	    	int BranchId=intObject2.intValue();
	    	String BranchName=req.getParameter("selectedBranchForRenameDivision");
	    	
	    	Branch branch=new Branch();
	    	Classes classes=new Classes();
	        Division div=new Division();
	        
	        branch.setId(BranchId);
	        branch.setName(BranchName);
	        
	        classes.setBranch(branch);
	        classes.setId(ClassId);
	        classes.setName(ClassName);
	        
	    	div.setClasses(classes);
	    	div.setId(DivId);
	    	div.setName(DivName);
	        
	    	try{
	    		divisionService.update(div);
		    	System.out.println("Division is renamed");
		    	model.addAttribute("SuccessMessage", "Division is renamed successfully");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		model.addAttribute("ErrorMessage", "This Division can not be renamed");
	    	}
	    
	    	Branch branch1= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch1);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
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
	 
	   /* suraj method*/
	 @RequestMapping(value="/getInstituteStructure",method=RequestMethod.POST)
	 @ResponseBody
	 public String getInstituteStructure(@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute)
	 {
		 System.out.println("**********this is getInstitueStructure controller**********");	
		 System.out.println(teacher);
		 String str=teacherService.InstituteStucture(teacher);
		 System.out.println(str);
		 Gson gson=new Gson();
		 String response=gson.toJson(str);
		 return response;
		 
	 }
	 
	 @RequestMapping(value="/ViewInstitueStructure",method = RequestMethod.GET)  
	    public String  ViewInstitueStructure(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute) {  
	    	
		 System.out.println("**********this is ViewInstitueStructure controller**********");	    
		/* System.out.println(teacher);
		 String str=teacherService.InstituteStucture(teacher);
				
		 System.out.println(str);
		 model.addAttribute("structure", str);*/
		 		 
	        return "Teacher/ExistingInstituteStructure";
	    }
	 
	 @RequestMapping("/teacherChangePassword")
	 	public String changePasswordShow(Model map) 
	 {
		 System.out.println("**********this is teacherChangePassword controller**********");	    	
		 
		 String oldPassword = "a", newPassword = "a";
		 map.addAttribute("oldPassword",oldPassword);
		 map.addAttribute("newPassword", newPassword);
		 return "Teacher/changePassword";
	 }

	 @RequestMapping(value="/teacherChangePassword" , method=RequestMethod.POST)
	 	public String changePassword(Model map ,@RequestParam("oldPassword") String oldPassword ,@RequestParam("newPassword") String newPassword,@ModelAttribute("teacher") Teacher teacher ) 
	 {
		 System.out.println("**********this is teacherChangePassword controller**********");	    	
		System.out.println(teacher.toString());
		Login login =  teacherService.getLoginIdByEmail(teacher.getEmail());
		System.out.println(login.getId());
		teacher.setLogin(login);
		System.out.println(teacher.getLogin().getId());
		System.out.println(oldPassword+"taking password");
		System.out.println(newPassword+"taking password");
		
		Boolean flag=  teacherService.checkPassword(oldPassword , login.getId());
		
		if(flag)
			teacherService.changePassword(newPassword , login );
		
		 return "Teacher/changePassword";
	 }
 
	 @RequestMapping(value="/scheduletree",method = RequestMethod.GET)  
	    public String  scheduletree(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute) {  
	    	
	    	System.out.println("**********this is scheduletree controller**********");
	    	String str=teacherService.InstituteStuctureForSchedule(teacher);
	    
			Schedule schedule= new Schedule();
					
			 model.addAttribute("structure", str);
			 model.addAttribute("Schedule", schedule);
			 
			
	        return "Teacher/InstStructForSchedule";
	    }
	 
	 @RequestMapping(value="/scheduletreeJSON",method = RequestMethod.GET) 
	 @ResponseBody
	    public String  scheduletreeJSON(Model model,@ModelAttribute("teacher") Teacher teacher,@ModelAttribute("institute") Institute institute) {  
	    	
	    	System.out.println("**********this is scheduletreeJSON controller**********");
	    	String schedule=teacherService.InstituteStuctureForSchedule(teacher);

	        return gson.toJson(schedule);
	    }
	 
	 
	 @RequestMapping(value = "/GetCalender", method = RequestMethod.POST)
	 @ResponseBody
	   	public String GetCalender(@RequestBody int id,@ModelAttribute("teacher") Teacher teacher ){
		// int id=1;
		  // System.out.println(teacher.getInstitute().getId());
			System.out.println("**********from GetCalender controller and division id is :"+id +"**********"+teacher.getInstitute().getId());		
			Division d=divisionService.find(id);
			System.out.println("division is "+d);
			Schedule schedule= scheduleService.fordivision(id);
			
			System.out.println(schedule);
			String result="";
			try {
				result=schedule.getString();
				
				
			}catch(Exception e)
			{
				result="<div class='alert alert-block alert-danger fade in'>";
				result+="<button data-dismiss='alert' class='close close-sm' type='button'>";
				result+="<i class='icon-remove'></i>";
				result+="</button>";
				result+="<strong>No Calender Saved !</strong> Please save calender for division.";
				result+="</div> ";
			}		
				
			System.out.println(result);
			Gson gson=new Gson();
			String response=gson.toJson(result);
			System.out.println(response);
			
		return response;
	 }

	/* @RequestMapping(value = "/GetCalender/{id}", method = RequestMethod.GET)
	 @ResponseBody
	   	public String GetCalender( @PathVariable("id") int id,@ModelAttribute("teacher") Teacher teacher ){
		 
		   System.out.println(teacher.getInstitute().getId());
			System.out.println("**********from GetCalender controller and division id is :"+id +"**********"+teacher.getInstitute().getId());		
			Division d=divisionService.find(id);
			System.out.println("division is "+d);
			Schedule schedule= scheduleService.fordivision(id);
			
			System.out.println(schedule);
			String result="";
			try {
				result=schedule.getString();
				
				
			}catch(Exception e)
			{
				result="<div class='alert alert-block alert-danger fade in'>";
				result+="<button data-dismiss='alert' class='close close-sm' type='button'>";
				result+="<i class='icon-remove'></i>";
				result+="</button>";
				result+="<strong>No Calender Saved !</strong> Please save calender for division.";
				result+="</div> ";
			}		
				
			System.out.println(result);
			
			
		return result;
	 }
*/
	 
	 @RequestMapping(value="updateDivisionScheduleMethod",method=RequestMethod.POST)
	 public ResponseEntity updateDivisionScheduleMethod(Model model,@RequestBody Schedule schedule,@ModelAttribute("teacher") Teacher teacher)
	 {
		 ResponseEntity output;
		 System.out.println("**********this is updateDivisionScheduleMethod controller**********");
	    	
	    	System.out.println(schedule);
	    	String string=schedule.getString();
	    	System.out.println("before updating string is"+schedule.getString());
	    	String result=string.replace("\"","\'");
	    	System.out.println(result);
	    	schedule.setString(result);
	    	// if the schedule already exist update it 
	    	try { 
	    		
	    		
	    		// get the id of the existing schedule 
	    		//System.out.println("division is is"+schedule.getDivision().getId());
	    		Schedule s1=scheduleService.fordivision(schedule.getId());
	    		s1.setString(schedule.getString());
	    		System.out.println("after updating string is"+schedule.getString());
	    		System.out.println("we are updating the record :"+s1);
	    		// update the variable for the calender string 
	    		scheduleService.update(s1);
	    		System.out.println("------------------------schedule is updated------------------------- ");
	    		//model.addAttribute("SuccessMessage", "Schedule Updated for the division");
	    		output=new ResponseEntity(HttpStatus.OK);
	    	
	    	}catch(Exception e)
	    	{
	    		
	    		System.out.println("shcedule do not exist for this division creating new ");
	    		try {
	    			
	    			System.out.println("finding the division of the schedule with the id :"+schedule.getId());
	    			
	    			Division d=divisionService.find(schedule.getId());
	    			
	    			System.out.println("------devision is :"+d);
	    			schedule.setDivision(d);
	    			System.out.println("we are going to create the new shcedule");
	    			System.out.println("we aer about to save the :"+schedule );
	    			scheduleService.create(schedule);
	    			
	    			System.out.println("------------------------schedule is saved------------------------- ");
	    			// model.addAttribute("SuccessMessage", "Schedule created for the  division");
	    			output=new ResponseEntity(HttpStatus.OK);
	    			
	    		}catch(Exception e1)
	    		{
	    			
	    		// model.addAttribute("ErrorMessage", "error in saving Schedule for the division");
	    		 System.out.println("------------------------error in schedule creation------------------------- ");
	    		 output=new ResponseEntity(HttpStatus.FAILED_DEPENDENCY);
	    		}
	    		
	    	}
	    	
			Schedule schedule2= new Schedule();
			String str=teacherService.InstituteStuctureForSchedule(teacher);
					
			 model.addAttribute("structure", str);
			 model.addAttribute("Schedule", schedule2);
			 return output;
	    
	 }
	 @RequestMapping(value="/updateDivisionSchedule",method = RequestMethod.POST)  
	    public String  updateDivisionSchedule(Model model,@RequestBody Schedule schedule,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("**********this is updateDivisionSchedule controller**********");
	    	
	    	/*System.out.println(schedule);
	    	// if the schedule already exist update it 
	    	try { 
	    		
	    		
	    		// get the id of the existing schedule 
	    		Schedule s1=scheduleService.fordivision(schedule.getDivision().getId());
	    		s1.setString(schedule.getString());
	    		
	    		System.out.println("we are updating the record :"+s1);
	    		// update the variable for the calender string 
	    		scheduleService.update(s1);
	    		System.out.println("------------------------schedule is updated------------------------- ");
	    		model.addAttribute("SuccessMessage", "Schedule Updated for the division");
	    	
	    	}catch(Exception e)
	    	{
	    		
	    		System.out.println("shcedule do not exist for this division creating new ");
	    		try {
	    			
	    			System.out.println("finding the division of the schedule with the id :"+schedule.getDivision().getId());
	    			
	    			Division d=divisionService.find(schedule.getDivision().getId());
	    			
	    			System.out.println("------devision is :"+d);
	    			schedule.setDivision(d);
	    			System.out.println("we are going to create the new shcedule");
	    			System.out.println("we aer about to save the :"+schedule );
	    			scheduleService.create(schedule);
	    			
	    			System.out.println("------------------------schedule is saved------------------------- ");
	    			 model.addAttribute("SuccessMessage", "Schedule created for the  division");
	    			
	    		}catch(Exception e1)
	    		{
	    			
	    		 model.addAttribute("ErrorMessage", "error in saving Schedule for the division");
	    		 System.out.println("------------------------error in schedule creation------------------------- ");
	    		}
	    	}
	    	
			Schedule schedule2= new Schedule();
			String str=teacherService.InstituteStuctureForSchedule(teacher);
					
			 model.addAttribute("structure", str);
			 model.addAttribute("Schedule", schedule2);
	    */
			
	        return "Teacher/InstStructForSchedule";
	    }

	 @RequestMapping(value="/updateDivisionScheduleService",method = RequestMethod.POST)  
	    public String  updateDivisionScheduleService(@RequestBody Schedule schedule, HttpServletRequest request,@ModelAttribute("teacher") Teacher teacher) {  
	    	
	    	System.out.println("**********this is updateDivisionScheduleService controller**********");
	    	
	    	String result="";
	    	
	    	try {
	    		
	    	scheduleService.update(schedule);
	    	System.out.println("shcedule updated successfully");
	    	result="shcedule updated successfully";
	    	
	    	
	    	}catch(Exception e)
	    	{
	    		System.out.println("error in chedule update");
	    		result="error in updating shcedule";
	    		  		
	    	}
	    				
	        return result;
	    }

	 @RequestMapping(value = "/TeacherHome", method = RequestMethod.GET)
		public String TeacherHome(@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside Teacher Home Page controller**********");
			
			return "Teacher/home";

		}
	 
	 @RequestMapping(value = "/TeacherRequestForApproval", method = RequestMethod.GET)
		public String TeacherRequestForApproval(Model model,@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside TeacherRequestForApproval controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			List<Teacher> teacherList=instituteService.getallPendingTeacherForApproval(instituteService.find(teacher.getInstitute().getId()));
			String teacherListJSON=gson.toJson(teacherList);
			model.addAttribute("TeacherListJSON", teacherListJSON);
			return "Teacher/TeacherRequestForApproval";

		}
	 
	 @RequestMapping(value = "/TeacherRequestForApprovalListJSON", method = RequestMethod.GET)
	 @ResponseBody
		public String TeacherRequestForApprovalListJSON(@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside TeacherRequestForApprovalListJSON controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			List<Teacher> teacherList=instituteService.getallPendingTeacherForApproval(instituteService.find(teacher.getInstitute().getId()));
			String teacherListJSON=gson.toJson(teacherList);
			return teacherListJSON;

		}
	 
	 @RequestMapping(value = "/deleteTeacherApprovalRequest/{id}", method = RequestMethod.GET)
	 @ResponseBody
	 	public String deleteTeacherApprovalRequest( @PathVariable("id") int id ){
		 
			System.out.println("**********from /deleteTeacherApprovalRequest/{id} controller**********");
			
			String result="";									
			System.out.println("teacher to be deleted is with id"+id);		
				try{Teacher t=teacherService.find(id);
				loginService.delet(loginService.find(t.getLogin().getId()));
				System.out.println("Teacher is deleted with the id "+id);
				result="{\"message\":\"Teacher with id "+id+" is deleted \",\"status\":\"success\"}";
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
					System.out.println(e);
					System.out.println("error in deletion with teacher id : "+id);
					result="{\"message\":\"ERROR...!! Teacher with id "+id+" not deleted\",\"status\":\"fail\"}";
				}
			System.out.println(result);
		return result;
	 }
	 
	 @RequestMapping(value = "/TeacherRequestApprover/{id}", method = RequestMethod.GET)
	 @ResponseBody
	 	public String approveTeacherApprovalRequest( @PathVariable("id") int id,@RequestParam("authoriseStudent") boolean authoriseStudent,
			  @RequestParam("authoriseTeacher") boolean authoriseTeacher,
			  @RequestParam("fillAttendance") boolean fillAttendance,
			  @RequestParam("fillSchedule") boolean fillSchedule,
			  @RequestParam("mailParent") boolean mailParent,
			  @RequestParam("mailStudent") boolean mailStudent,
			  @RequestParam("mailTeacher") boolean mailTeacher,
			  @RequestParam("msgParent") boolean msgParent,
			  @RequestParam("msgStudent") boolean msgStudent,
			  @RequestParam("msgTeacher") boolean msgTeacher,
			  @RequestParam("setExam") boolean setExam,
			  @RequestParam("updateResults") boolean updateResults,
			  @RequestParam("alterInstituteStructure") boolean alterInstituteStructure
			  ){
		 
			System.out.println("**********from /approveTeacherApprovalRequest/{id} controller**********");
			
			String result="";
			System.out.println("authoriseTeacher"+authoriseTeacher+"fillAttendance:"+fillAttendance);
			Permissions p=new Permissions( authoriseStudent,  authoriseTeacher,  fillAttendance,  fillSchedule,
					 mailParent,  mailStudent,  mailTeacher,  msgParent,  msgStudent,
					 msgTeacher,  setExam,  updateResults,  alterInstituteStructure);
			
			System.out.println("permssions are :"+p);  
			System.out.println("teacher to be updated is with id"+id);		
				try
				{
					Teacher t=teacherService.find(id);		//find teacher								
					permissionsService.create(p);			// create permissions	
					t.setPermissions(p);					//attach permissions to teacher
					teacherService.update(t);               //update teacher
					Login l=loginService.find(t.getLogin().getId()); // get login of teacher
					l.setEnableInstitute(true);				 // enable the institute flag 
					loginService.update(l);				     //update login
					System.out.println("Teacher is updated with the id "+id);
					result="{\"message\":\"Teacher with id "+id+" is updated \",\"status\":\"success\"}";
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
					System.out.println(e);
					System.out.println("error in updation with teacher id : "+id);
					result="{\"message\":\"ERROR...!! Teacher with id "+id+" not updated\",\"c\":\"fail\"}";
				}
			System.out.println(result);
		return result;
	 }
	 
	 @RequestMapping(value="/home",method = RequestMethod.GET)  
	    public String  taecherhome() {  
	    	
	    	System.out.println("*************this is /Teacher/home controller*********************");
	    	
	    	
	    				
	        return "Teacher/home";
	    }

	 @RequestMapping(value = "/StudentRequestManager", method = RequestMethod.GET)
		public String StudentRequestManager(Model model,@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside StudentRequestManager controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			List<Student> studnetList=instituteService.getallPendingStudentForApproval(instituteService.find(teacher.getInstitute().getId()));
			for(Student s :studnetList)
			{
				System.out.println(s.getFname());
			}
			
			String studentListJSON=gson.toJson(studnetList);
			model.addAttribute("StudentListJSON", studentListJSON);
			return "Teacher/StudentRequestManager";

		}
	 
	 @RequestMapping(value = "/StudentRequestManagerList", method = RequestMethod.GET)
	 @ResponseBody
		public String StudentRequestManagerList(@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside StudentRequestManagerList controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			List<Student> studnetList=instituteService.getallPendingStudentForApproval(instituteService.find(teacher.getInstitute().getId()));
			for(Student s :studnetList)
			{
				System.out.println(s.getFname());
			}
			
			String studentListJSON=gson.toJson(studnetList);
			
			return studentListJSON;

		}
	 
	 @RequestMapping(value = "/deleteStudentApprovalRequest/{id}", method = RequestMethod.GET)
	 @ResponseBody
	 	public String deleteStudentApprovalRequest( @PathVariable("id") int id ){
		 
			System.out.println("**********from /deleteStudentApprovalRequest/{id} controller**********");
			
			String result="";									
			System.out.println("student to be deleted is with id"+id);		
				try{
					Student s=StudentService.find(id);
					System.out.println("first name of the student is "+s.getFname());
					Login login= loginService.find(s.getLogin().getId());
					System.out.println("login id is "+login.getId());
				loginService.delet(login);
				System.out.println("Student is deleted with the id "+id);
				result="{\"message\":\"Student with id "+id+" is deleted \",\"status\":\"success\"}";
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
					e.printStackTrace();
					
					System.out.println("error in deletion with Student id : "+id);
					result="{\"message\":\"ERROR...!! student with id "+id+" not deleted\",\"status\":\"fail\"}";
				}
			System.out.println(result);
		return result;
	 }
	 
	 @RequestMapping(value = "/StudentRequestApprover/{id}", method = RequestMethod.GET)
	 @ResponseBody
	 	public String StudentRequestApprover( @PathVariable("id") int id){
		 
			System.out.println("**********from /StudentRequestApprover/{id} controller**********");
			
			String result="";
			
			
			System.out.println("studnet to be updated is with id"+id);		
				try
				{
					Student s=StudentService.find(id);		//find teacher								
					
					Login l=loginService.find(s.getLogin().getId()); // get login of teacher
					l.setEnableInstitute(true);				 // enable the institute flag 
					loginService.update(l);				     //update login
					System.out.println("Student is updated with the id "+id);
					result="{\"message\":\"Studen with id "+id+" is updated \",\"status\":\"success\"}";
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
					System.out.println(e);
					System.out.println("error in updation with Student id : "+id);
					result="{\"message\":\"ERROR...!! Student with id "+id+" not updated\",\"c\":\"fail\"}";
				}
			System.out.println(result);
		return result;
	 }
	 
	 @RequestMapping(value = "/AddStudentToDivision", method = RequestMethod.GET)
		public String AddStudentToDivision(Model model,@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside AddStudentToDivision controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			
			List<Student> studnetList=instituteService.getallStudentWhoAreNotInAnyDivision(instituteService.find(teacher.getInstitute().getId()));
			for(Student s :studnetList)
			{
				System.out.println(s.getFname());
			}
			
			String studentListJSON=gson.toJson(studnetList);
			model.addAttribute("StudentListJSON", studentListJSON);
			
		 	Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
	    	
	    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current isntitute :");
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
			
			
		 String	branchListJSON=gson.toJson(branchlist);
		System.out.println(branchListJSON);
		model.addAttribute("branchListJSON",branchListJSON );
			return "Teacher/AddStudentToDivision";

		}
	 
	 @RequestMapping(value = "/AddStudentToDivisionGetStuendNotInAnyDivision", method = RequestMethod.GET)
	 @ResponseBody
		public String AddStudentToDivisionGetStuendNotInAnyDivision(Model model,@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside AddStudentToDivisionGetStuendNotInAnyDivision controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			
			List<Student> studnetList=instituteService.getallStudentWhoAreNotInAnyDivision(instituteService.find(teacher.getInstitute().getId()));
			for(Student s :studnetList)
			{
				System.out.println(s.getFname());
			}
			
			String studentListJSON=gson.toJson(studnetList);
			
			return studentListJSON;

		}
	 
	 @RequestMapping(value = "/BranchListOfInstitute", method = RequestMethod.GET)
	 @ResponseBody
		public String BranchListOfInstitute(@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside BranchListOfInstitute controller**********");
			System.out.println("teachers insitute id is :"+teacher.getInstitute().getId());
			
			 Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
	    	
	    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current isntitute :");
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
	
			 String	branchListJSON=gson.toJson(branchlist);
			System.out.println(branchListJSON);
			
			return branchListJSON;

		}
	 
	 
	 @RequestMapping(value = "/changeTUsername", method = RequestMethod.POST)
		public String changeTUsername(@ModelAttribute("teacher") Teacher teacher,HttpServletRequest request,Model model) {		
			System.out.println("**********inside changeTUsername controller**********");
			String currentUserName=request.getParameter("currentUsername");
			String newUserName=request.getParameter("newUsername");
			String existName=teacher.getLogin().getUsername();
			
			System.out.println("from form "+currentUserName +" from teacherobject"+existName);
			System.out.println("new username "+newUserName);
			if(existName.equals(currentUserName) )
			{
				teacherService.changeUserName(newUserName,teacher.getLogin());	
				model.addAttribute("userNameChangeSuccess","username successfully updated");
				teacher.getLogin().setUsername(newUserName);
				model.addAttribute("teacher",teacher);
			}
			else
			{
				model.addAttribute("wrongCurrentUserName","You have entered wrong current Username");
			}
			
			return "Teacher/changePassword";

		}
	 
	 @RequestMapping(value = "/changeTPassword", method = RequestMethod.POST)
		public String changeTPassword(@ModelAttribute("teacher") Teacher teacher,HttpServletRequest request,Model model) {		
			System.out.println("**********inside changeTPassword controller**********");
			String currentPassword=request.getParameter("currentPassword");
			String newPassword=request.getParameter("newPassword");
			
			String existPassword=teacher.getLogin().getPassword();
			
			System.out.println("from form "+currentPassword +" from teacherobject"+existPassword);
			System.out.println("new username "+newPassword);
			if(existPassword.equals(currentPassword) )
			{
				teacherService.changePassword(newPassword,teacher.getLogin());	
				model.addAttribute("passwordChangeSuccess","password successfully updated");
				teacher.getLogin().setPassword(newPassword);
				model.addAttribute("teacher", teacher);
			}
			else
			{
				model.addAttribute("wrongPassword","You have entered wrong current Password");
			}
			
			return "Teacher/changePassword";

		}
	 
	 @RequestMapping("/teacherShowProfile")
	 	public String teacherShowProfile(Model model) 
	 {
		 System.out.println("**********this is teacherShowProfile controller**********");	    	
		 return "Teacher/showProfile";
   	 }
	 
	 @RequestMapping(value="/teacherEditProfile")
	 	public String teacherEditProfile(Model model) 
	 {
		 System.out.println("**********this is teacherEditProfile controller**********");	 
		 model.addAttribute("EditTeacher", new Teacher());
		 return "Teacher/editProfile";
     }
	 
	 
	 @RequestMapping(value="/editTeacher",consumes=MediaType.APPLICATION_JSON_VALUE,method = RequestMethod.POST)
     public String editTeacher(Model model,@ModelAttribute("teacher") Teacher teacher1,@RequestBody Teacher teacher2) 
	 {
		 System.out.println("**********this is editTeacher controller suraj**********");
		 teacher1.setFname(teacher2.getFname());
		 teacher1.setLname(teacher2.getLname());
		 teacher1.setEmail(teacher2.getEmail());
		 teacher1.setContactno(teacher2.getContactno());
		 
		 teacherService.update(teacher1);
		 model.addAttribute("teacher",teacher1);
		 model.addAttribute("teacherJSON",gson.toJson(teacher1));
		 
		 model.addAttribute("profileEditSuccess","Your profile updated successfully");
		
		 return "Teacher/showProfile";
  }
	 
	 
	 
	 @RequestMapping(value="/updateTeacher",consumes=MediaType.APPLICATION_JSON_VALUE,method = RequestMethod.POST)
	 @ResponseBody
     public String updateTeacher(@ModelAttribute("teacher") Teacher teacher1,@RequestBody Teacher teacher2) 
	 {
		 System.out.println("**********this is updateTeacher controller suraj**********");
		 teacher1.setFname(teacher2.getFname());
		 teacher1.setLname(teacher2.getLname());
		 teacher1.setEmail(teacher2.getEmail());
		 teacher1.setContactno(teacher2.getContactno());
		 String response="";
		 try {
		 teacherService.update(teacher1);
		 response="{\"status\":\"success\",\"teacher\":\""+gson.toJson(teacher1)+"\"}";
		 }
		 catch(Exception e) {
			 response="{\"status\":\"fail\"}";
		 }
		 
		 return response;
  }
	 
	 /*@RequestMapping(value="/editTeacher",method = RequestMethod.POST)
	 	public String editTeacher(Model model,@ModelAttribute("teacher") Teacher teacher1,@ModelAttribute("EditTeacher") Teacher teacher2) 
	 {
		 System.out.println("**********this is editTeacher controller**********");
		 teacher1.setFname(teacher2.getFname());
		 teacher1.setLname(teacher2.getLname());
		 teacher1.setEmail(teacher2.getEmail());
		 teacher1.setContactno(teacher2.getContactno());
		 
		 teacherService.update(teacher1);
		 model.addAttribute("teacher",teacher1);
		 model.addAttribute("teacherJSON",gson.toJson(teacher1));
		 
		 model.addAttribute("profileEditSuccess","Your profile updated successfully");
		
		 return "Teacher/showProfile";
     }*/
	 
	 @RequestMapping(value = "/StudentInDivision", method = RequestMethod.GET)
		public String ShowStudentInDivision(Model model,@ModelAttribute("teacher") Teacher teacher) {		
			System.out.println("**********inside Show student of particular division controller**********");
			
			    Branch branch= new Branch();
				Classes clsess=new Classes();
				Division division =new Division();
				model.addAttribute("Branch", branch);
				model.addAttribute("Classes", clsess);
				model.addAttribute("Division", division);
		    	System.out.println(teacher.getId());
		    	
		    	Institute inst=teacherService.GetInstitute(teacher.getId());
				System.out.println("institute is :"+inst);
		    	
		    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
				 System.out.println("we are going to print the branches of current isntitute :");
				 for (Branch b : branchlist) {
					    System.out.println(b);
					}
				
				
			 String	branchListJSON=gson.toJson(branchlist);
			System.out.println(branchListJSON);
			model.addAttribute("branchListJSON",branchListJSON );
			return "Teacher/StudentInDivision";
		}
	 
	 @RequestMapping(value="/showStudentOfDivision",method=RequestMethod.POST)
	 	public String displayStudentOfDivision(Model model,@ModelAttribute("teacher") Teacher teacher,HttpServletRequest req)
	 {
		 System.out.println("**********inside displayStudentOfDivision controller**********");
		 String id=req.getParameter("disabledSelectForDivisionForShowStudent");
		 String DivName=req.getParameter("");
		 int DivID=Integer.parseInt(id);
		 System.out.println(DivID);
		 
		try
		{
			System.out.println("in try");
		List<Student> studentList= StudentService.findByDivId(DivID);
		for (Student s : studentList) {
			    System.out.println(s.getFname()+" "+s.getLname());
			}
		
		String studentListJSON=gson.toJson(studentList);
		model.addAttribute("StudentListJSON", studentListJSON);
		if(studentList.isEmpty())
		{
			model.addAttribute("ErrorMessage","Selected division does not contain any student");
		}
		else
		{
			model.addAttribute("SuccessMessage","Selected division have following students");	
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		    Branch branch= new Branch();
			Classes clsess=new Classes();
			Division division =new Division();
			model.addAttribute("Branch", branch);
			model.addAttribute("Classes", clsess);
			model.addAttribute("Division", division);
	    	System.out.println(teacher.getId());
	    	
	    	Institute inst=teacherService.GetInstitute(teacher.getId());
			System.out.println("institute is :"+inst);
	    	
	    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
			 System.out.println("we are going to print the branches of current isntitute :");
			 for (Branch b : branchlist) {
				    System.out.println(b);
				}
			model.addAttribute("BranchesOfInst",branchlist );
		
		 return "Teacher/StudentInDivision";
	 }
	  
	 @RequestMapping(value="/GetStudentOfDivision/{id}", method=RequestMethod.GET)
	 @ResponseBody
	 	public String GetStudentOfDivision(  @PathVariable("id") int DivID)
	 {
		 System.out.println("**********inside GetStudentOfDivision controller**********");
		
		 System.out.println(DivID);
		 String studentListJSON="";
		 
		try
		{
			System.out.println("in try");
		List<Student> studentList= StudentService.findByDivId(DivID);
		for (Student s : studentList) {
			    System.out.println(s.getFname()+" "+s.getLname());
			}
		
		studentListJSON=gson.toJson(studentList);
		
		if(studentList.isEmpty())
		{
			studentListJSON="{\"ErrorMessage\":\"Selected division does not contain any student\"}";		
		}
		else
		{
			studentListJSON=gson.toJson(studentList);
		}
		}
		catch(Exception e)
		{
			studentListJSON="{\"ErrorMessage\":\"Selected division does not contain any student\"}";
			
			e.printStackTrace();
		}
		
		System.out.println(studentListJSON);
		
		 return studentListJSON;
	 }
	 	 	 
	 /* @RequestMapping(value="/deleteStudentFromDivision", method=RequestMethod.GET)
	
	 public String deleteStudentFromDivision(Model model,@ModelAttribute("teacher") Teacher teacher,HttpServletRequest req)
	 {
		 System.out.println("**********inside deleteStudentFromDivision controller**********");
		 String [] name=req.getParameterValues("selectedstudent");
		 for(int i=0;i<name.length;i++){
	       System.out.println("selected student "+name);
		 }
		
		
	  return "Teacher/StudentInDivision";
	 }
	 */
	 
	 @RequestMapping(value = "/GetClassesListInJSON/{id}", method = RequestMethod.GET)
	 @ResponseBody
	    public String GetClassesListINJSON( @PathVariable("id") int id ){
		 
			System.out.println("**********from GetClassesListINJSON controller**********");
			
			List<Classes> classList=classesService.getallOfParticularBranch(branchService.find(id));
			
         		String classesListJSON=gson.toJson(classList);
			
			System.out.println(classesListJSON);
			
			return classesListJSON;
}
	 
		 @RequestMapping(value = "/GetDivisionListInJSON/{id}", method = RequestMethod.GET)
		 @ResponseBody
	    public String GetDivisionListInJSON( @PathVariable("id") int id ){
		 
			System.out.println("**********from GetDivisionListInJSON controller**********");
			System.out.println(id);
			List<Division> divisionList=divisionService.getallOfParticularClass(classesService.find(id));
			
         		String divisionListJSON=gson.toJson(divisionList);
			
			System.out.println(divisionListJSON);
			
			return divisionListJSON;
       }
 
	 @RequestMapping(value="/GetStudentOfDivisionInJSON", method=RequestMethod.POST)
	 @ResponseBody
	 	public String GetStudentOfDivisionInJSON(@RequestBody Division division)
	 {
		 System.out.println("**********inside GetStudentOfDivisionInJSON controller**********");
		
		 System.out.println(division);
		 String studentListJSON="";
		 
		try
		{
			System.out.println("in try");
		List<Student> studentList= StudentService.findByDivId(division.getId());
		for (Student s : studentList) {
			    System.out.println(s.getFname()+" "+s.getLname());
			}
		
		studentListJSON=gson.toJson(studentList);
		
		if(studentList.isEmpty())
		{
			studentListJSON="{\"ErrorMessage\":\"Selected division does not contain any student\"}";		
		}
		else
		{
			studentListJSON=gson.toJson(studentList);
		}
		}
		catch(Exception e)
		{
			studentListJSON="{\"ErrorMessage\":\"Selected division does not contain any student\"}";
			
			e.printStackTrace();
		}
		
		System.out.println(studentListJSON);
		
		 return studentListJSON;
	 }
	 	 
	 @RequestMapping(value="/DeleteSelectedStudentFromDivision", method=RequestMethod.POST)
	 @ResponseBody
	 	public String DeleteSelectedStudentFromDivision(@RequestBody ArrayList<Student> studentList)
	 {
		 System.out.println("**********inside DeleteSelectedStudentFromDivision controller**********");
		 System.out.println(studentList);
		 for(Student s:studentList)
		 {
			 System.out.println(s.getFname()+" "+s.getId());
			 
			StudentService.deleteSelectedFromDiv(s.getId());
		 }
		
		/* System.out.println();
		 ObjectMapper mapper = new ObjectMapper();
		 JSONObject jsonObj = new JSONObject(json);*/
		
		
		 return "";
	 }
	 
	 @RequestMapping(value="/AddSelectedStudentToDivision/{id}", method=RequestMethod.POST)
	 @ResponseBody
	 	public String AddSelectedStudentToDivision(@PathVariable("id") int id,@RequestBody ArrayList<Student> studentList)
	 {
		 System.out.println("**********inside AddSelectedStudentToDivision controller**********");
		 
		 Division division=divisionService.find(id);
		 System.out.println("division name is "+division.getName());
		 
		 for(Student s:studentList)
		 {
			 System.out.println(s.getFname());
			 StudentService.SetDivisionId(s.getId(), id);
		 }
		 System.out.println(division.getName());		
		 return gson.toJson(division);
	 }
	 
	 	@RequestMapping("/AddEditExam")
	 	public String AddEditExam(Model model) 
	 	{
	 		System.out.println("**********this is AddEditExam controller**********");
	 		return "Teacher/Exam/AddEditExam";
		}
	 	
	 	@RequestMapping("/studentResult")
	 	public String studentResult(Model model) 
	 	{
	 		System.out.println("**********this is ExamList in Result controller**********");
	 		return "Teacher/Result/ExamList";
		}
	 		 	
	 	@RequestMapping(value="/GetExamsOFInstitute/{id}", method=RequestMethod.POST)
		@ResponseBody
		public String GetExamsOFInstitute(@PathVariable("id") int InstituteId)
		 {
			 System.out.println("**********inside GetExamsOFInstitute controller**********");
			 List<Exam> examList= examService.getallOfParticularInstitute(InstituteId);
			 
			 String JSON="[";
			 for(Exam e: examList)
			 {
				 JSON+="{";
					JSON+="\"id\":"+e.getId()+",";
					JSON+="\"examMode\":";
							JSON+="{";
								JSON+="\"id\":"+e.getExamMode().getId()+"},";
					JSON+="\"examType\":";
					JSON+="{";
					JSON+="\"id\":"+e.getExamType().getId()+"},";
					JSON+="\"discription\":\""+e.getDiscription()+"\",";
				
					JSON+="\"outOf\":"+e.getOutOf()+",";
					JSON+="\"passingMarks\":"+e.getPassingMarks()+",";
					JSON+="\"regular\":"+e.getRegular()+"";				
					JSON+="},";
				   
			 }
			 
			 JSON=JSON.substring(0, JSON.length() - 1);
				JSON+="]";
			
				System.out.println(JSON);
			
			
			 return JSON;
		 }
	 	
	 	
	 	@RequestMapping(value="/GetExamsMode", method=RequestMethod.POST)
		@ResponseBody
		public String GetExamsMode()
		 {
			 System.out.println("**********inside GetExamsMode controller**********");			 
			 List<ExamMode> examModeList= examModeService.getAll();
			 String JSONexamModeList=gson.toJson(examModeList);		
			// System.out.println(JSONexamModeList);
			 return JSONexamModeList;
		 }
	 	
	 	@RequestMapping(value="/GetExamsType", method=RequestMethod.POST)
		@ResponseBody
		public String GetExamsType()
		 {
			 System.out.println("**********inside GetExamsType controller**********");			 
			 List<ExamType> examTypeList= examTypeService.getAll();
			 String JSONexamTypeList=gson.toJson(examTypeList);		
			 //System.out.println(JSONexamTypeList);
			 return JSONexamTypeList;
		 }
	 	
	 	@RequestMapping(value="/SaveExam/{id}", method=RequestMethod.POST)
		@ResponseBody
		public String SaveExam(@RequestBody Exam e,@PathVariable("id") int InstituteId)
		 {
			 System.out.println("**********inside SaveExam controller**********");	
			 e.setInstitute(instituteService.find(InstituteId));
			 
			 examService.create(e);
			 String JSON="";
			 JSON+="{";
				JSON+="\"id\":"+e.getId()+",";
				JSON+="\"examMode\":";
						JSON+="{";
							JSON+="\"id\":"+e.getExamMode().getId()+"},";
				JSON+="\"examType\":";
				JSON+="{";
				JSON+="\"id\":"+e.getExamType().getId()+"},";
				JSON+="\"discription\":\""+e.getDiscription()+"\",";
			
				JSON+="\"outOf\":"+e.getOutOf()+",";
				JSON+="\"passingMarks\":"+e.getPassingMarks()+",";
				JSON+="\"regular\":"+e.getRegular()+"";				
				JSON+="}";

			 return JSON;
		 }
	 	
	 	@RequestMapping(value="/DeleteExam/{id}", method=RequestMethod.POST)
		@ResponseBody
		public String DeleteExam(@PathVariable("id") int ExamId)
		 {
			 System.out.println("**********inside DeleteExam controller**********");	
			 
			 String result="";
			 Exam e= examService.find(ExamId);
			 result="{";
			 result+="\"message\":\"success\"";
			 result+="}";
			
			 try{
				 examService.delet(e);
			 }
			 catch(Exception exception){
				 result="{";
				 result+="\"message\":\"failed\"";
				 result+="}";
			 }
			 System.out.println(result);
			 return result;
		 }
	 	
	 	
	 	
	 	@RequestMapping(value="/UpdateExam/{id}", method=RequestMethod.POST)
		@ResponseBody
		public String UpdateExam(@RequestBody Exam e,@PathVariable("id") int InstituteId)
		 {
			 System.out.println("**********inside UpdateExam controller**********");	
			 e.setInstitute(instituteService.find(InstituteId));
			 examService.update(e);
			
			 String JSON="";
			 JSON+="{";
				JSON+="\"id\":"+e.getId()+",";
				JSON+="\"examMode\":";
						JSON+="{";
							JSON+="\"id\":"+e.getExamMode().getId()+"},";
				JSON+="\"examType\":";
				JSON+="{";
				JSON+="\"id\":"+e.getExamType().getId()+"},";
				JSON+="\"discription\":\""+e.getDiscription()+"\",";
			
				JSON+="\"outOf\":"+e.getOutOf()+",";
				JSON+="\"passingMarks\":"+e.getPassingMarks()+",";
				JSON+="\"regular\":"+e.getRegular()+"";				
				JSON+="}";
				System.out.println(JSON);

			 return JSON;  
		 }
	 	
	 	
		@RequestMapping(value="/GetSubjectDivCompIDResult/{examId}", method=RequestMethod.POST)
		@ResponseBody
	 	public String GetSubjectDivCompIDResult(@PathVariable("examId") int examId)
		 {
			 System.out.println("**********inside GetSubjectDivCompID controller**********");
			 List<SubjectDivComposit> subjectDivCompList=examSubStudCompService.findByExamId(examId);
			 
			 String JSON="[";
			 
			 for(SubjectDivComposit s : subjectDivCompList)
			 {
			  System.out.println("\n SubDivID : "+s.getId() );	 
			 }
			 
			 for(SubjectDivComposit s : subjectDivCompList)
			 {
				 JSON+="{";
					JSON+="\"id\":"+s.getId();			
					JSON+="},";
				   
			 }
			 
			 JSON=JSON.substring(0, JSON.length() - 1);
				JSON+="]";
			
				System.out.println(JSON);
			
			
			 return JSON;
		 }
		
	 	
	 	
		@RequestMapping(value="/GetSubjectDivCompID/{examId}", method=RequestMethod.POST)
		@ResponseBody
	 	public String GetSubjectDivCompID(@PathVariable("examId") int examId)
		 {
			 System.out.println("**********inside GetSubjectDivCompID controller**********");
			 List<SubjectDivComposit> subjectDivCompList=examSubStudCompService.findByExamId(examId);
			 
			 String JSON="[";
			 
			 for(SubjectDivComposit s : subjectDivCompList)
			 {
			  System.out.println("\n SubDivID : "+s.getId() );	 
			 }
			 
			 for(SubjectDivComposit s : subjectDivCompList)
			 {
				 JSON+="{";
					JSON+="\"id\":"+s.getId();			
					JSON+="},";
				   
			 }
			 
			 JSON=JSON.substring(0, JSON.length() - 1);
				JSON+="]";
			
				System.out.println(JSON);
			
			
			 return JSON;
		 }
		
		
		@RequestMapping(value="/GetStudentListNotInExamJSON/{subDivId}/{divId}/{examId}", method=RequestMethod.POST)
		@ResponseBody
	 	public String GetStudentListNotInExamJSON(@PathVariable("subDivId") int subDivId,@PathVariable("divId") int divId,@PathVariable("examId") int examId)
		 {
			 System.out.println("**********inside GetStudentListNotInExamJSON controller**********");
			 
			 String studentListNotExamJSON="";
			 System.out.println("sub_divComposit id : "+subDivId);
			 System.out.println("div id : "+divId);
			 System.out.println("exam id : "+examId);
			 List<Student> studentNotInExamList=new ArrayList<Student>();
			
				try
				{
			
				List<Student> allStudentOfDivisionList=StudentService.findByDivId(divId);
				List<Student> studentOfExamList=examSubStudCompService.findByExamId(examId, subDivId);
				
				String match="";
				
				  for(Student examStudent : studentOfExamList)
				  {
					  System.out.println("student id: "+examStudent.getId());
				  }
				
				
				for (Student allStudent : allStudentOfDivisionList) {
					    match="false";
					    for(Student examStudent : studentOfExamList)
					    {
					    	if(allStudent.getId() == examStudent.getId())
					    	{
					    		match="true";
					    		break;
					    	}
					    }
					    
					    if(match.equals("false"))
					    {
					    	studentNotInExamList.add(allStudent);
					    }
					}
				
				studentListNotExamJSON=gson.toJson(studentNotInExamList);
				
				if(studentNotInExamList.isEmpty())
				{
					studentListNotExamJSON="{\"ErrorMessage\":\"Selected subject having all students\"}";		
				}
				else
				{
					studentListNotExamJSON=gson.toJson(studentNotInExamList);
				}
				}
				catch(Exception e)
				{
					studentListNotExamJSON="{\"ErrorMessage\":\"Selected subject having all students\"}";
					
					e.printStackTrace();
				}
				
				System.out.println(studentListNotExamJSON);
			 
			 
			 return studentListNotExamJSON;
		 }
		
		
		@RequestMapping(value="/GetStudentListOfExamJSON/{subDivId1}/{examId1}", method=RequestMethod.POST)
		@ResponseBody
	 	public String GetStudentListOfExamJSON(@PathVariable("subDivId1") int subDivId1,@PathVariable("examId1") int examId1)
		 {
			 System.out.println("**********inside GetStudentListOfExamJSON controller**********");
			 
			 String studentListOfExamJSON="";
			 System.out.println("sub_divComposit id : "+subDivId1);
			 System.out.println("exam id : "+examId1);
			
				try
				{
			
				List<Student> studentInExamList=examSubStudCompService.findByExamId(examId1, subDivId1);
				
				
				  for(Student examStudent : studentInExamList)
				  {
					  System.out.println("student id: "+examStudent.getId());
				  }
				
				
				
				studentListOfExamJSON=gson.toJson(studentInExamList);
				
				if(studentInExamList.isEmpty())
				{
					studentListOfExamJSON="{\"ErrorMessage\":\"Selected exam doesn't contain students for selected subject \"}";		
				}
				else
				{
					studentListOfExamJSON=gson.toJson(studentInExamList);
				}
				}
				catch(Exception e)
				{
					studentListOfExamJSON="{\"ErrorMessage\":\"Selected exam doesn't contain students for selected subject catch\"}";
					
					e.printStackTrace();
				}
				
				System.out.println(studentListOfExamJSON);
			 
			 
			 return studentListOfExamJSON;
		 }
		
		
		@RequestMapping(value="/addSelectedStudentToExam/{subDivId}/{examId}/{divId}", method=RequestMethod.POST)
		 @ResponseBody
		 	public String AddStudentInExam(@PathVariable("subDivId") int subDivId,@PathVariable("examId") int examId,@PathVariable("divId") int divId,@RequestBody ArrayList<Student> studentList)
		 {
			 System.out.println("**********inside AddStudentInExam controller**********");
			 String studentListNotExamJSON="";
			 List<Student> studentNotInExamList=new ArrayList<Student>();
			
			 try
			 {
				 ExamSubjectStudentCompositTable examStudSubObj= examSubStudCompService.findByExamSubDivId(examId, subDivId);
			    
				 for(Student stud : studentList)
				 {
					 examStudSubObj.setStudent(stud); 
					 examSubStudCompService.create(examStudSubObj);
				 }
	
			     List<Student> allStudentOfDivisionList=StudentService.findByDivId(divId);
			     List<Student> studentOfExamList=examSubStudCompService.findByExamId(examId, subDivId);
					
			     String match="";
					
				for (Student allStudent : allStudentOfDivisionList) 
				{
				  match="false";
				  for(Student examStudent : studentOfExamList)
				  {
				   if(allStudent.getId() == examStudent.getId())
				   {
					match="true";
				    break;
				   }
				  }
						    
				  if(match.equals("false"))
				  {
				   studentNotInExamList.add(allStudent);
				  }
				}
					
			  studentListNotExamJSON=gson.toJson(studentNotInExamList);
					
			}catch(Exception e)
			 {
				e.printStackTrace();
			 }
			 
		return studentListNotExamJSON;
	}
		
		
		@RequestMapping(value="/deleteSelectedStudentFromExam/{subDivId1}/{examId1}/{divId1}", method=RequestMethod.POST)
		 @ResponseBody
		 	public String deleteSelectedStudentFromExam(@PathVariable("subDivId1") int subDivId1,@PathVariable("examId1") int examId1,@PathVariable("divId1") int divId1,@RequestBody ArrayList<Student> studentList)
		 {
			 System.out.println("**********inside deleteSelectedStudentFromExam controller**********");
			 System.out.println("sub_divComposit id : "+subDivId1);
			 System.out.println("div id : "+divId1);
			 System.out.println("exam id : "+examId1);
			 String studentListJSON=gson.toJson(studentList);
			 System.out.println(studentListJSON);
			
			 try
			 {
				 for(Student examStudent : studentList)
				  {
					 System.out.println("student id: "+examStudent.getId());
					 examSubStudCompService.deletStudentFromExam(examStudent.getId(),subDivId1, examId1); 
				  }
				 
					List<Student> studentInExamList=examSubStudCompService.findByExamId(examId1, subDivId1);
			  }
			 catch(Exception e)
			  {
			   e.printStackTrace();
			   }
					 
		return "";
	}
	 	 
	 	@RequestMapping(value = "/deleteSubjectFromDivision/{subId}/{divId}", method = RequestMethod.GET)
		 @ResponseBody
		 	public String deleteSubjectFromDivision( @PathVariable("subId") int subId, @PathVariable("divId") int divId){
			 
				System.out.println("**********from deleteSubjectFromDivision controller**********");
				
				String result="";									
				System.out.println("subject to be deleted is with id"+subId);		
					try{
						Subject s=subjectService.find(subId);
						System.out.println("name of the subject is "+s.getName());
						
						subjectDivCompositService.deleteByDivId(subId, divId);
					
					System.out.println("Subject is deleted with the id "+subId);
					result="{\"message\":\"Subject with id "+subId+" is deleted \",\"status\":\"success\"}";
					}
					catch(Exception e)
					{
						System.out.println(e.getMessage());
						e.printStackTrace();
						
						System.out.println("error in deletion with Subject id : "+subId);
						result="{\"message\":\"ERROR...!! subject with id "+subId+" not deleted\",\"status\":\"fail\"}";
					}
				System.out.println(result);
			return result;
	 	}
	 
		 
		 @RequestMapping(value="/GetSubjectNotInDivisionInJSON", method=RequestMethod.POST)
		 @ResponseBody
		 	public String GetSubjectNotInDivisionInJSON(@RequestBody Division division,@ModelAttribute("teacher") Teacher teacher)
		 {
			 System.out.println("**********inside Get Subject Not In Division controller**********");
			
			 Institute inst=teacherService.GetInstitute(teacher.getId());
			 int instituteId=inst.getId();
			 System.out.println(division);
			 System.out.println(instituteId);
			
			 String subjectListNotInDivJSON="";
			 
			 List<Subject> subjectNotInDivList=new ArrayList<Subject>();
			 
			try
			{
		
			List<Subject> subjectList=subjectDivCompositService.findByDivId(division.getId());
			List<Subject> allSubjectOfInstituteList=subjectService.getallOfInstitute(instituteId);
			
			String match="";
			
			for (Subject allSubject : allSubjectOfInstituteList) {
				    match="false";
				    for(Subject divSubject : subjectList)
				    {
				    	if(allSubject.getId() == divSubject.getId())
				    	{
				    		match="true";
				    		break;
				    	}
				    }
				    
				    if(match.equals("false"))
				    {
				    	subjectNotInDivList.add(allSubject);
				    }
				}
			
			subjectListNotInDivJSON=gson.toJson(subjectNotInDivList);
			
			if(subjectNotInDivList.isEmpty())
			{
				subjectListNotInDivJSON="{\"ErrorMessage\":\"Selected division having all subjects\"}";		
			}
			else
			{
				subjectListNotInDivJSON=gson.toJson(subjectNotInDivList);
			}
			}
			catch(Exception e)
			{
				subjectListNotInDivJSON="{\"ErrorMessage\":\"Selected division having all subjects\"}";
				
				e.printStackTrace();
			}
			
			System.out.println(subjectListNotInDivJSON);
			
			 return subjectListNotInDivJSON;
		 }
		 

		 
		 @RequestMapping(value = "/AddEditSubject", method = RequestMethod.GET)
			public String AddEditSubject(Model model) {		
				System.out.println("**********inside add and edit subject controller**********");
				/*
				    Branch branch= new Branch();
					Classes clsess=new Classes();
					Division division =new Division();
					model.addAttribute("Branch", branch);
					model.addAttribute("Classes", clsess);
					model.addAttribute("Division", division);
			    	System.out.println(teacher.getId());
			    	
			    	Institute inst=teacherService.GetInstitute(teacher.getId());
					System.out.println("institute is :"+inst);
			    	
			    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
					 System.out.println("we are going to print the branches of current isntitute :");
					 for (Branch b : branchlist) {
						    System.out.println(b);
						}
					
					
				 String	branchListJSON=gson.toJson(branchlist);
				System.out.println(branchListJSON);
				model.addAttribute("branchListJSON",branchListJSON );*/
				return "Teacher/Subject/AddEditSubject";
			}
		 
		 @RequestMapping(value = "/SubjectInDivision", method = RequestMethod.GET)
			public String ShowSubjectInDivision(Model model,@ModelAttribute("teacher") Teacher teacher) {		
				System.out.println("**********inside Show subject of particular division controller**********");
				
				    Branch branch= new Branch();
					Classes clsess=new Classes();
					Division division =new Division();
					model.addAttribute("Branch", branch);
					model.addAttribute("Classes", clsess);
					model.addAttribute("Division", division);
			    	System.out.println(teacher.getId());
			    	
			    	Institute inst=teacherService.GetInstitute(teacher.getId());
					System.out.println("institute is :"+inst);
			    	
			    	 List <Branch> branchlist=branchService.getallOfParticularInstitute(inst);
					 System.out.println("we are going to print the branches of current isntitute :");
					 for (Branch b : branchlist) {
						    System.out.println(b);
						}
					
					
				 String	branchListJSON=gson.toJson(branchlist);
				System.out.println(branchListJSON);
				model.addAttribute("branchListJSON",branchListJSON );
				return "Teacher/Subject/SubjectInDivision";
		 		}
		 
		 
		 @RequestMapping(value="/GetSubjectOfDivisionInJSON", method=RequestMethod.POST)
		 @ResponseBody
		 	public String GetSubjectOfDivisionInJSON(@RequestBody Division division)
		 {
			 System.out.println("**********inside GetSubjectOfDivisionInJSON controller**********");
			
			 System.out.println(division);
			 String subjectListJSON="";
			 
			try
			{
				System.out.println("in try");
			List<Subject> subjectList=subjectDivCompositService.findByDivId(division.getId());	
			
			for (Subject s : subjectList) {
				    System.out.println(s.getName());
				}
			
			subjectListJSON=gson.toJson(subjectList);
			
			if(subjectList.isEmpty())
			{
				subjectListJSON="{\"ErrorMessage\":\"Selected division does not contain any subject\"}";		
			}
			else
			{
				subjectListJSON=gson.toJson(subjectList);
			}
			}
			catch(Exception e)
			{
				subjectListJSON="{\"ErrorMessage\":\"Selected division does not contain any subject\"}";
				
				e.printStackTrace();
			}
			
			System.out.println(subjectListJSON);
			
			 return subjectListJSON;
		 }
		 
		 @RequestMapping(value = "/addSubjectToDivision/{subId}/{divId}/{instId}", method = RequestMethod.POST)
		 @ResponseBody
		 	public String addSubjectToDivision( @PathVariable("subId") int subId, @PathVariable("divId") int divId, @PathVariable("instId") int instId){
			 
				System.out.println("**********from addSubjectToDivision controller**********");
												
				System.out.println("subject to be added is with id"+subId);	
				String subjectListNotInDivJSON="";
					try{
						Subject sub=subjectService.find(subId);
						System.out.println("name of the subject is "+sub.getName());
						
						Division div=divisionService.find(divId);
						System.out.println("name of the division is "+div.getName());
						
						SubjectDivComposit sdc=new SubjectDivComposit(div, sub);
						subjectDivCompositService.create(sdc);
						
						
						
						List<Subject> subjectListOfDiv=subjectDivCompositService.findByDivId(divId);
						List<Subject> allSubjectOfInstituteList=subjectService.getallOfInstitute(instId);
						List<Subject> subjectNotInDivList=new ArrayList<Subject>();
						
						for(Subject s : subjectListOfDiv)
						{
						 System.out.println(s.getName());	
						}
						
						System.out.println("\nInstitute subject");
						for(Subject s : allSubjectOfInstituteList)
						{
						 System.out.println(s.getName());	
						}
						
						String match="";
						
						for (Subject allSubject : allSubjectOfInstituteList) {
							    match="false";
							    for(Subject divSubject : subjectListOfDiv)
							    {
							    	if(allSubject.getId() == divSubject.getId())
							    	{
							    		match="true";
							    		break;
							    	}
							    }
							    
							    if(match.equals("false"))
							    {
							    	subjectNotInDivList.add(allSubject);
							    }
							}
						
						System.out.println("\nSubject not in division");
						for(Subject s : subjectNotInDivList)
						{
						 System.out.println(s.getName());	
						}
						
					
					System.out.println("Subject is added with the id "+subId);
					
					subjectListNotInDivJSON=gson.toJson(subjectNotInDivList);	
					
					//result="{\"message\":\"Subject with id "+subId+" is added \",\"status\":\"success\"}";
					}
					catch(Exception e)
					{
						System.out.println(e.getMessage());
						e.printStackTrace();
						
						System.out.println("error in adding with Subject id : "+subId);
					//result="{\"message\":\"ERROR...!! subject with id "+subId+" not added\",\"status\":\"fail\"}";
					}
				System.out.println(subjectListNotInDivJSON);
			return subjectListNotInDivJSON;
}
	 	 
	 	 
	 	 @RequestMapping(value="/GetSubjectListofInstituteInJSON/{instId}", method=RequestMethod.POST)
		 @ResponseBody
		 	public String GetSubjectListofInstituteInJSON(@PathVariable("instId") int instId)
		 {
			 System.out.println("**********inside Get Subject of particular institute controller**********");
			
			 System.out.println(instId);
			
			 String subjectListOfInstituteJSON="";
			 
			try
			{
		
			List<Subject> allSubjectOfInstituteList=subjectService.getallOfInstitute(instId);
			
			subjectListOfInstituteJSON=gson.toJson(allSubjectOfInstituteList);
			
			if(allSubjectOfInstituteList.isEmpty())
			{
				subjectListOfInstituteJSON="{\"ErrorMessage\":\"Selected Institute does not contain any subjects\"}";		
			}
			else
			{
				subjectListOfInstituteJSON=gson.toJson(allSubjectOfInstituteList);
			}
			}
			catch(Exception e)
			{
				subjectListOfInstituteJSON="{\"ErrorMessage\":\"Selected Institute does not contain any subjects\"}";
				
				e.printStackTrace();
			}
			
			System.out.println(subjectListOfInstituteJSON);
			
			 return subjectListOfInstituteJSON;
		 }
	 	 
	 	 
	 	 @RequestMapping(value = "/deleteSubjectFromInstitute/{subId}/{instId}", method = RequestMethod.POST)
		 @ResponseBody
		 	public String deleteSubjectFromInstitute(@PathVariable("subId") int subId,@PathVariable("instId") int instId){
			 
				System.out.println("**********from deleteSubjectFromInstitute controller**********");
				
				String subjectListOfInstituteAfterDeletJSON="";
				
				System.out.println("subject to be deleted is with id"+subId);		
					try{
						Subject s=subjectService.find(subId);
						System.out.println("name of the subject is "+s.getName());
						
						subjectService.deleteFromInstitute(subId);
						
						List<Subject> allSubjectOfInstituteList=subjectService.getallOfInstitute(instId);
						subjectListOfInstituteAfterDeletJSON=gson.toJson(allSubjectOfInstituteList);
						System.out.println(subjectListOfInstituteAfterDeletJSON);
						
					
					System.out.println("Subject is deleted with the id "+subId);
					//subjectListOfInstituteAfterDeletJSON="{\"message\":\"Subject with id "+subId+" is deleted \",\"status\":\"success\"}";
					}
					catch(Exception e)
					{
						System.out.println(e.getMessage());
						e.printStackTrace();
					
						System.out.println("error in deletion with Subject id : "+subId);
					//	subjectListOfInstituteAfterDeletJSON="{\"message\":\"ERROR...!! subject with id "+subId+" not deleted\",\"status\":\"fail\"}";
					}
				System.out.println(subjectListOfInstituteAfterDeletJSON);
			return subjectListOfInstituteAfterDeletJSON;
	 	 }
	 	
	 	
	 	
	 	@RequestMapping(value="/GetSubjectTreeStruct/{id}", method=RequestMethod.POST)
		@ResponseBody
		public String GetSubjectTreeStruct(@PathVariable("id") int InstituteId)
		 {
			 System.out.println("**********inside GetSubjectTreeStruct controller**********");	
					
			 String JSON=instituteService.GetSubjectTree(InstituteId);	
				System.out.println(JSON);
			 return JSON;
		 }
	 
		 
			 
		 @RequestMapping(value = "/addSubjectToInstitute/{subName}/{subDescript}/{instId}", method = RequestMethod.POST)
		 @ResponseBody
		 	public String addSubjectToInstitute(@PathVariable("subName") String subName,@PathVariable("subDescript") String subDescript,@PathVariable("instId") int instId){
			 
				System.out.println("**********from addSubjectToInstitute controller**********");
				
				String result="";	
				
				System.out.println("subject to be added is with name "+subName+" in institute with id "+instId);		
					try{
						Institute inst=instituteService.find(instId);
						System.out.println(inst.getName());
						
						Subject sub=new Subject(inst, subName, subDescript);
						
						subjectService.create(sub);
					
					System.out.println("Subject is added with the name "+subName);
					result="{\"message\":\"Subject with name "+subName+" is added \",\"status\":\"success\"}";
					}
					catch(Exception e)
					{
						System.out.println(e.getMessage());
						e.printStackTrace();
					
						System.out.println("error in add with Subject name : "+subName);
						result="{\"message\":\"ERROR...!! subject with name "+subName+" not added\",\"status\":\"fail\"}";
					}
				System.out.println(result);
			return result;
		 }
		 
		 
		 
		 @RequestMapping(value="/UpdateSubject/{instId}", method=RequestMethod.POST)
			@ResponseBody
			public String UpdateSubject(@RequestBody Subject sub,@PathVariable("instId") int InstituteId)
			 {
				 System.out.println("**********inside UpdateSubject controller**********");	
				 sub.setInstitute(instituteService.find(InstituteId));
				 subjectService.update(sub);
				
				 String JSON="";
				 JSON+="{";
					JSON+="\"id\":"+sub.getId()+",";
					JSON+="\"name\":\""+sub.getName()+"\",";
					JSON+="\"discription\":\""+sub.getDiscription()+"\"";			
					JSON+="}";
					System.out.println(JSON);

				 return JSON;
			 }
		 
		 @RequestMapping(value="/AddSubjectToExam", method=RequestMethod.POST)
			@ResponseBody
			public String AddSubjectToExam(@RequestBody List<ExamSubjectStudentCompositTable> examSubjectStudentSubList)
			 {
				 System.out.println("**********inside AddSubjectToExam controller**********");	
				
				 String JSON="";
				 java.util.Date dt = new java.util.Date();

				 java.text.SimpleDateFormat sdf = 
				      new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				 String currentTime = sdf.format(dt);
				 
				 try {
				for(ExamSubjectStudentCompositTable examSubjectStudentSub:examSubjectStudentSubList)
				{
					/*System.out.println("examsubdivcomp "+examSubjectStudentSub+"exam id:"+examSubjectStudentSub.getExam().getId()+" subdiv id "+examSubjectStudentSub.getSubjectDivComposit().getId());*/
					System.out.println(examSubjectStudentSub);
					System.out.println(examSubjectStudentSub.getExam().getId());
					System.out.println(examSubjectStudentSub.getSubjectDivComposit().getId());
					
					examSubStudCompService.create(examSubjectStudentSub);
				}
				 JSON="{\"message\":\"success\"}";
				 }
				 catch(Exception e) {
					 JSON="{\"message\":\"failed to save subjects to exam\"}";
					 e.printStackTrace();
					 
				 }
				 return JSON;
			 }
			 
		 
		 
		 @RequestMapping(value = "/sendSMS/{contactNo}", method = RequestMethod.GET)
		 @ResponseBody
		 	public String approveTeacherApprovalRequest( @PathVariable("contactNo") String contactNo,@RequestParam("sms") String text){
			 
				System.out.println("**********from sendSMS/{contactNo} controller**********");
				String result="";
				try {
				String pubId= snsService.sendSMSMessage(text, contactNo);
				result="{\"status\":\"success\",\"pubid\":\""+pubId+"\"}";
				}
				catch(Exception e) {
					result="{\"message\":\"failed to send to sms\"}";
					 e.printStackTrace();
					 
				 }
				 System.out.println(result);
				
			return result;
		 }
		 
		 
		 @RequestMapping(value = "/Exam/{ExamId}/Subject/{subdiv}", method = RequestMethod.POST)
		 @ResponseBody
		 	public String approveTeacherApprovalRequest( @PathVariable("ExamId") int examId,@RequestParam("subdiv") int subdiv){
			   
				System.out.println("**********from /Exam/{ExamId}/Subject/{subdiv} controller**********");
				examSubStudCompService.examSubjectStrudentResult(examId,subdiv);
				String result="";
				
				
				
				 System.out.println(result);
				
			return result;
		 }
		 
		 @RequestMapping(value = "/resultStudentList", method = RequestMethod.POST)
		 @ResponseBody
		 	public String resultStudentList( ){
			   
				System.out.println("**********from resultStudentList controller**********");
				examSubStudCompService.examSubjectStrudentResult(38,6);
				String result="";
				
				
				
				 System.out.println(result);
				
			return result;
		 }
		 
		 
	  
		 
}
