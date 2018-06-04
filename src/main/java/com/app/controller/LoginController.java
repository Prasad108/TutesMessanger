package com.app.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.MessageAttributeValue;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;*/
import com.app.pojo.Institute;
import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Student;
import com.app.pojo.Teacher;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.PermissionsService;
import com.app.service.StudentService;
import com.app.service.TeacherService;
import com.google.gson.Gson;

@Controller
@SessionAttributes({ "teacher", "appAdmin", "student","institute","login","permissions","teacherJSON","studentJSON" })
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	TeacherService teacherService;

	@Autowired
	InstituteService instituteService;
	

	@Autowired
	PermissionsService permissionsService;
	
	@Autowired
	StudentService StudentService;
	
	 Gson gson = new Gson();

	@RequestMapping(value = "/gologin", method = RequestMethod.GET)
	public String goToLogin(Model mod, Login l) {
		mod.addAttribute("Login", l);
		System.out.println("**********inside gologin controller**********");

		return "login";

	}


	@RequestMapping(value = "/redirectToHome", method = RequestMethod.GET)
	public String redirectToHome(Model model,Authentication authentication,Principal principal,RedirectAttributes redirectAttributes) {

		System.out.println("*************** this is from redirectToHome controller **************");
		//System.out.println("login credentials are " + login.toString());
		String output = "hello";
		

		System.out.println("user name is : "+principal.getName());
		
		System.out.println("authentication name is "+authentication.getName());
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username =authentication.getName();
		//List<GrantedAuthority> AUTHORITIES =(List<GrantedAuthority>) userDetails.getAuthorities();
		
		System.out.println("user has "+userDetails.getAuthorities().size()+"authorities ");
		for(GrantedAuthority auth :userDetails.getAuthorities())
		{
			String auth12=auth.getAuthority();
			System.out.println("user authority area ::"+auth12);
		}
		System.out.println("User has authorities: " + userDetails.getAuthorities());
		
		
		
				Login userLogin = loginService.findByUsername(authentication.getName());
				Role userRole = userLogin.getRole();
				int roleId = userRole.getId();
				switch (roleId) {
				case 1:
					output = "Student/Home";// student
					Student student= StudentService.findByLoginId(userLogin.getId());
					student.setLogin(userLogin);
					Institute inst= StudentService.GetInstitute(student.getId());
					student.setInstitute(inst);
					
					redirectAttributes.addFlashAttribute("student",student );					
					redirectAttributes.addFlashAttribute("studentJSON",gson.toJson(student));
					System.out.println("student logged in is "+student+" and its JSON obj is "+gson.toJson(student));
					System.out.println("student logged in");
					break;

				case 2:
					System.out.println("inside case 2--------------------------------------");
					System.out.println("Teacher logged in");
			
					
				case 3://institute admin
					System.out.println("inside case 3--------------------------------------");
					output = "Teacher/"; // ** institute admin					
					Teacher t1=teacherService.findByLoginId(userLogin.getId());																					
					Permissions p=permissionsService.find(t1.getPermissions().getId());					
																	
				
					System.out.println(gson.toJson(teacherService.GetInstitute(t1.getId())));
					System.out.println(gson.toJson(userLogin));
					System.out.println(gson.toJson(p));
					t1.setPermissions(p);
					t1.setInstitute(teacherService.GetInstitute(t1.getId()));
					t1.setLogin(userLogin);
					
					System.out.println("teacher is __________--------"+gson.toJson(t1));					
					
					redirectAttributes.addFlashAttribute("teacher",t1 );					
					redirectAttributes.addFlashAttribute("teacherJSON",gson.toJson(t1));
					redirectAttributes.addFlashAttribute("institute",gson.toJson(teacherService.GetInstitute(t1.getId())) );				
					redirectAttributes.addFlashAttribute("permissions",gson.toJson(p) );				
					System.out.println("institute admin logged in");
					break;

				case 4:
					output = "AppAdmin/";// app Admin
					System.out.println("admin logged in");
					break;

				case 5:
					output = "template/index";// app Admin
					System.out.println("template logged in");
					break;

				default:
				
					System.out.println("error in login incorect role logged in");
					output = "hello";
					break;
				}
						
						
					
				output="redirect:/"+output;
		
		return output;
	}

	
	@RequestMapping(value = { "/"}, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView welcomePage(Authentication authentication,Principal principal) {
		System.out.println("*************** This is default controller **********************");
		
		
		ModelAndView model = new ModelAndView();		
		model.setViewName("login");
		return model;

	}
	
	@RequestMapping(value = { "/welcome**" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView defaultPage(Authentication authentication,Principal principal) {
		System.out.println("*************** This is welcome controller **********************");
		
		System.out.println("user name is : "+principal.getName());
		
		System.out.println("authentication name is "+authentication.getName());
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println("User has authorities: " + userDetails.getAuthorities());
		
	
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminPage(Authentication authentication,Principal principal) {
		System.out.println("*************** This is admin controller **********************");
		
			ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	
	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView accesssDenied(Authentication authentication,Principal principal) {
		System.out.println("*************** This is 403 controller **********************");
		
		

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}
	
}

// comment by rahul pr