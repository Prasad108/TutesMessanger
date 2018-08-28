package com.app.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.app.pojo.Login;
import com.app.service.RoleService;

@Controller
public class Template {

	@Autowired
	RoleService roleService;
	
	private static final Logger LOGGER = Logger.getLogger(Template.class);

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String templateIndex() {
		LOGGER.info("***************inside index controller***************");
		return "template/index";
	}

	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String errorPage() {
		LOGGER.info("***************inside 404 controller***************");
		return "template/404";
	}

	@RequestMapping(value = "/basic_table", method = RequestMethod.GET)
	public String basic_table() {
		LOGGER.info("***************inside basic_table controller***************");
		return "template/basic_table";
	}

	@RequestMapping(value = "/buttons", method = RequestMethod.GET)
	public String buttons() {
		LOGGER.info("***************inside buttons controller***************");
		return "template/basic_table";
	}

	@RequestMapping(value = "/chart-chartjs", method = RequestMethod.GET)
	public String chartchartjs() {
		LOGGER.info("***************inside chart-chartjs controller***************");
		return "template/chart-chartjs";
	}

	@RequestMapping(value = "/form_component", method = RequestMethod.GET)
	public String form_component() {
		LOGGER.info("***************inside form_component controller***************");
		return "template/form_component";
	}

	@RequestMapping(value = "/form_validation", method = RequestMethod.GET)
	public String form_validation() {
		LOGGER.info("***************inside form_validation controller***************");
		return "template/form_validation";
	}

	@RequestMapping(value = "/general", method = RequestMethod.GET)
	public String general() {
		LOGGER.info("***************inside general controller***************");
		return "template/general";
	}

	@RequestMapping(value = "/grids", method = RequestMethod.GET)
	public String grids() {
		LOGGER.info("***************inside grids controller***************");
		return "template/grids";
	}

	/*
	 * @RequestMapping(value="/login",method = RequestMethod.GET) public String
	 * login(){ LOGGER.info("inside login controller"); return
	 * "template/login"; }
	 */

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		LOGGER.info("***************inside profile controller***************");
		return "template/profile";
	}

	@RequestMapping(value = "/blank", method = RequestMethod.GET)
	public String blank() {
		LOGGER.info("***************inside widgets controller***************");
		return "template/blank";
	}

	@RequestMapping(value = "/widgets", method = RequestMethod.GET)
	public String widgets() {
		LOGGER.info("***************inside widgets controller***************");
		return "template/widgets";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Login l, HttpSession session, Model model,
			RedirectAttributes redirectAttributes) {
		LOGGER.info("*************** This is login controller **********************");

		model.addAttribute("Login", l);
		if (error != null) {
			LOGGER.info("Invalid username and password!");
			model.addAttribute("error", "Invalid username and password!");
		}
		if (logout != null) {
			LOGGER.info("You've been logged out successfully.!!");
			model.addAttribute("msg", "You've been logged out successfully.");
		}

		/* model.setViewName("login"); */

		return "login";

	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpSession session, Model model) {
		LOGGER.info("*************** This is logout controller **********************");

		LOGGER.info("You've been logged out successfully.!!!");
		model.addAttribute("msg", "You've been logged out successfully.");
		model.asMap().clear();
		session.invalidate();
		model.asMap().clear();

		return "login";

	}

}
