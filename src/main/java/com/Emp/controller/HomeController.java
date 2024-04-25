package com.Emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;
import com.Emp.Dao.Emp_dao;
import com.Emp.entities.Emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private Emp_dao emp_dao;

	@RequestMapping("/home")
	public String home(Model m) {
		m.addAttribute("employee", emp_dao.selectall());

		return "home";
	}

	@RequestMapping("/add_emp")
	public String addemp() {
		return "add_emp";
	}

	@RequestMapping("/handle-emp")
	public RedirectView handleemp(@ModelAttribute Emp emp, HttpServletRequest request, HttpSession session) {
		System.out.println("EMp added"+emp);
		emp_dao.add_emp(emp);
		session.setAttribute("msg", "Register Sucessfully");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/add_emp");
		return redirectView;
	}

	@RequestMapping("/delete/{id}")
	public RedirectView show(@PathVariable("id") int id, HttpServletRequest request, HttpSession session) {
		emp_dao.delete(id);
		session.setAttribute("msg", "Deleted successfully");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/home");
		return redirectView;
	}

	@RequestMapping("/update/{id}")
	public String updateemp(@PathVariable int id, Model m) {
		Emp emp = emp_dao.select_single(id);
		m.addAttribute("e", emp);
		return "update";
	}

	@RequestMapping(path = "/update-emp", method = RequestMethod.POST)
	public RedirectView update(@ModelAttribute Emp e, HttpSession session, HttpServletRequest request) {
		emp_dao.update(e);
		session.setAttribute("msg", "UPDATED Successfully");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/home");
		return redirectView;
	}

}
