package com.adeaw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.adeaw.dao.UserDaoImpl;
import com.adeaw.service.ApplicationContextProvider;

@Controller
@SessionAttributes("loginSession")
public class DocumentController {

	@RequestMapping(value = "/new_eaform", method = RequestMethod.GET)
    public String newEaFormRequest(ModelMap model) {
        model.addAttribute("mainPage", "new_eaform.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/new_payslip", method = RequestMethod.GET)
    public String newPayslipRequest(ModelMap model) {
        model.addAttribute("mainPage", "new_payslip.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/eaform_list", method = RequestMethod.GET)
    public String eaFormListRequest(ModelMap model) {
        model.addAttribute("mainPage", "eaform_list.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/payslip_list", method = RequestMethod.GET)
    public String payslipListRequest(ModelMap model) {
        model.addAttribute("mainPage", "payslip_list.jsp");
		return "skeleton";
	}
	
	@RequestMapping(value = "/upload_eaform", method = RequestMethod.POST)
	@ResponseBody
    public String deleteUser(@RequestParam String dates, @RequestParam String eaformFile, ModelMap model) {
		System.out.println("dates: "+dates+", eaform File: "+eaformFile);
        model.addAttribute("mainPage", "eaform_list.jsp");
		return "skeleton";
	}
}
