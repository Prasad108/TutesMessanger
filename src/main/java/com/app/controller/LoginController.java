package com.app.controller;

import java.security.Principal;

import org.apache.log4j.Logger;
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
	 
	 final static Logger logger = Logger.getLogger(LoginController.class);

	@RequestMapping(value = "/gologin", method = RequestMethod.GET)
	public String goToLogin(Model mod, Login l) {
		mod.addAttribute("Login", l);
		logger.info("**********inside gologin controller**********");

		return "login";

	}


	@RequestMapping(value = "/redirectToHome", method = RequestMethod.GET)
	public String redirectToHome(Model model,Authentication authentication,Principal principal,RedirectAttributes redirectAttributes) {

		//logger.info("*************** this is from redirectToHome controller **************");
		logger.info("*************** this is from redirectToHome controller **************");
		logger.debug("*************** this is from redirectToHome controller **************");
		logger.error("*************** this is from redirectToHome controller **************");
		logger.warn("*************** this is from redirectToHome controller **************");
		//logger.info("login credentials are " + login.toString());
		String output = "hello";
		

		logger.info("user name is : "+principal.getName());
		
		logger.info("authentication name is "+authentication.getName());
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username =authentication.getName();
		//List<GrantedAuthority> AUTHORITIES =(List<GrantedAuthority>) userDetails.getAuthorities();
		
		logger.info("user has "+userDetails.getAuthorities().size()+"authorities ");
		for(GrantedAuthority auth :userDetails.getAuthorities())
		{
			String auth12=auth.getAuthority();
			logger.info("user authority area ::"+auth12);
		}
		logger.info("User has authorities: " + userDetails.getAuthorities());
		
		
		
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
					logger.info("student logged in is "+student+" and its JSON obj is "+gson.toJson(student));
					logger.info("student logged in");
					break;

				case 2:
					logger.info("inside case 2--------------------------------------");
					logger.info("Teacher logged in");
			
					
				case 3://institute admin
					logger.info("inside case 3--------------------------------------");
					output = "Teacher/"; // ** institute admin					
					Teacher t1=teacherService.findByLoginId(userLogin.getId());																					
					Permissions p=permissionsService.find(t1.getPermissions().getId());					
																	
				
					logger.info(gson.toJson(teacherService.GetInstitute(t1.getId())));
					logger.info(gson.toJson(userLogin));
					logger.info(gson.toJson(p));
					t1.setPermissions(p);
					t1.setInstitute(teacherService.GetInstitute(t1.getId()));
					t1.setLogin(userLogin);
					
					logger.info("teacher is __________--------"+gson.toJson(t1));					
					
					redirectAttributes.addFlashAttribute("teacher",t1 );					
					redirectAttributes.addFlashAttribute("teacherJSON",gson.toJson(t1));
					redirectAttributes.addFlashAttribute("institute",gson.toJson(teacherService.GetInstitute(t1.getId())) );				
					redirectAttributes.addFlashAttribute("permissions",gson.toJson(p) );				
					logger.info("institute admin logged in");
					break;

				case 4:
					output = "AppAdmin/";// app Admin
					logger.info("admin logged in");
					break;

				case 5:
					output = "template/index";// app Admin
					logger.info("template logged in");
					break;

				default:
				
					logger.info("error in login incorect role logged in");
					output = "hello";
					break;
				}
						
						
					
				output="redirect:/"+output;
		
		return output;
	}

	
	@RequestMapping(value = { "/"}, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView welcomePage(Authentication authentication,Principal principal) {
		logger.info("*************** This is default controller **********************");
		
		
		ModelAndView model = new ModelAndView();		
		model.setViewName("login");
		return model;

	}
	
	@RequestMapping(value = { "/welcome**" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView defaultPage(Authentication authentication,Principal principal) {
		logger.info("*************** This is welcome controller **********************");
		
		logger.info("user name is : "+principal.getName());
		
		logger.info("authentication name is "+authentication.getName());
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		logger.info("User has authorities: " + userDetails.getAuthorities());
		
	
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminPage(Authentication authentication,Principal principal) {
		logger.info("*************** This is admin controller **********************");
		
			ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	
	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView accesssDenied(Authentication authentication,Principal principal) {
		logger.info("*************** This is 403 controller **********************");
		
		

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			logger.info(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}
	
}

// comment by rahul pr