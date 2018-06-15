package com.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
import com.app.pojo.Parent;
import com.app.pojo.Permissions;
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
import com.app.service.ResultService;
import com.app.service.ScheduleService;
import com.app.service.StringUtil;
import com.app.service.StudentService;
import com.app.service.SubjectDivCompositService;
import com.app.service.SubjectService;
import com.app.service.TeacherService;
import com.app.service.impl.SnsService;
/*import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;*/
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;


@Controller
@SessionAttributes({ "teacher", "appAdmin", "institute", "login", "permissions", "teacherJSON" })
@RequestMapping("/Teacher")
public class TeacherController {


	StringUtil stringUtil=new StringUtil();
	
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
	
	@Autowired
	ResultService resultService;

	Gson gson = new Gson();

	private static final Logger LOGGER = Logger.getLogger(TeacherController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String IndexController(Model model, @ModelAttribute("Branch") Branch branch1,
			@ModelAttribute("teacher") Teacher teacher) {

		System.out.println("**********this is IndexController controller**********");
		branch1.setInstitute(teacher.getInstitute());

		return "Teacher/index";
	}

	@RequestMapping(value = "/getSessionVariables", method = RequestMethod.GET)
	@ResponseBody
	public String getSessionVariables(@ModelAttribute("teacher") Teacher teacher,
			@ModelAttribute("teacherJSON") String teacherJson, @ModelAttribute("institute") String instituteJson,
			@ModelAttribute("permissions") String permissionsJson) {

		System.out.println("**********from getSessionVariables controller***************** ");
		String response = "{\"teacherJson\":" + teacherJson + ",\"instituteJson\":" + instituteJson
				+ ",\"permissionsJson\":" + permissionsJson + "}";

		return response;
	}

	

	
	
	
	@RequestMapping(value = "/AddNewBranch/{branchName}", method = RequestMethod.POST)
	@ResponseBody
	public String AddNewBranch(@PathVariable("branchName") String branchName,@ModelAttribute("teacher") Teacher teacher) {
		System.out.println("**********inside AddNewBranch controller**********");
		String output="";
		int flag =0;
		try
		{
		 Institute inst = teacherService.GetInstitute(teacher.getId());
		
		 List<Branch> branchlist = branchService.getallOfParticularInstitute(inst);
		 for (Branch b : branchlist) {
		 if(b.getName().equalsIgnoreCase(branchName))
		 {
			 flag =2;
			 break;
		 }
	     }
		 if(flag == 2)
		 {
		  output = "{\"action\":\"Failed to add new branch \",\"status\":\"branchExist\"}"; 
		 }
		 else{
		 Branch branch=new Branch();
		 branch.setName(branchName);
		 branch.setInstitute(inst);
				
	     branchService.create(branch);
	     output = "{\"action\":\"New Branch is added sucessfully \",\"status\":\"success\"}";
		  }
		 return output;
		 }
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to add new branch \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/RenameBranch/{branchName}", method = RequestMethod.POST)
	@ResponseBody
	public String RenameBranch(@PathVariable("branchName") String branchName,@ModelAttribute("teacher") Teacher teacher,@RequestBody Branch branch) {
		System.out.println("**********inside RenameBranch controller**********");
		String output;
		int flag =0;
		try{
			
		Institute inst = teacherService.GetInstitute(teacher.getId());	
		
		 List<Branch> branchlist = branchService.getallOfParticularInstitute(inst);
		 for (Branch b : branchlist) {
		 if(b.getName().equalsIgnoreCase(branchName))
		 {
			 flag =2;
			 break;
		 }
	     }
		 if(flag == 2)
		 {
		  output = "{\"action\":\"Failed to rename branch \",\"status\":\"branchExist\"}"; 
		 }
		 else{
			  branch.setName(branchName);
			  branch.setInstitute(inst);
				
			  branchService.update(branch);
			  output = "{\"action\":\"Selected Branch is renamed sucessfully \",\"status\":\"success\"}";
		  }
		 return output;
		
		}
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to rename selected branch \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/DeleteBranch", method = RequestMethod.POST)
	@ResponseBody
	public String DeleteBranch(@ModelAttribute("teacher") Teacher teacher,@RequestBody Branch branch) {
		System.out.println("**********inside DeleteBranch controller**********");
		String output;
		try{
		branchService.delet(branch.getId());
		output = "{\"action\":\"Selected Branch is deleted sucessfully \",\"status\":\"success\"}";
		return output;
		}
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to delete selected branch \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/AddNewClass/{className}", method = RequestMethod.POST)
	@ResponseBody
	public String AddNewClass(@PathVariable("className") String className,@ModelAttribute("teacher") Teacher teacher,@RequestBody Branch branch) {
		System.out.println("**********inside AddNewClass controller**********");
		String output="";
		int flag =0;
		try
		{
		 Institute inst = teacherService.GetInstitute(teacher.getId());
		
		 List<Classes> classlist = classesService.getallOfParticularBranch(branch);
		 
		 for (Classes c : classlist) {
		 if(c.getName().equalsIgnoreCase(className))
		 {
			 flag =2;
			 break;
		 }
	     }
		 if(flag == 2)
		 {
		  output = "{\"action\":\"Failed to add new class \",\"status\":\"classExist\"}"; 
		 }
		 else{
		 Classes classes=new Classes();	 
		 
		 classes.setName(className);
		 classes.setBranch(branch);
		 classesService.create(classes);		
	     
	     output = "{\"action\":\"New Class is added sucessfully \",\"status\":\"success\"}";
		  }
		 return output;
		 }
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to add new class \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/RenameClass/{className}/{branchId}", method = RequestMethod.POST)
	@ResponseBody
	public String RenameClass(@PathVariable("className") String className,@PathVariable("branchId") int branchId,@ModelAttribute("teacher") Teacher teacher,@RequestBody Classes classes) {
		System.out.println("**********inside RenameClass controller**********");
		String output;
		int flag =0;
		
		try{
		Branch branch=branchService.find(branchId);		
		List<Classes> classlist = classesService.getallOfParticularBranch(branch);
		
		for (Classes c : classlist) {
			 if(c.getName().equals(className))
			 {
				 flag =2;
				 break;
			 }
		     }
			 if(flag == 2)
			 {
			  output = "{\"action\":\"Failed to rename class \",\"status\":\"classExist\"}"; 
			 }
			 else {
		          classes.setName(className);
		          classes.setBranch(branch);
		          classesService.update(classes);
		          output = "{\"action\":\"Selected Class is renamed sucessfully \",\"status\":\"success\"}";
			 }
		return output;
		}
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to rename selected class \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/DeleteClass", method = RequestMethod.POST)
	@ResponseBody
	public String DeleteClass(@ModelAttribute("teacher") Teacher teacher,@RequestBody Classes classes) {
		System.out.println("**********inside DeleteClass controller**********");
		String output;
		try{
		classesService.delet(classes.getId());	
		output = "{\"action\":\"Selected Class is deleted sucessfully \",\"status\":\"success\"}";
		return output;
		}
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to delete selected class \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/AddNewDivision/{divisionName}", method = RequestMethod.POST)
	@ResponseBody
	public String AddNewDivision(@PathVariable("divisionName") String divisionName,@ModelAttribute("teacher") Teacher teacher,@RequestBody Classes classes) {
		System.out.println("**********inside AddNewDivision controller**********");
		String output="";
		int flag =0;
		try
		{
		 Institute inst = teacherService.GetInstitute(teacher.getId());
		
		 List<Division> divisionlist =divisionService.getallOfParticularClass(classes);   
		 
		 for (Division d : divisionlist) {
		 if(d.getName().equalsIgnoreCase(divisionName))
		 {
			 flag =2;
			 break;
		 }
	     }
		 if(flag == 2)
		 {
		  output = "{\"action\":\"Failed to add new division \",\"status\":\"divisionExist\"}"; 
		 }
		 else{	 
		 Division division=new Division(); 
		 division.setName(divisionName);
		 division.setClasses(classes);
		 divisionService.create(division);		
	     
	     output = "{\"action\":\"New Division is added sucessfully \",\"status\":\"success\"}";
		  }
		 return output;
		 }
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to add new division \",\"status\":\"fail\"}";
			return output;
		}
	}

	@RequestMapping(value = "/RenameDivision/{divisionName}/{classId}", method = RequestMethod.POST)
	@ResponseBody
	public String RenameDivision(@PathVariable("divisionName") String divisionName,@PathVariable("classId") int classId,@ModelAttribute("teacher") Teacher teacher,@RequestBody Division division) {
		System.out.println("**********inside RenameDivision controller**********");
		String output;
		int flag =0;
		
		try{
			Classes classes=classesService.find(classId);
		
		List<Division> divisionlist =divisionService.getallOfParticularClass(classes);	
		for (Division d : divisionlist) {
			 if(d.getName().equalsIgnoreCase(divisionName))
			 {
				 flag =2;
				 break;
			 }
		     }
			 if(flag == 2)
			 {
			  output = "{\"action\":\"Failed to rename division \",\"status\":\"divisionExist\"}"; 
			 }
			 else {
		          division.setName(divisionName);
		          division.setClasses(classes);
		          divisionService.update(division);
		     
		          output = "{\"action\":\"Selected Division is renamed sucessfully \",\"status\":\"success\"}";
			 }
		return output;
		}
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to rename selected division \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	@RequestMapping(value = "/DeleteDivision", method = RequestMethod.POST)
	@ResponseBody
	public String DeleteDivision(@ModelAttribute("teacher") Teacher teacher,@RequestBody Division division) {
		System.out.println("**********inside DeleteDivision controller**********");
		String output;
		try{
		divisionService.delet(division.getId());
		output = "{\"action\":\"Selected Division is deleted sucessfully \",\"status\":\"success\"}";
		return output;
		}
		catch(Exception e)
		{
			output = "{\"action\":\"Failed to delete selected division \",\"status\":\"fail\"}";
			return output;
		}
	}
	
	

	@RequestMapping(value = "/GetClassesList/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String GetClassesList(@PathVariable("id") int id) {

		System.out.println("**********from GetClassesList controller**********");

		List<Classes> classList = classesService.getallOfParticularBranch(branchService.find(id));
		String JSON = "[{\"value\":0,\"name\":\"--- Select Class---\"},";
		for (Classes c : classList) {
			JSON += "{";
			JSON += "\"value\":" + c.getId() + ",";
			JSON += "\"name\":\"" + c.getName() + "\"";
			JSON += "},";
			System.out.println(c);
		}
		JSON = JSON.substring(0, JSON.length() - 1);
		JSON += "]";
		System.out.println(JSON);

		return JSON;
	}

	@RequestMapping(value = "/GetDivisionList/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String GetDivisionList(@PathVariable("id") int id) {

		System.out.println("**********from GetDivisionList controller**********");
		List<Division> divisionList = divisionService.getallOfParticularClass(classesService.find(id));
		// List<Classes>
		// classList=classesService.getallOfParticularBranch(branchService.find(id));
		String JSON = "[{\"value\":0,\"name\":\"--- Select Division---\"},";
		for (Division div : divisionList) {
			JSON += "{";
			JSON += "\"value\":" + div.getId() + ",";
			JSON += "\"name\":\"" + div.getName() + "\"";
			JSON += "},";
			System.out.println(div);
		}
		JSON = JSON.substring(0, JSON.length() - 1);
		JSON += "]";
		System.out.println(JSON);

		return JSON;
	}



	

	@RequestMapping(value = "/GetCalender/{divId}", method = RequestMethod.POST)
	@ResponseBody
	public String GetCalender(@PathVariable("divId") int id, @ModelAttribute("teacher") Teacher teacher) {

		System.out.println("**********from GetCalender/{divId} controller and division id is :" + id + "**********");
		Division d = divisionService.find(id);
		System.out.println("division is " + d);

		String result = "";
		try {
			Schedule schedule = scheduleService.fordivision(id);
			System.out.println(schedule);
			result = "{\"schedule\":\" " + schedule.getString() + " \",\"status\":\"success\"}";

		} catch (Exception e) {
			result = "{\"status\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "updateDivisionScheduleMethod", method = RequestMethod.POST)
	@ResponseBody
	public String updateDivisionScheduleMethod(Model model, @RequestBody Schedule schedule,
			@ModelAttribute("teacher") Teacher teacher) {
		String output;
		System.out.println("**********this is updateDivisionScheduleMethod controller**********");

		System.out.println(schedule);
		String string = schedule.getString();
		System.out.println("before updating string is" + schedule.getString());
		String result = string.replace("\"", "\'");
		System.out.println(result);
		schedule.setString(result);
		// if the schedule already exist update it
		try {

			// get the id of the existing schedule
			// System.out.println("division is is"+schedule.getDivision().getId());
			Schedule s1 = scheduleService.fordivision(schedule.getId());
			s1.setString(schedule.getString());
			System.out.println("after updating string is" + schedule.getString());
			System.out.println("we are updating the record :" + s1);
			// update the variable for the calender string
			scheduleService.update(s1);
			System.out.println("------------------------schedule is updated------------------------- ");
			// model.addAttribute("SuccessMessage", "Schedule Updated for the division");
			output = "{\"action\":\"Schedule is updated for the division \",\"status\":\"success\"}";

		} catch (Exception e) {

			System.out.println("shcedule do not exist for this division creating new ");
			try {

				System.out.println("finding the division of the schedule with the id :" + schedule.getId());

				Division d = divisionService.find(schedule.getId());

				System.out.println("------division is :" + d);
				schedule.setDivision(d);
				System.out.println("we are going to create the new shcedule");
				System.out.println("we aer about to save the :" + schedule);
				scheduleService.create(schedule);

				System.out.println("------------------------schedule is saved------------------------- ");
				// model.addAttribute("SuccessMessage", "Schedule created for the division");
				output = "{\"action\":\"Failed to created/update Schedule for the division \",\"status\":\"fail\"}";

			} catch (Exception e1) {

				// model.addAttribute("ErrorMessage", "error in saving Schedule for the
				// division");
				System.out.println("------------------------error in schedule creation------------------------- ");

				output = "{\"action\":\"Schedule is created for the division \",\"status\":\"success\"}";
			}

		}
		return output;

	}

	
	

	@RequestMapping(value = "/TeacherRequestForApprovalListJSON", method = RequestMethod.GET)
	@ResponseBody
	public String TeacherRequestForApprovalListJSON(@ModelAttribute("teacher") Teacher teacher) {
		System.out.println("**********inside TeacherRequestForApprovalListJSON controller**********");
		System.out.println("teachers insitute id is :" + teacher.getInstitute().getId());
		List<Teacher> teacherList = instituteService
				.getallPendingTeacherForApproval(instituteService.find(teacher.getInstitute().getId()));
		String teacherListJSON = gson.toJson(teacherList);
		return teacherListJSON;

	}

	@RequestMapping(value = "/deleteTeacherApprovalRequest/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteTeacherApprovalRequest(@PathVariable("id") int id) {

		System.out.println("**********from /deleteTeacherApprovalRequest/{id} controller**********");

		String result = "";
		System.out.println("teacher to be deleted is with id" + id);
		try {
			Teacher t = teacherService.find(id);
			loginService.delet(loginService.find(t.getLogin().getId()));
			System.out.println("Teacher is deleted with the id " + id);
			result = "{\"message\":\"Teacher with id " + id + " is deleted \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			System.out.println("error in deletion with teacher id : " + id);
			result = "{\"message\":\"ERROR...!! Teacher with id " + id + " not deleted\",\"status\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/TeacherRequestApprover/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String approveTeacherApprovalRequest(@PathVariable("id") int id,
			@RequestParam("authoriseStudent") boolean authoriseStudent,
			@RequestParam("authoriseTeacher") boolean authoriseTeacher,
			@RequestParam("fillAttendance") boolean fillAttendance, @RequestParam("fillSchedule") boolean fillSchedule,
			@RequestParam("mailParent") boolean mailParent, @RequestParam("mailStudent") boolean mailStudent,
			@RequestParam("mailTeacher") boolean mailTeacher, @RequestParam("msgParent") boolean msgParent,
			@RequestParam("msgStudent") boolean msgStudent, @RequestParam("msgTeacher") boolean msgTeacher,
			@RequestParam("setExam") boolean setExam, @RequestParam("updateResults") boolean updateResults,
			@RequestParam("alterInstituteStructure") boolean alterInstituteStructure) {

		System.out.println("**********from /approveTeacherApprovalRequest/{id} controller**********");

		String result = "";
		System.out.println("authoriseTeacher" + authoriseTeacher + "fillAttendance:" + fillAttendance);
		Permissions p = new Permissions(authoriseStudent, authoriseTeacher, fillAttendance, fillSchedule, mailParent,
				mailStudent, mailTeacher, msgParent, msgStudent, msgTeacher, setExam, updateResults,
				alterInstituteStructure);

		System.out.println("permssions are :" + p);
		System.out.println("teacher to be updated is with id" + id);
		try {
			Teacher t = teacherService.find(id); // find teacher
			permissionsService.create(p); // create permissions
			t.setPermissions(p); // attach permissions to teacher
			teacherService.update(t); // update teacher
			Login l = loginService.find(t.getLogin().getId()); // get login of teacher
			l.setEnableInstitute(true); // enable the institute flag
			loginService.update(l); // update login
			System.out.println("Teacher is updated with the id " + id);
			result = "{\"message\":\"Teacher with id " + id + " is updated \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			System.out.println("error in updation with teacher id : " + id);
			result = "{\"message\":\"ERROR...!! Teacher with id " + id + " not updated\",\"c\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	

	@RequestMapping(value = "/StudentRequestManagerList", method = RequestMethod.GET)
	@ResponseBody
	public String StudentRequestManagerList(@ModelAttribute("teacher") Teacher teacher) {
		System.out.println("**********inside StudentRequestManagerList controller**********");
		System.out.println("teachers insitute id is :" + teacher.getInstitute().getId());
		List<Student> studnetList = instituteService
				.getallPendingStudentForApproval(instituteService.find(teacher.getInstitute().getId()));
		for (Student s : studnetList) {
			System.out.println(s.getFname());
		}

		String studentListJSON = gson.toJson(studnetList);

		return studentListJSON;

	}

	@RequestMapping(value = "/deleteStudentApprovalRequest/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteStudentApprovalRequest(@PathVariable("id") int id) {

		System.out.println("**********from /deleteStudentApprovalRequest/{id} controller**********");

		String result = "";
		System.out.println("student to be deleted is with id" + id);
		try {
			Student s = StudentService.find(id);
			System.out.println("first name of the student is " + s.getFname());
			Login login = loginService.find(s.getLogin().getId());
			System.out.println("login id is " + login.getId());
			loginService.delet(login);
			System.out.println("Student is deleted with the id " + id);
			result = "{\"message\":\"Student with id " + id + " is deleted \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			System.out.println("error in deletion with Student id : " + id);
			result = "{\"message\":\"ERROR...!! student with id " + id + " not deleted\",\"status\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/StudentRequestApprover/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String StudentRequestApprover(@PathVariable("id") int id) {

		System.out.println("**********from /StudentRequestApprover/{id} controller**********");

		String result = "";

		System.out.println("studnet to be updated is with id" + id);
		try {
			Student s = StudentService.find(id); // find teacher

			Login l = loginService.find(s.getLogin().getId()); // get login of teacher
			l.setEnableInstitute(true); // enable the institute flag
			loginService.update(l); // update login
			System.out.println("Student is updated with the id " + id);
			result = "{\"message\":\"Studen with id " + id + " is updated \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			System.out.println("error in updation with Student id : " + id);
			result = "{\"message\":\"ERROR...!! Student with id " + id + " not updated\",\"c\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	

	@RequestMapping(value = "/AddStudentToDivisionGetStuendNotInAnyDivision", method = RequestMethod.GET)
	@ResponseBody
	public String AddStudentToDivisionGetStuendNotInAnyDivision(Model model,
			@ModelAttribute("teacher") Teacher teacher) {
		System.out.println("**********inside AddStudentToDivisionGetStuendNotInAnyDivision controller**********");
		System.out.println("teachers insitute id is :" + teacher.getInstitute().getId());

		List<Student> studnetList = instituteService
				.getallStudentWhoAreNotInAnyDivision(instituteService.find(teacher.getInstitute().getId()));
		for (Student s : studnetList) {
			System.out.println(s.getFname());
		}

		String studentListJSON = gson.toJson(studnetList);

		return studentListJSON;

	}

	@RequestMapping(value = "/BranchListOfInstitute", method = RequestMethod.GET)
	@ResponseBody
	public String BranchListOfInstitute(@ModelAttribute("teacher") Teacher teacher) {
		System.out.println("**********inside BranchListOfInstitute controller**********");
		System.out.println("teachers insitute id is :" + teacher.getInstitute().getId());

		Institute inst = teacherService.GetInstitute(teacher.getId());
		System.out.println("institute is :" + inst);

		List<Branch> branchlist = branchService.getallOfParticularInstitute(inst);
		System.out.println("we are going to print the branches of current isntitute :");
		for (Branch b : branchlist) {
			System.out.println(b);
		}

		String branchListJSON = gson.toJson(branchlist);
		System.out.println(branchListJSON);

		return branchListJSON;

	}

	@RequestMapping(value = "/changeTUsername", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	@ResponseBody
	public String changeTUsername(@ModelAttribute("teacher") Teacher teacher,
			@RequestBody HashMap<String, String> requestData,Model model) {
		System.out.println("**********inside changeTUsername controller**********");
		String response = "";
		String currentUsername = requestData.get("currentUsername");
		String NewUserName = requestData.get("NewUsername");
		String existName = teacher.getLogin().getUsername();
		System.out.println("response created");

		try {
			if (existName.equals(currentUsername)) {
				teacherService.changeUserName(NewUserName, teacher.getLogin());
				System.out.println("success name changed");
				response = "{\"status\":\"success\",\"teacher\":" + gson.toJson(teacher) + "}";
				System.out.println("work fine");
				
				teacher.getLogin().setUsername(NewUserName);
				 model.addAttribute("teacher",teacher);
				System.out.println(response.toString());
				return response = "{\"status\":\"Success\"}";
			} else {
				response = "{\"status\":\"failed\",\"cause\":\"not_valid_current_username\"}";

			}
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			response = "{\"status\":\"failed\"}";

		}
		System.out.println("works Fine:" + response);
		return response;
	}

	@RequestMapping(value = "/changeTPassword", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	@ResponseBody
	public String changeTPassword(@ModelAttribute("teacher") Teacher teacher,
			@RequestBody HashMap<String, String> requestData,Model model) {
		System.out.println("**********inside changeTPassword controller**********");
		String response = "";
		String CurrentPassword = requestData.get("CurrentPassword");
		String NewPassword = requestData.get("NewPassword");
		String RePassword = requestData.get("RePassword");
		
			String existPassword = teacher.getLogin().getPassword();
			System.out.println(CurrentPassword);
			System.out.println(NewPassword);
			System.out.println(RePassword);
			System.out.println(existPassword);

			if (existPassword.equals(CurrentPassword)) {
				System.out.println("existPassword equals CurrentPassword");
				teacherService.changePassword(NewPassword, teacher.getLogin());
				teacher.getLogin().setPassword(NewPassword);
				 model.addAttribute("teacher",teacher);
				return response = "{\"status\":\"Success\"}";
			} else {
				System.out.println("existPassword not equals CurrentPassword");
				
				 response = "{\"status\":\"failed\",\"cause\":\"not_valid_current_Password\"}";
				 System.out.println(response);
				 return response;

			}
		
		// return response = "{\"status\":\"failed\"}";

	}
	


	@RequestMapping(value = "/updateTeacher", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	@ResponseBody
	public String updateTeacher(@ModelAttribute("teacher") Teacher teacher1, @RequestBody Teacher teacher2,
			Model model) {
		System.out.println("**********this is updateTeacher controller suraj**********");
		teacher1.setFname(teacher2.getFname());
		teacher1.setLname(teacher2.getLname());
		teacher1.setEmail(teacher2.getEmail());
		teacher1.setContactno(teacher2.getContactno());
		String response = "";
		try {
			teacherService.update(teacher1);
			response = "{\"status\":\"success\",\"teacher\":" + gson.toJson(teacher1) + "}";
			model.addAttribute("teacher", teacher1);
			model.addAttribute("teacherJSON", gson.toJson(teacher1));

		} catch (Exception e) {
			response = "{\"status\":\"fail\"}";
		}
		System.out.println(response);
		return response;
	}

	
	

	@RequestMapping(value = "/GetStudentOfDivision/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String GetStudentOfDivision(@PathVariable("id") int DivID) {
		System.out.println("**********inside GetStudentOfDivision controller**********");

		System.out.println(DivID);
		String studentListJSON = "";

		try {
			System.out.println("in try");
			List<Student> studentList = StudentService.findByDivId(DivID);
			for (Student s : studentList) {
				System.out.println(s.getFname() + " " + s.getLname());
			}

			studentListJSON = gson.toJson(studentList);

			if (studentList.isEmpty()) {
				studentListJSON = "{\"ErrorMessage\":\"Selected division does not contain any student\"}";
			} else {
				studentListJSON = gson.toJson(studentList);
			}
		} catch (Exception e) {
			studentListJSON = "{\"ErrorMessage\":\"Selected division does not contain any student\"}";

			e.printStackTrace();
		}

		System.out.println(studentListJSON);

		return studentListJSON;
	}

	

	@RequestMapping(value = "/GetClassesListInJSON/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String GetClassesListINJSON(@PathVariable("id") int id) {

		System.out.println("**********from GetClassesListINJSON controller**********");

		List<Classes> classList = classesService.getallOfParticularBranch(branchService.find(id));

		String classesListJSON = gson.toJson(classList);

		System.out.println(classesListJSON);

		return classesListJSON;
	}

	@RequestMapping(value = "/GetDivisionListInJSON/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String GetDivisionListInJSON(@PathVariable("id") int id) {

		System.out.println("**********from GetDivisionListInJSON controller**********");
		System.out.println(id);
		List<Division> divisionList = divisionService.getallOfParticularClass(classesService.find(id));

		String divisionListJSON = gson.toJson(divisionList);

		System.out.println(divisionListJSON);

		return divisionListJSON;
	}

	@RequestMapping(value = "/GetStudentOfDivisionInJSON", method = RequestMethod.POST)
	@ResponseBody
	public String GetStudentOfDivisionInJSON(@RequestBody Division division) {
		System.out.println("**********inside GetStudentOfDivisionInJSON controller**********");

		System.out.println(division);
		String studentListJSON = "";

		try {
			System.out.println("in try");
			List<Student> studentList = StudentService.findByDivId(division.getId());
			for (Student s : studentList) {
				System.out.println(s.getFname() + " " + s.getLname());
			}

			studentListJSON = gson.toJson(studentList);

			if (studentList.isEmpty()) {
				studentListJSON = "{\"ErrorMessage\":\"Selected division does not contain any student\"}";
			} else {
				studentListJSON = gson.toJson(studentList);
			}
		} catch (Exception e) {
			studentListJSON = "{\"ErrorMessage\":\"Selected division does not contain any student\"}";

			e.printStackTrace();
		}

		System.out.println(studentListJSON);

		return studentListJSON;
	}

	@RequestMapping(value = "/DeleteSelectedStudentFromDivision", method = RequestMethod.POST)
	@ResponseBody
	public String DeleteSelectedStudentFromDivision(@RequestBody ArrayList<Student> studentList) {
		System.out.println("**********inside DeleteSelectedStudentFromDivision controller**********");
		System.out.println(studentList);
		for (Student s : studentList) {
			System.out.println(s.getFname() + " " + s.getId());

			StudentService.deleteSelectedFromDiv(s.getId());
		}

		/*
		 * System.out.println(); ObjectMapper mapper = new ObjectMapper(); JSONObject
		 * jsonObj = new JSONObject(json);
		 */

		return "";
	}

	@RequestMapping(value = "/AddSelectedStudentToDivision/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String AddSelectedStudentToDivision(@PathVariable("id") int id,
			@RequestBody ArrayList<Student> studentList) {
		System.out.println("**********inside AddSelectedStudentToDivision controller**********");

		Division division = divisionService.find(id);
		System.out.println("division name is " + division.getName());

		for (Student s : studentList) {
			System.out.println(s.getFname());
			StudentService.SetDivisionId(s.getId(), id);
		}
		System.out.println(division.getName());
		return gson.toJson(division);
	}

	

	@RequestMapping(value = "/GetExamsOFInstitute/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String GetExamsOFInstitute(@PathVariable("id") int InstituteId) {
		System.out.println("**********inside GetExamsOFInstitute controller**********");
		List<Exam> examList = examService.getallOfParticularInstitute(InstituteId);

		String JSON = "[";
		for (Exam e : examList) {
			JSON += "{";
			JSON += "\"id\":" + e.getId() + ",";
			JSON += "\"examMode\":";
			JSON += "{";
			JSON += "\"id\":" + e.getExamMode().getId() + "},";
			JSON += "\"examType\":";
			JSON += "{";
			JSON += "\"id\":" + e.getExamType().getId() + "},";
			JSON += "\"discription\":\"" + e.getDiscription() + "\",";

			JSON += "\"outOf\":" + e.getOutOf() + ",";
			JSON += "\"passingMarks\":" + e.getPassingMarks() + ",";
			JSON += "\"regular\":" + e.getRegular() + "";
			JSON += "},";

		}

		JSON = JSON.substring(0, JSON.length() - 1);
		JSON += "]";

		System.out.println(JSON);

		return JSON;
	}

	@RequestMapping(value = "/GetExamsMode", method = RequestMethod.POST)
	@ResponseBody
	public String GetExamsMode() {
		System.out.println("**********inside GetExamsMode controller**********");
		List<ExamMode> examModeList = examModeService.getAll();
		String JSONexamModeList = gson.toJson(examModeList);
		// System.out.println(JSONexamModeList);
		return JSONexamModeList;
	}

	@RequestMapping(value = "/GetExamsType", method = RequestMethod.POST)
	@ResponseBody
	public String GetExamsType() {
		System.out.println("**********inside GetExamsType controller**********");
		List<ExamType> examTypeList = examTypeService.getAll();
		String JSONexamTypeList = gson.toJson(examTypeList);
		// System.out.println(JSONexamTypeList);
		return JSONexamTypeList;
	}

	@RequestMapping(value = "/SaveExam/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String SaveExam(@RequestBody Exam e, @PathVariable("id") int InstituteId) {
		System.out.println("**********inside SaveExam controller**********");
		e.setInstitute(instituteService.find(InstituteId));

		examService.create(e);
		String JSON = "";
		JSON += "{";
		JSON += "\"id\":" + e.getId() + ",";
		JSON += "\"examMode\":";
		JSON += "{";
		JSON += "\"id\":" + e.getExamMode().getId() + "},";
		JSON += "\"examType\":";
		JSON += "{";
		JSON += "\"id\":" + e.getExamType().getId() + "},";
		JSON += "\"discription\":\"" + e.getDiscription() + "\",";

		JSON += "\"outOf\":" + e.getOutOf() + ",";
		JSON += "\"passingMarks\":" + e.getPassingMarks() + ",";
		JSON += "\"regular\":" + e.getRegular() + "";
		JSON += "}";

		return JSON;
	}

	@RequestMapping(value = "/DeleteExam/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String DeleteExam(@PathVariable("id") int ExamId) {
		System.out.println("**********inside DeleteExam controller**********");

		String result = "";
		Exam e = examService.find(ExamId);
		result = "{";
		result += "\"message\":\"success\"";
		result += "}";

		try {
			examService.delet(e);
		} catch (Exception exception) {
			result = "{";
			result += "\"message\":\"failed\"";
			result += "}";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/UpdateExam/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String UpdateExam(@RequestBody Exam e, @PathVariable("id") int InstituteId) {
		System.out.println("**********inside UpdateExam controller**********");
		e.setInstitute(instituteService.find(InstituteId));
		examService.update(e);

		String JSON = "";
		JSON += "{";
		JSON += "\"id\":" + e.getId() + ",";
		JSON += "\"examMode\":";
		JSON += "{";
		JSON += "\"id\":" + e.getExamMode().getId() + "},";
		JSON += "\"examType\":";
		JSON += "{";
		JSON += "\"id\":" + e.getExamType().getId() + "},";
		JSON += "\"discription\":\"" + e.getDiscription() + "\",";

		JSON += "\"outOf\":" + e.getOutOf() + ",";
		JSON += "\"passingMarks\":" + e.getPassingMarks() + ",";
		JSON += "\"regular\":" + e.getRegular() + "";
		JSON += "}";
		System.out.println(JSON);

		return JSON;
	}

	@RequestMapping(value = "/GetSubjectDivCompIDResult/{examId}", method = RequestMethod.POST)
	@ResponseBody
	public String GetSubjectDivCompIDResult(@PathVariable("examId") int examId) {
		System.out.println("**********inside GetSubjectDivCompID controller**********");
		List<SubjectDivComposit> subjectDivCompList = examSubStudCompService.findByExamId(examId);

		String JSON = "[";

		for (SubjectDivComposit s : subjectDivCompList) {
			System.out.println("\n SubDivID : " + s.getId());
		}

		for (SubjectDivComposit s : subjectDivCompList) {
			JSON += "{";
			JSON += "\"id\":" + s.getId();
			JSON += "},";

		}

		JSON = JSON.substring(0, JSON.length() - 1);
		JSON += "]";

		System.out.println(JSON);

		return JSON;
	}

	@RequestMapping(value = "/GetSubjectDivCompID/{examId}", method = RequestMethod.POST)
	@ResponseBody
	public String GetSubjectDivCompID(@PathVariable("examId") int examId) {
		System.out.println("**********inside GetSubjectDivCompID controller**********");
		List<SubjectDivComposit> subjectDivCompList = examSubStudCompService.findByExamId(examId);

		String JSON = "[";

		for (SubjectDivComposit s : subjectDivCompList) {
			System.out.println("\n SubDivID : " + s.getId());
		}

		for (SubjectDivComposit s : subjectDivCompList) {
			JSON += "{";
			JSON += "\"id\":" + s.getId();
			JSON += "},";

		}

		JSON = JSON.substring(0, JSON.length() - 1);
		JSON += "]";

		System.out.println(JSON);

		return JSON;
	}

	@RequestMapping(value = "/GetStudentListNotInExamJSON/{subDivId}/{divId}/{examId}", method = RequestMethod.POST)
	@ResponseBody
	public String GetStudentListNotInExamJSON(@PathVariable("subDivId") int subDivId, @PathVariable("divId") int divId,
			@PathVariable("examId") int examId) {
		System.out.println("**********inside GetStudentListNotInExamJSON controller**********");

		String studentListNotExamJSON = "";
		System.out.println("sub_divComposit id : " + subDivId);
		System.out.println("div id : " + divId);
		System.out.println("exam id : " + examId);
		List<Student> studentNotInExamList = new ArrayList<Student>();

		try {

			List<Student> allStudentOfDivisionList = StudentService.findByDivId(divId);
			List<Student> studentOfExamList = examSubStudCompService.findByExamId(examId, subDivId);

			String match = "";

			for (Student examStudent : studentOfExamList) {
				System.out.println("student id: " + examStudent.getId());
			}

			for (Student allStudent : allStudentOfDivisionList) {
				match = "false";
				for (Student examStudent : studentOfExamList) {
					if (allStudent.getId() == examStudent.getId()) {
						match = "true";
						break;
					}
				}

				if (match.equals("false")) {
					studentNotInExamList.add(allStudent);
				}
			}

			studentListNotExamJSON = gson.toJson(studentNotInExamList);

			if (studentNotInExamList.isEmpty()) {
				studentListNotExamJSON = "{\"ErrorMessage\":\"Selected subject having all students\"}";
			} else {
				studentListNotExamJSON = gson.toJson(studentNotInExamList);
			}
		} catch (Exception e) {
			studentListNotExamJSON = "{\"ErrorMessage\":\"Selected subject having all students\"}";

			e.printStackTrace();
		}

		System.out.println(studentListNotExamJSON);

		return studentListNotExamJSON;
	}

	@RequestMapping(value = "/GetStudentListOfExamJSON/{subDivId1}/{examId1}", method = RequestMethod.POST)
	@ResponseBody
	public String GetStudentListOfExamJSON(@PathVariable("subDivId1") int subDivId1,
			@PathVariable("examId1") int examId1) {
		System.out.println("**********inside GetStudentListOfExamJSON controller**********");

		String studentListOfExamJSON = "";
		System.out.println("sub_divComposit id : " + subDivId1);
		System.out.println("exam id : " + examId1);

		try {

			List<Student> studentInExamList = examSubStudCompService.findByExamId(examId1, subDivId1);

			for (Student examStudent : studentInExamList) {
				System.out.println("student id: " + examStudent.getId());
			}

			studentListOfExamJSON = gson.toJson(studentInExamList);

			if (studentInExamList.isEmpty()) {
				studentListOfExamJSON = "{\"ErrorMessage\":\"Selected exam doesn't contain students for selected subject \"}";
			} else {
				studentListOfExamJSON = gson.toJson(studentInExamList);
			}
		} catch (Exception e) {
			studentListOfExamJSON = "{\"ErrorMessage\":\"Selected exam doesn't contain students for selected subject catch\"}";

			e.printStackTrace();
		}

		System.out.println(studentListOfExamJSON);

		return studentListOfExamJSON;
	}

	@RequestMapping(value = "/addSelectedStudentToExam/{subDivId}/{examId}/{divId}", method = RequestMethod.POST)
	@ResponseBody
	public String AddStudentInExam(@PathVariable("subDivId") int subDivId, @PathVariable("examId") int examId,
			@PathVariable("divId") int divId, @RequestBody ArrayList<Student> studentList) {
		System.out.println("**********inside AddStudentInExam controller**********");
		String studentListNotExamJSON = "";
		List<Student> studentNotInExamList = new ArrayList<Student>();

		try {
			ExamSubjectStudentCompositTable examStudSubObj = examSubStudCompService.findByExamSubDivId(examId,
					subDivId);

			for (Student stud : studentList) {
				examStudSubObj.setStudent(stud);
				examSubStudCompService.create(examStudSubObj);
			}

			List<Student> allStudentOfDivisionList = StudentService.findByDivId(divId);
			List<Student> studentOfExamList = examSubStudCompService.findByExamId(examId, subDivId);

			String match = "";

			for (Student allStudent : allStudentOfDivisionList) {
				match = "false";
				for (Student examStudent : studentOfExamList) {
					if (allStudent.getId() == examStudent.getId()) {
						match = "true";
						break;
					}
				}

				if (match.equals("false")) {
					studentNotInExamList.add(allStudent);
				}
			}

			studentListNotExamJSON = gson.toJson(studentNotInExamList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return studentListNotExamJSON;
	}

	@RequestMapping(value = "/deleteSelectedStudentFromExam/{subDivId1}/{examId1}/{divId1}", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSelectedStudentFromExam(@PathVariable("subDivId1") int subDivId1,
			@PathVariable("examId1") int examId1, @PathVariable("divId1") int divId1,
			@RequestBody ArrayList<Student> studentList) {
		System.out.println("**********inside deleteSelectedStudentFromExam controller**********");
		System.out.println("sub_divComposit id : " + subDivId1);
		System.out.println("div id : " + divId1);
		System.out.println("exam id : " + examId1);
		String studentListJSON = gson.toJson(studentList);
		System.out.println(studentListJSON);

		try {
			for (Student examStudent : studentList) {
				System.out.println("student id: " + examStudent.getId());
				examSubStudCompService.deletStudentFromExam(examStudent.getId(), subDivId1, examId1);
			}

			List<Student> studentInExamList = examSubStudCompService.findByExamId(examId1, subDivId1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	@RequestMapping(value = "/deleteSubjectFromDivision/{subId}/{divId}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteSubjectFromDivision(@PathVariable("subId") int subId, @PathVariable("divId") int divId) {

		System.out.println("**********from deleteSubjectFromDivision controller**********");

		String result = "";
		System.out.println("subject to be deleted is with id" + subId);
		try {
			Subject s = subjectService.find(subId);
			System.out.println("name of the subject is " + s.getName());

			subjectDivCompositService.deleteByDivId(subId, divId);

			System.out.println("Subject is deleted with the id " + subId);
			result = "{\"message\":\"Subject with id " + subId + " is deleted \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			System.out.println("error in deletion with Subject id : " + subId);
			result = "{\"message\":\"ERROR...!! subject with id " + subId + " not deleted\",\"status\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/GetSubjectNotInDivisionInJSON", method = RequestMethod.POST)
	@ResponseBody
	public String GetSubjectNotInDivisionInJSON(@RequestBody Division division,
			@ModelAttribute("teacher") Teacher teacher) {
		System.out.println("**********inside Get Subject Not In Division controller**********");

		Institute inst = teacherService.GetInstitute(teacher.getId());
		int instituteId = inst.getId();
		System.out.println(division);
		System.out.println(instituteId);

		String subjectListNotInDivJSON = "";

		List<Subject> subjectNotInDivList = new ArrayList<Subject>();

		try {

			List<Subject> subjectList = subjectDivCompositService.findByDivId(division.getId());
			List<Subject> allSubjectOfInstituteList = subjectService.getallOfInstitute(instituteId);

			String match = "";

			for (Subject allSubject : allSubjectOfInstituteList) {
				match = "false";
				for (Subject divSubject : subjectList) {
					if (allSubject.getId() == divSubject.getId()) {
						match = "true";
						break;
					}
				}

				if (match.equals("false")) {
					subjectNotInDivList.add(allSubject);
				}
			}

			subjectListNotInDivJSON = gson.toJson(subjectNotInDivList);

			if (subjectNotInDivList.isEmpty()) {
				subjectListNotInDivJSON = "{\"ErrorMessage\":\"Selected division having all subjects\"}";
			} else {
				subjectListNotInDivJSON = gson.toJson(subjectNotInDivList);
			}
		} catch (Exception e) {
			subjectListNotInDivJSON = "{\"ErrorMessage\":\"Selected division having all subjects\"}";

			e.printStackTrace();
		}

		System.out.println(subjectListNotInDivJSON);

		return subjectListNotInDivJSON;
	}

	

	

	@RequestMapping(value = "/GetSubjectOfDivisionInJSON", method = RequestMethod.POST)
	@ResponseBody
	public String GetSubjectOfDivisionInJSON(@RequestBody Division division) {
		System.out.println("**********inside GetSubjectOfDivisionInJSON controller**********");

		System.out.println(division);
		String subjectListJSON = "";

		try {
			System.out.println("in try");
			List<Subject> subjectList = subjectDivCompositService.findByDivId(division.getId());

			for (Subject s : subjectList) {
				System.out.println(s.getName());
			}

			subjectListJSON = gson.toJson(subjectList);

			if (subjectList.isEmpty()) {
				subjectListJSON = "{\"ErrorMessage\":\"Selected division does not contain any subject\"}";
			} else {
				subjectListJSON = gson.toJson(subjectList);
			}
		} catch (Exception e) {
			subjectListJSON = "{\"ErrorMessage\":\"Selected division does not contain any subject\"}";

			e.printStackTrace();
		}

		System.out.println(subjectListJSON);

		return subjectListJSON;
	}

	@RequestMapping(value = "/addSubjectToDivision/{subId}/{divId}/{instId}", method = RequestMethod.POST)
	@ResponseBody
	public String addSubjectToDivision(@PathVariable("subId") int subId, @PathVariable("divId") int divId,
			@PathVariable("instId") int instId) {

		System.out.println("**********from addSubjectToDivision controller**********");

		System.out.println("subject to be added is with id" + subId);
		String subjectListNotInDivJSON = "";
		try {
			Subject sub = subjectService.find(subId);
			System.out.println("name of the subject is " + sub.getName());

			Division div = divisionService.find(divId);
			System.out.println("name of the division is " + div.getName());

			SubjectDivComposit sdc = new SubjectDivComposit(div, sub);
			subjectDivCompositService.create(sdc);

			List<Subject> subjectListOfDiv = subjectDivCompositService.findByDivId(divId);
			List<Subject> allSubjectOfInstituteList = subjectService.getallOfInstitute(instId);
			List<Subject> subjectNotInDivList = new ArrayList<Subject>();

			for (Subject s : subjectListOfDiv) {
				System.out.println(s.getName());
			}

			System.out.println("\nInstitute subject");
			for (Subject s : allSubjectOfInstituteList) {
				System.out.println(s.getName());
			}

			String match = "";

			for (Subject allSubject : allSubjectOfInstituteList) {
				match = "false";
				for (Subject divSubject : subjectListOfDiv) {
					if (allSubject.getId() == divSubject.getId()) {
						match = "true";
						break;
					}
				}

				if (match.equals("false")) {
					subjectNotInDivList.add(allSubject);
				}
			}

			System.out.println("\nSubject not in division");
			for (Subject s : subjectNotInDivList) {
				System.out.println(s.getName());
			}

			System.out.println("Subject is added with the id " + subId);

			subjectListNotInDivJSON = gson.toJson(subjectNotInDivList);

			// result="{\"message\":\"Subject with id "+subId+" is added
			// \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			System.out.println("error in adding with Subject id : " + subId);
			// result="{\"message\":\"ERROR...!! subject with id "+subId+" not
			// added\",\"status\":\"fail\"}";
		}
		System.out.println(subjectListNotInDivJSON);
		return subjectListNotInDivJSON;
	}

	@RequestMapping(value = "/GetSubjectListofInstituteInJSON/{instId}", method = RequestMethod.POST)
	@ResponseBody
	public String GetSubjectListofInstituteInJSON(@PathVariable("instId") int instId) {
		System.out.println("**********inside Get Subject of particular institute controller**********");

		System.out.println(instId);

		String subjectListOfInstituteJSON = "";

		try {

			List<Subject> allSubjectOfInstituteList = subjectService.getallOfInstitute(instId);

			subjectListOfInstituteJSON = gson.toJson(allSubjectOfInstituteList);

			if (allSubjectOfInstituteList.isEmpty()) {
				subjectListOfInstituteJSON = "{\"ErrorMessage\":\"Selected Institute does not contain any subjects\"}";
			} else {
				subjectListOfInstituteJSON = gson.toJson(allSubjectOfInstituteList);
			}
		} catch (Exception e) {
			subjectListOfInstituteJSON = "{\"ErrorMessage\":\"Selected Institute does not contain any subjects\"}";

			e.printStackTrace();
		}

		System.out.println(subjectListOfInstituteJSON);

		return subjectListOfInstituteJSON;
	}

	@RequestMapping(value = "/deleteSubjectFromInstitute/{subId}/{instId}", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSubjectFromInstitute(@PathVariable("subId") int subId, @PathVariable("instId") int instId) {

		System.out.println("**********from deleteSubjectFromInstitute controller**********");

		String subjectListOfInstituteAfterDeletJSON = "";

		System.out.println("subject to be deleted is with id" + subId);
		try {
			Subject s = subjectService.find(subId);
			System.out.println("name of the subject is " + s.getName());

			subjectService.deleteFromInstitute(subId);

			List<Subject> allSubjectOfInstituteList = subjectService.getallOfInstitute(instId);
			subjectListOfInstituteAfterDeletJSON = gson.toJson(allSubjectOfInstituteList);
			System.out.println(subjectListOfInstituteAfterDeletJSON);

			System.out.println("Subject is deleted with the id " + subId);
			// subjectListOfInstituteAfterDeletJSON="{\"message\":\"Subject with id
			// "+subId+" is deleted \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			System.out.println("error in deletion with Subject id : " + subId);
			// subjectListOfInstituteAfterDeletJSON="{\"message\":\"ERROR...!! subject with
			// id "+subId+" not deleted\",\"status\":\"fail\"}";
		}
		System.out.println(subjectListOfInstituteAfterDeletJSON);
		return subjectListOfInstituteAfterDeletJSON;
	}

	@RequestMapping(value = "/GetSubjectTreeStruct/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String GetSubjectTreeStruct(@PathVariable("id") int InstituteId) {
		System.out.println("**********inside GetSubjectTreeStruct controller**********");

		String JSON = instituteService.GetSubjectTree(InstituteId);
		System.out.println(JSON);
		return JSON;
	}

	@RequestMapping(value = "/addSubjectToInstitute/{subName}/{subDescript}/{instId}", method = RequestMethod.POST)
	@ResponseBody
	public String addSubjectToInstitute(@PathVariable("subName") String subName,
			@PathVariable("subDescript") String subDescript, @PathVariable("instId") int instId) {

		System.out.println("**********from addSubjectToInstitute controller**********");

		String result = "";

		System.out.println("subject to be added is with name " + subName + " in institute with id " + instId);
		try {
			Institute inst = instituteService.find(instId);
			System.out.println(inst.getName());

			Subject sub = new Subject(inst, subName, subDescript);

			subjectService.create(sub);

			System.out.println("Subject is added with the name " + subName);
			result = "{\"message\":\"Subject with name " + subName + " is added \",\"status\":\"success\"}";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			System.out.println("error in add with Subject name : " + subName);
			result = "{\"message\":\"ERROR...!! subject with name " + subName + " not added\",\"status\":\"fail\"}";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/UpdateSubject/{instId}", method = RequestMethod.POST)
	@ResponseBody
	public String UpdateSubject(@RequestBody Subject sub, @PathVariable("instId") int InstituteId) {
		System.out.println("**********inside UpdateSubject controller**********");
		sub.setInstitute(instituteService.find(InstituteId));
		subjectService.update(sub);

		String JSON = "";
		JSON += "{";
		JSON += "\"id\":" + sub.getId() + ",";
		JSON += "\"name\":\"" + sub.getName() + "\",";
		JSON += "\"discription\":\"" + sub.getDiscription() + "\"";
		JSON += "}";
		System.out.println(JSON);

		return JSON;
	}

	@RequestMapping(value = "/AddSubjectToExam", method = RequestMethod.POST)
	@ResponseBody
	public String AddSubjectToExam(@RequestBody List<ExamSubjectStudentCompositTable> examSubjectStudentSubList) {
		System.out.println("**********inside AddSubjectToExam controller**********");

		String JSON = "";
		java.util.Date dt = new java.util.Date();

		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String currentTime = sdf.format(dt);

		try {
			for (ExamSubjectStudentCompositTable examSubjectStudentSub : examSubjectStudentSubList) {
				/*
				 * System.out.println("examsubdivcomp "+examSubjectStudentSub+"exam id:"
				 * +examSubjectStudentSub.getExam().getId()+" subdiv id "+examSubjectStudentSub.
				 * getSubjectDivComposit().getId());
				 */
				System.out.println(examSubjectStudentSub);
				System.out.println(examSubjectStudentSub.getExam().getId());
				System.out.println(examSubjectStudentSub.getSubjectDivComposit().getId());

				examSubStudCompService.create(examSubjectStudentSub);
			}
			JSON = "{\"message\":\"success\"}";
		} catch (Exception e) {
			JSON = "{\"message\":\"failed to save subjects to exam\"}";
			e.printStackTrace();

		}
		return JSON;
	}

	@RequestMapping(value = "/sendSMS/{contactNo}", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@PathVariable("contactNo") String contactNo,
			@RequestParam("sms") String text) {

		System.out.println("**********from sendSMS/{contactNo} controller**********");
		String result = "";
		try {
			String pubId = snsService.sendSMSMessage(text, contactNo);
			result = "{\"status\":\"success\",\"pubid\":\"" + pubId + "\"}";
		} catch (Exception e) {
			result = "{\"status\":\"fail\",\"message\":\"failed to send sms\"}";
			
			e.printStackTrace();

		}
		System.out.println(result);

		return result;
	}
	
	@RequestMapping(value = "/sendSMSSubjectResult", method = RequestMethod.POST)
	@ResponseBody
	public String sendSMSSubjectResult(
			@RequestBody String text) {

		System.out.println("**********from sendSMSSubjectResult controller**********");
		String result = "";
		
		System.out.println(text);
		
		JsonElement element = gson.fromJson(text, JsonElement.class);
		
		JsonArray  jarray =  element.getAsJsonArray();
	
		for(Object o : jarray){
			 JsonObject jsonLineItem = (JsonObject) o;
	
			 String studentName=null;
			 String obtainedMarks=null;
			 String outOfMarks=null;
			 String remarks=null;
			 String examName=null;
			 String subjectName=null;
			 String contactNo=null;
		     String	message=null;
			 
			if(jsonLineItem.get("studentSelected") != null){
			 JsonObject student =(JsonObject) jsonLineItem.get("student");
			 JsonObject studentResult =(JsonObject) jsonLineItem.get("result");
			 JsonObject exam=(JsonObject) jsonLineItem.get("exam");
			 JsonObject examSubjectStudentComp=(JsonObject) jsonLineItem.get("examSubjectStudentCompositTable");
			 JsonObject SubDivComp=(JsonObject) jsonLineItem.get("SubDivComp");
			 
			  studentName=stringUtil.removeFirstLastChar(student.get("fname").toString());
			  obtainedMarks=studentResult.get("obtainedMarks").toString();
			  outOfMarks=examSubjectStudentComp.get("outOfMarks").toString();
			  remarks=stringUtil.removeFirstLastChar(studentResult.get("remarks").toString());
			  examName=stringUtil.removeFirstLastChar(exam.get("discription").toString());
			  String subDivId=SubDivComp.get("id").toString();
			  subjectName=subjectDivCompositService.findSubjectName(Integer.parseInt(subDivId));
			
			  contactNo="+91"+stringUtil.removeFirstLastChar(student.get("contactno").toString());
			  message="Hi "+studentName+", You got "+obtainedMarks+" out of "+outOfMarks+" marks in "+subjectName+" subject for "+examName+". Remark : you "+remarks+".";
			 
			  try {
					String pubId = snsService.sendSMSMessage(message, contactNo);
					result = "{\"status\":\"success\",\"pubid\":\"" + pubId + "\"}";
				  } catch (Exception e) {
					result = "{\"status\":\"fail\",\"message\":\"failed to send sms\"}";
					e.printStackTrace();
                  }
			  
			  System.out.println(message);
			  System.out.println(contactNo);
		}
			
		if(jsonLineItem.get("parentSelected") != null){
			 JsonObject student =(JsonObject) jsonLineItem.get("student");
			 JsonObject studentResult =(JsonObject) jsonLineItem.get("result");
			 JsonObject exam=(JsonObject) jsonLineItem.get("exam");
			 JsonObject examSubjectStudentComp=(JsonObject) jsonLineItem.get("examSubjectStudentCompositTable");
			 JsonObject SubDivComp=(JsonObject) jsonLineItem.get("SubDivComp");
			 
			 String studId=student.get("id").toString();
			 Parent p=parentService.findByStudentId(Integer.parseInt(studId));
			
			 studentName=stringUtil.removeFirstLastChar(student.get("fname").toString());
			 obtainedMarks=studentResult.get("obtainedMarks").toString();
			 outOfMarks=examSubjectStudentComp.get("outOfMarks").toString();
			 remarks=stringUtil.removeFirstLastChar(studentResult.get("remarks").toString());
			 examName=stringUtil.removeFirstLastChar(exam.get("discription").toString());
			 String subDivId=SubDivComp.get("id").toString();
			 subjectName=subjectDivCompositService.findSubjectName(Integer.parseInt(subDivId));
			 
			  contactNo="+91"+p.getContactno();
			  message="Hi "+p.getFname()+" "+p.getLname()+",Your child "+studentName+" got "+obtainedMarks+" out of "+outOfMarks+" marks in "+subjectName+" subject for "+examName+". Remark : He is "+remarks+".";
		
			  try {
					String pubId = snsService.sendSMSMessage(message, contactNo);
					result = "{\"status\":\"success\",\"pubid\":\"" + pubId + "\"}";
				  } catch (Exception e) {
					result = "{\"status\":\"fail\",\"message\":\"failed to send sms\"}";
					e.printStackTrace();
                  }
			  
			  System.out.println(message);
			  System.out.println(contactNo);
			
				 //parentSelected=jsonLineItem.get("parentSelected").toString();
			
			}
		/*	 System.out.println(studentSelected);
			 System.out.println(parentSelected);
			 
			 JsonElement examSubjectStudentCompositTable =jsonLineItem.get("examSubjectStudentCompositTable");
			 JsonElement Result =jsonLineItem.get("result");
			 JsonElement student =jsonLineItem.get("student");
			 System.out.println(examSubjectStudentCompositTable.toString());
			 System.out.println(Result.toString());
			 System.out.println(student.toString());*/
		}
		return result;
	}

	@RequestMapping(value = "/ExamSubjectStudentResult", method = RequestMethod.GET)
	@ResponseBody
	public String resultStudentList(@RequestParam("examId") int examId, @RequestParam("subDivId") int subDivId) {

		System.out.println("**********from resultStudentList controller**********");
		String result = examSubStudCompService.examSubjectStudentResult(examId, subDivId);
		System.out.println(result);

		return result;
	}
	
	@RequestMapping(value = "/smsSubjectStudentResult", method = RequestMethod.GET)
	@ResponseBody
	public String smsSubjectStudentResult(@RequestParam("examId") int examId, @RequestParam("subDivId") int subDivId) {

		System.out.println("**********from smsSubjectStudentResult controller**********");
		String result = resultService.smsSubjectStudentResult(examId, subDivId);
		System.out.println(result);

		return result;
	}

	@RequestMapping(value = "/GetInstituteTreeStruct/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String GetInstituteTreeStruct(@PathVariable("id") int InstituteId) {
		System.out.println("**********inside GetInstituteTreeStruct controller**********");

		String JSON = instituteService.GetInstituteTree(InstituteId);
		System.out.println(JSON);
		return JSON;
	}

	@RequestMapping(value = "/TreeStructureSujectsNotInExam/{InstId}/{ExamId}", method = RequestMethod.POST)
	@ResponseBody
	public String TreeStructureSujectsNotInExam(@PathVariable("InstId") int InstId,
			@PathVariable("ExamId") int ExamId) {
		System.out.println("**********inside TreeStructureSujectsNotInExam/{InstId}/{ExamId} controller**********");

		String JSON = instituteService.TreeStructureSujectsNotInExam(InstId, ExamId);
		System.out.println(JSON);
		return JSON;
	}

	@RequestMapping(value = "/TreeStructureSujectsOfExam/{InstId}/{ExamId}", method = RequestMethod.POST)
	@ResponseBody
	public String TreeStructureSujectsOfExam(@PathVariable("InstId") int InstId, @PathVariable("ExamId") int ExamId) {
		System.out.println("**********inside TreeStructureSujectsOfExam/{InstId}/{ExamId} controller**********");

		String JSON = instituteService.TreeStructureSujectsOFExam(InstId, ExamId);
		System.out.println(JSON);
		return JSON;
	}

	@RequestMapping(value = "/DeleteSubjectsFromExam/{ExamId}", method = RequestMethod.POST)
	@ResponseBody
	public String DeleteSubjectsFromExam(@RequestBody List<Integer> subdivIds, @PathVariable("ExamId") int ExamId) {
		System.out.println("**********inside DeleteSubjectsFromExam/{ExamId} controller**********");
		Integer count = 0;
		StringBuffer sb = new StringBuffer();
		sb.append("\"FailedToDelet\":[");
		for (Integer subDivId : subdivIds) {
			try {
				examSubStudCompService.deletSubjectFromExam(ExamId, subDivId);
				count++;
			} catch (Exception e) {
				sb.append(subDivId + ",");
			}
		}
		sb.append("]");

		if (sb.lastIndexOf(",") != -1) {
			sb.deleteCharAt(sb.lastIndexOf(","));
		}
		;

		String JSON = "{\"status\":\"success\",\"SuccessCount\":" + count + "," + sb.toString() + "}";
		System.out.println(JSON);
		return JSON;
	}
	 
	
	@RequestMapping(value = "/UpdateResult", method = RequestMethod.POST)
	@ResponseBody
	public String UpdateResult(@RequestBody HashMap<String, HashMap<String, String>> requestData) {
		System.out.println("**********inside UpdateResult controller**********");
		
		HashMap<String, String> customerInfo = requestData.get("StudentList");
		
		
		for(Map.Entry<String, String> entry: customerInfo.entrySet()){    
			String key=entry.getKey();  
			String b=entry.getValue();  
	        System.out.println(key+" Details: " +key +" : "+b);  
		}
	    //TODO now do whatever you want to do.
		
		String JSON ="";
		System.out.println(JSON);
		return JSON;
		
	}

}
