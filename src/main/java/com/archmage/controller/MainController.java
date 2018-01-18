package com.archmage.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.archmage.dao.UserInfoDao;
import com.archmage.model.Contact;

@Controller
public class MainController {
	
	@Autowired
	private UserInfoDao userInfoDao;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(
	            dateFormat, false));
	}
	
	@RequestMapping(value={"/", "/welcome"}, method=RequestMethod.GET)
	public String welcomePage(Model model) {
		model.addAttribute("title", "Welcome");
		model.addAttribute("message", "This is welcome page");
		model.addAttribute("contacts", userInfoDao.getAllContact());
		return "welcomePage";
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminPage(Model model) {
		return "adminPage";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(Model model) {
		return "loginPage";
	}
	
	@RequestMapping(value="/logoutSuccessful", method=RequestMethod.GET)
	public String logoutSuccessful(Model model) {
		model.addAttribute("title", "Logout");
		return "logoutSuccessfulPage";
	}
	
	@RequestMapping(value="/userInfo", method=RequestMethod.GET)
	public String userInfo(Model model, Principal principal) {
		String userName = principal.getName();
		model.addAttribute("message", userName);
		System.out.println("username: " +userName);
		return "userInfoPage";
	}
	
	@RequestMapping(value="/forbidden", method=RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {
		if (principal != null) {
			model.addAttribute("message", "Hi " + principal.getName()
			+ "<br> You do not have permission to access this page");
		}
		else {
			model.addAttribute("msg", "You do not have permission to access this page");
		}
		return "forbiddenPage";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String newContact(Model model, Principal principal) {
		String userName = principal.getName();
		model.addAttribute("createdbypage", userName);
		model.addAttribute("lastupdatedbypage", userName);
		model.addAttribute("contact", new Contact());
		return "newContact";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute("contact") Contact contact, Principal principal) {
		System.out.println("creating contact: " + contact);
		if (contact == null) {
			return new ModelAndView("redirect:/");
		}
		else if (contact != null && contact.getContactId() == 0) {
			contact.setCreatedBy(principal.getName());
			contact.setCreatedDate(new Date());
			userInfoDao.createContact(contact);
		}
		else {
			contact.setLastUpdatedBy(principal.getName());
			contact.setLastUpdatedDate(new Date());
			userInfoDao.updateContact(contact);
		}
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String existingContact(@PathVariable int id, Model model) {
		model.addAttribute("contactId", id);
		model.addAttribute("contact", userInfoDao.getContactById(id));
		return "updateContact";
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.POST)
	public ModelAndView updateContact(@PathVariable int id, HttpServletRequest request, 
			@ModelAttribute("contact") Contact contact, Principal principal) {
		System.out.println("updating contact: " + contact);
		if (contact == null) {
			return new ModelAndView("redirect:/");
		}
		else if (contact != null && contact.getContactId() == 0) {
			contact.setCreatedBy(principal.getName());
			contact.setCreatedDate(new Date());
			userInfoDao.createContact(contact);
		}
		else {
			contact.setLastUpdatedBy(principal.getName());
			contact.setLastUpdatedDate(new Date());
			userInfoDao.updateContact(contact);
		}
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public ModelAndView deleteContact(@PathVariable int id) {
		userInfoDao.deleteContact(id);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value="/chat", method=RequestMethod.GET)
	public String getChatPage(Model model, Principal principal) {
		String userName = principal.getName();
		model.addAttribute("message", userName);
		System.out.println("username: " +userName);
		return "preChatPage";
	}
}
