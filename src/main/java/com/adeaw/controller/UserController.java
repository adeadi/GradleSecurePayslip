package com.adeaw.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.adeaw.dao.UserDaoImpl;
import com.adeaw.model.User;
import com.adeaw.service.ApplicationContextProvider;

@Controller
@SessionAttributes("loginSession")
public class UserController {
	@RequestMapping(value = "/add_user_request", method = RequestMethod.GET)
    public String addUserRequest(ModelMap model) {
		model.addAttribute("user",new User());
        model.addAttribute("mainPage", "new_user.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/add_user", method = RequestMethod.POST)
	public String addUser(@Valid User user, BindingResult result, ModelMap model) {
		UserDaoImpl userDao = ApplicationContextProvider.getApplicationContext().getBean("userDao", UserDaoImpl.class);
		if(userDao.insertUser(user)){
			model.addAttribute("successMessage", "User successfully created!");
			model.addAttribute("user",new User());
		} else {
			model.addAttribute("errorMessage", "User ID is duplicate!");
		};
		model.addAttribute("mainPage", "new_user.jsp");
	    return "skeleton";
	}
	
	@RequestMapping(value = "/manage_user_request", method = RequestMethod.GET)
    public String manageUserRequest(ModelMap model) {
		UserDaoImpl userDao = ApplicationContextProvider.getApplicationContext().getBean("userDao", UserDaoImpl.class);
		List<User> users = userDao.getAllStaff();
		model.addAttribute("users", users);
		model.addAttribute("user",new User());
        model.addAttribute("mainPage", "manage_user.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/delete_user", method = RequestMethod.POST)
	@ResponseBody
    public String deleteUser(@RequestParam String id, ModelMap model) {
		UserDaoImpl userDao = ApplicationContextProvider.getApplicationContext().getBean("userDao", UserDaoImpl.class);
		userDao.deleteUser(id);
        model.addAttribute("mainPage", "manage_user.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/update_user", method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model) {
		UserDaoImpl userDao = ApplicationContextProvider.getApplicationContext().getBean("userDao", UserDaoImpl.class);
		if(userDao.updateUser(user)){
			model.addAttribute("successMessage", "User successfully updated!");
			model.addAttribute("user",new User());
			List<User> users = userDao.getAllStaff();
			model.addAttribute("users", users);
		} else {
			model.addAttribute("errorMessage", "Something happened! user unable to update!");
		};
		model.addAttribute("mainPage", "manage_user.jsp");
	    return "skeleton";
	}
}
