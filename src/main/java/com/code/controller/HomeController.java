package com.code.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelExtensionsKt;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.code.dao.UserRegistrationDao;
import com.code.model.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Collections;

@Controller
public class HomeController {
	@Autowired
	private User user;
	int user_id = 0;
	@Autowired
	private UserRegistrationDao userRegistrationDao;
	
	@RequestMapping("/")
	public String mainPage() {
		if(user_id == 0) return "login";
		else return "home";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping("/validate")
	public String validateEmailAddress(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			user = userRegistrationDao.findByUsername(username);
			boolean checkPassword = BCrypt.checkpw(password, user.getPassword());
			if(!checkPassword) {
				model.addAttribute("error","Invalid login credentials");
				return "login";
			}
			
			user_id = userRegistrationDao.getUserId(username);
			model.addAttribute("user",user);
			
			return "redirect:/main";
		} catch(Exception e) {
			model.addAttribute("error","Invalid login credentials");
			return "login";
		}
	}
	
	@RequestMapping("/register")
	public String userRegistrationPage() {
		return "register";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout() {
		user_id = 0;
		System.out.println("test logout");
		return "redirect:/login";
	}
	
	@RequestMapping(value="/saveUser", method=RequestMethod.POST)
	public String validate(Model model, @RequestParam("username")
	String username, @RequestParam("password") String password) {

		user.setUsername(username);
		String salt = BCrypt.gensalt(10);
		String epassword = BCrypt.hashpw(password,salt);
		user.setPassword(epassword);
		
		String temp_username = username;
		List<User> listOfUsernames = userRegistrationDao.listOfUsernames();
		boolean checker = false;
		for(User user : listOfUsernames) {
			if(temp_username.equals(user.getUsername())==true)
				checker = true;
		}
		if(checker == false) {
			int result = userRegistrationDao.saveUserRegistration(user);
			if(result > 0) {
				System.out.println("Successfully saved the data...");
			}
			//successful login
			return "login";
		}
		else {
			model.addAttribute("errorUsername","Username already exists");
			return "register";
		}
	}
	
	@RequestMapping("/test_functions")
	public String testFunctionsPage() {
		return "test_functions";
	}
	
	@RequestMapping(value="/addBalance", method=RequestMethod.POST)
	public String addBalance(Model model, @RequestParam("amount") int amount, @RequestParam("type") String type,
			@RequestParam("category") String category) {
		int updated_amount = 0;
		
		if(type.equals("Cash")) {
			int temp_cash = userRegistrationDao.getCashBalance(user_id);
			updated_amount = temp_cash + amount;
			userRegistrationDao.updateCashBalance(user_id, updated_amount);
		}
		else if(type.equals("Online Funds")) {
			int temp_online_funds = userRegistrationDao.getOnlineFundsBalance(user_id);
			updated_amount = temp_online_funds + amount;
			userRegistrationDao.updateOnlineFundsBalance(user_id, updated_amount);
		}
		
		user.setUserId(user_id);
		
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Calendar obj = Calendar.getInstance();
		String date = formatter.format(obj.getTime());
		user.setTxn_date(date); 
		
		user.setAmount(amount);
		user.setCategory(category);
		user.setIn_out("in");
		userRegistrationDao.saveTxn(user);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/deductBalance", method=RequestMethod.POST)
	public String deductBalance(Model model, @RequestParam("amount") int amount, @RequestParam("type") String type,
			@RequestParam("category") String category) {
		int updated_amount = 0;
		
		if(type.equals("Cash")) {
			int temp_cash = userRegistrationDao.getCashBalance(user_id);
			updated_amount = temp_cash - amount;
			userRegistrationDao.updateCashBalance(user_id, updated_amount);
		}
		else if(type.equals("Online Funds")) {
			int temp_online_funds = userRegistrationDao.getOnlineFundsBalance(user_id);
			updated_amount = temp_online_funds - amount;
			userRegistrationDao.updateOnlineFundsBalance(user_id, updated_amount);
		}
		
		user.setUserId(user_id);

		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Calendar obj = Calendar.getInstance();
		String date = formatter.format(obj.getTime());
		user.setTxn_date(date); 
		
		user.setAmount(amount);
		user.setCategory(category);
		user.setIn_out("out");
		userRegistrationDao.saveTxn(user);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/transferBalance", method=RequestMethod.POST)
	public String transferBalance(Model model, @RequestParam("cashflow") String cashflow, @RequestParam("amount") int amount) {
		int updated_cash = 0;
		int updated_online_funds = 0;
		
		int temp_cash = userRegistrationDao.getCashBalance(user_id);
		int temp_online_funds = userRegistrationDao.getOnlineFundsBalance(user_id);
		
		if(cashflow.equals("From cash to online funds")) {
			updated_cash = temp_cash - amount;
			updated_online_funds = temp_online_funds + amount;
		}
		else if(cashflow.equals("From online funds to cash")) {
			updated_cash = temp_cash + amount;
			updated_online_funds = temp_online_funds - amount;
		}
		
		userRegistrationDao.updateCashBalance(user_id, updated_cash);
		userRegistrationDao.updateOnlineFundsBalance(user_id, updated_online_funds);
		return "redirect:/main";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String getTxnList(Model model) {
		List<User> listOfTxn = userRegistrationDao.getListOfTxn(user_id);
		Collections.reverse(listOfTxn);
		model.addAttribute("listOfTxn",listOfTxn);
		
		user = userRegistrationDao.findById(user_id);
		model.addAttribute("user",user);
		
		int bills=0, food=0, transportation=0, leisure=0, health=0, others_out=0;
		int salary=0, commissions=0, investment_profits=0, business_profits=0, gift=0, others_in=0;
		
		List<User> totalBills = userRegistrationDao.getTotalAmountPerCategory("Bills", user_id);
		for(User user : totalBills) {
			bills += user.getAmount();
		}
		model.addAttribute("bills",bills);
		
		List<User> totalFood = userRegistrationDao.getTotalAmountPerCategory("Food", user_id);
		for(User user : totalFood) {
			food += user.getAmount();
		}
		model.addAttribute("food",food);
		
		List<User> totalTransportation = userRegistrationDao.getTotalAmountPerCategory("Transportation", user_id);
		for(User user : totalTransportation) {
			transportation += user.getAmount();
		}
		model.addAttribute("transportation",transportation);
		
		List<User> totalLeisure = userRegistrationDao.getTotalAmountPerCategory("Leisure", user_id);
		for(User user : totalLeisure) {
			leisure += user.getAmount();
		}
		model.addAttribute("leisure",leisure);
		
		List<User> totalHealth = userRegistrationDao.getTotalAmountPerCategory("Health", user_id);
		for(User user : totalHealth) {
			health += user.getAmount();
		}
		model.addAttribute("health",health);
		
		List<User> totalOthersOut = userRegistrationDao.getTotalAmountPerCategory("Others", user_id);
		for(User user : totalOthersOut) {
			if(user.getIn_out().equals("out"))
				others_out += user.getAmount();
		}
		model.addAttribute("others_out",others_out);
		
		List<User> totalSalary = userRegistrationDao.getTotalAmountPerCategory("Salary", user_id);
		for(User user : totalSalary) {
			salary += user.getAmount();
		}
		model.addAttribute("salary",salary);
		
		List<User> totalCommissions = userRegistrationDao.getTotalAmountPerCategory("Commissions", user_id);
		for(User user : totalCommissions) {
			commissions += user.getAmount();
		}
		model.addAttribute("commissions",commissions);
		
		List<User> totalInvestmentProfits = userRegistrationDao.getTotalAmountPerCategory("Investment Profits", user_id);
		for(User user : totalInvestmentProfits) {
			investment_profits += user.getAmount();
		}
		model.addAttribute("investment_profits",investment_profits);
		
		List<User> totalBusinessProfits = userRegistrationDao.getTotalAmountPerCategory("Business Profits", user_id);
		for(User user : totalBusinessProfits) {
			business_profits += user.getAmount();
		}
		model.addAttribute("business_profits",business_profits);
		
		List<User> totalGift = userRegistrationDao.getTotalAmountPerCategory("Gift", user_id);
		for(User user : totalGift) {
			gift += user.getAmount();
		}
		model.addAttribute("gift",gift);
		
		List<User> totalOthersIn = userRegistrationDao.getTotalAmountPerCategory("Others", user_id);
		for(User user : totalOthersIn) {
			if(user.getIn_out().equals("in"))
				others_in += user.getAmount();
		}
		model.addAttribute("others_in",others_in);
		
		return "home";
	}
}