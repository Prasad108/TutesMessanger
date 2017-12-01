package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Division;
import com.app.pojo.Institute;
import com.app.pojo.Student;
import com.app.pojo.Teacher;
import com.app.pojo.Schedule;
import com.app.service.ScheduleService;

@Controller
@RequestMapping("/Student")
@SessionAttributes({ "teacher", "appAdmin", "student","institute","login","permissions","teacherJSON","studentJSON" })
public class StudentController {
	
	

	@Autowired
	ScheduleService scheduleService;
	 
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


	
}
