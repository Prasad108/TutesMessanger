package com.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Division;
import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Teacher;
import com.app.pojo.Schedule;
import com.app.service.ScheduleService;
import com.app.service.TeacherService;
import com.app.service.StudentService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/Student")
@SessionAttributes({ "teacher", "appAdmin", "student","institute","login","permissions","teacherJSON","studentJSON" })
public class StudentController {
	
	Gson gson = new Gson();

	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	StudentService studentService;
	 
	 @RequestMapping(value="/Home",method = RequestMethod.GET)  
	    public String  ViewInstitueStructure(Model model,@ModelAttribute("student") Student student) {  
	    	
		 System.out.println("**********this is from Student Home Controller controller**********");	    	
		
		 		 
	        return "Student/Home";
	    }
	 
	 @RequestMapping(value="/Schedule",method = RequestMethod.GET)  
	    public String  Schedule(Model model,@ModelAttribute("student") Student student) {  
	    	
		 System.out.println("**********this is from Student Schedule Controller controller**********");	    
		 		 
			try {
				
				Integer i=student.getDivision().getId();
				System.out.println("Division id is "+i);
			
				
				try {
					Schedule schedule = scheduleService.fordivision(i);
					if (!schedule.getString().isEmpty()) {
						model.addAttribute("schedule", schedule.getString());
						System.out.println("schedule added to model");
		
					} else {
						model.addAttribute("scheduleNotFound", "For Your Division Schedule is not uploaded");
						System.out.println("schedule not found for divisino");
					}
				}
				catch(Exception e3)
				{
					model.addAttribute("scheduleNotFound", "For Your Division Schedule is not uploaded");
					System.out.println("schedule not found for divisino");
					System.out.println("cathced the exception  3");
				}
				
			}
			catch(Exception e2) {
				System.out.println("cathced the exception  e23");
				
				model.addAttribute("scheduleErrorNoDivisionAssigned", "Student do not have any division");
				
				
			}
	 
	        return "Student/Schedule";
	    }


	 	@RequestMapping(value="/studentShowProfile")
	 	public String studentShowProfile(Model model)
	 	{
	 		 System.out.println("**********this is StudentShowProfile controller**********");	    	
			 return "Student/showProfile"; 
	 	}
	 	
	 	@RequestMapping(value="/studentEditProfile")
	 	public String studentEditProfile(Model model) 
	    {
		 System.out.println("**********this is studentEditProfile controller**********");	 
		 model.addAttribute("EditStudent", new Student());
		 return "Student/editProfile";
        }
	 	
	 	
	 	@RequestMapping(value="/editStudent",method = RequestMethod.POST)
	 	public String editTeacher(Model model,@ModelAttribute("student") Student student1,@ModelAttribute("EditTeacher") Student student2) 
	 {
		 System.out.println("**********this is editStudent controller**********");
		 student1.setFname(student2.getFname());
		 student1.setLname(student2.getLname());
		 student1.setEmail(student2.getEmail());
		 student1.setContactno(student2.getContactno());
		 
		 studentService.update(student1);
		 model.addAttribute("student",student1);
		 model.addAttribute("studentJSON",gson.toJson(student1));
		 
		 model.addAttribute("profileEditSuccess","Your profile updated successfully");
		
		 return "Student/showProfile";
     }
	 	
	 	
	 	@RequestMapping("/studentChangePassword")
	 	public String changePasswordShow(Model map) 
	    {
		 System.out.println("**********this is studentChangePassword controller**********");	    	
		 
		 String oldPassword = "a", newPassword = "a";
		 map.addAttribute("oldPassword",oldPassword);
		 map.addAttribute("newPassword", newPassword);
		 return "Student/changePassword";
	    }
	 	
	 	
	 	@RequestMapping(value = "/changeSPassword", method = RequestMethod.POST)
		public String changeSPassword(@ModelAttribute("student") Student student,HttpServletRequest request,Model model) 
	 	{		
			System.out.println("**********inside changeStudentPassword controller**********");
			String currentPassword=request.getParameter("currentPassword");
			String newPassword=request.getParameter("newPassword");
			
			String existPassword=student.getLogin().getPassword();
			
			System.out.println("from form "+currentPassword +" from studentobject"+existPassword);
			System.out.println("new username "+newPassword);
			if(existPassword.equals(currentPassword) )
			{
				studentService.changePassword(newPassword,student.getLogin());	
				model.addAttribute("passwordChangeSuccess","password successfully updated");
				student.getLogin().setPassword(newPassword);
				model.addAttribute("student", student);
			}
			else
			{
				model.addAttribute("wrongPassword","You have entered wrong current Password");
			}
			
			return "Student/changePassword";

		}
	 	
	 	
	 	@RequestMapping(value = "/changeSUsername", method = RequestMethod.POST)
		public String changeTUsername(@ModelAttribute("student") Student student,HttpServletRequest request,Model model) {		
			System.out.println("**********inside changeStudentUsername controller**********");
			String currentUserName=request.getParameter("currentUsername");
			String newUserName=request.getParameter("newUsername");
			String existName=student.getLogin().getUsername();
			
			System.out.println("from form "+currentUserName +" from studentobject"+existName);
			System.out.println("new username "+newUserName);
			if(existName.equals(currentUserName) )
			{
				studentService.changeUserName(newUserName,student.getLogin());	
				model.addAttribute("userNameChangeSuccess","username successfully updated");
				student.getLogin().setUsername(newUserName);
				model.addAttribute("student",student);
			}
			else
			{
				model.addAttribute("wrongCurrentUserName","You have entered wrong current Username");
			}
			
			return "Student/changePassword"; 

		}
}
