package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.pojo.Login;
import com.app.pojo.Permissions;
import com.app.pojo.Role;
import com.app.pojo.Teacher;
import com.app.service.InstituteService;
import com.app.service.LoginService;
import com.app.service.PermissionsService;
import com.app.service.TeacherService;
import com.google.gson.Gson;

@Controller
@SessionAttributes({ "teacher", "appAdmin", "student","institute","login","permissions","teacherJSON" })
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	TeacherService teacherService;

	@Autowired
	InstituteService instituteService;
	

	@Autowired
	PermissionsService permissionsService;
	
	 Gson gson = new Gson();

	@RequestMapping(value = "/gologin", method = RequestMethod.GET)
	public String goToLogin(Model mod, Login l) {
		mod.addAttribute("Login", l);
		System.out.println("inside gologin controller");

		return "login";

	}

	@RequestMapping(value = "/Checklogin", method = RequestMethod.POST)
	public String login(Model model, @ModelAttribute("login") Login login, Login l) {

		System.out.println("this is from Checklogin controller");
		//System.out.println("login credentials are " + login.toString());
		String output = "";
		if (loginService.exist(login)) {
			System.out.println("**********such a user exists ");
						
			Login userLogin = loginService.find_By_Uname_pwd(login);

			if(loginService.Isenabled(userLogin)) {
				Role userRole = userLogin.getRole();
				int roleId = userRole.getId();
				switch (roleId) {
				case 1:
					output = "hello";// student
					System.out.println("student logged in");
					break;

				case 2:
					// ** Teacher 
					output = "Teacher/home"; 		
					Teacher t=teacherService.findByLoginId(userLogin.getId());	
					//t1.setLogin(userLogin);				
					Permissions p1=permissionsService.find(t.getPermissions().getId());
					t.setPermissions(p1);
					t.setInstitute(teacherService.GetInstitute(t.getId()));
					t.setLogin(userLogin);
					model.addAttribute("teacher",t);
					model.addAttribute("teacherJSON",gson.toJson(t));
					model.addAttribute("institute",gson.toJson(t) );
					//model.addAttribute("login",gson.toJson(userLogin) );
					model.addAttribute("permissions",gson.toJson(p1) );
					System.out.println("teacher logged in");
					break;
					
				case 3:
					System.out.println("inside case 3--------------------------------------");
					output = "Teacher/home"; // ** institute admin					
					Teacher t1=teacherService.findByLoginId(userLogin.getId());																					
					Permissions p=permissionsService.find(t1.getPermissions().getId());					
									
					
					//t1.setLogin(userLogin);			
					//t1.setPermissions(p);
					//t1.setInstitute(teacherService.GetInstitute(t1.getId()));
					//t1.setLogin(userLogin);
					
					
				
					System.out.println(gson.toJson(teacherService.GetInstitute(t1.getId())));
					System.out.println(gson.toJson(userLogin));
					System.out.println(gson.toJson(p));
					t1.setPermissions(p);
					t1.setInstitute(teacherService.GetInstitute(t1.getId()));
					t1.setLogin(userLogin);
					
					System.out.println("teacher is __________--------"+gson.toJson(t1));
					
					model.addAttribute("teacher",t1 );					
					model.addAttribute("teacherJSON",gson.toJson(t1));
					model.addAttribute("institute",gson.toJson(teacherService.GetInstitute(t1.getId())) );
					//model.addAttribute("login",gson.toJson(userLogin) );
					model.addAttribute("permissions",gson.toJson(p) );
					System.out.println("institute admin logged in");
					break;

				case 4:
					output = "appAdmin/dashboard";// app Admin
					System.out.println("admin logged in");
					break;

				case 5:
					output = "template/index";// app Admin
					System.out.println("template logged in");
					break;

				default:
					model.addAttribute("message", login.toString());
					System.out.println("error in login incorect role logged in");
					output = "hello";
					break;
				}
						
						
						
					}else
					{
						System.out.println("user is blocked due to not having permissions");

						model.addAttribute("ErrorMessage", "Your Accont is not Active Please contact Your Application Admin");
						model.addAttribute("Login", l);
						output = "login";
						
					}
					
			
		} else {
			System.out.println("**************no such a user");

			model.addAttribute("ErrorMessage", "Username or Password incorrect");
			model.addAttribute("Login", l);
			output = "login";
		}
		return output;
	}

}

// comment by rahul pr