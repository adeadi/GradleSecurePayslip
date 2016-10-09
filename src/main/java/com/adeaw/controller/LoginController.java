package com.adeaw.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adeaw.dao.MenuDaoImpl;
import com.adeaw.dao.UserDaoImpl;
import com.adeaw.model.LoginSession;
import com.adeaw.model.Menu;
import com.adeaw.model.User;
import com.adeaw.service.ApplicationContextProvider;

@Controller
@SessionAttributes("loginSession")
public class LoginController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
		UserDaoImpl userDao = ApplicationContextProvider.getApplicationContext().getBean("userDao", UserDaoImpl.class);
		User user = userDao.getUserDetails(getPrincipal());
		
		MenuDaoImpl menuDao = ApplicationContextProvider.getApplicationContext().getBean("menuDao", MenuDaoImpl.class);
		
		List<Object[]> listMenu = menuDao.getMenuByUserRole(user.getUserRole().getId());
		List<Menu> parentMenu = new ArrayList<Menu>();
		List<Menu> subMenu = new ArrayList<Menu>();
		for (Object[] object : listMenu) {
			Menu menu = (Menu) object[0];
			if (menu.getParentId() == 0) {
				parentMenu.add(menu);
			} else {
				subMenu.add(menu);
			}
		}
		
		LoginSession loginSession = new LoginSession();
		loginSession.setUser(getPrincipal());
		loginSession.setParentMenu(parentMenu);
		loginSession.setSubMenu(subMenu);

		model.addAttribute("loginSession", loginSession);
		model.addAttribute("user",new User());
        model.addAttribute("mainPage", "new_user.jsp");
        return "skeleton";
    }
 
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/index.jsp?logout";
    }
    
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("errorMessage","Invalid Username or Password");
        return "../../index";
    }
    
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
        return userName;
    }
 

}
