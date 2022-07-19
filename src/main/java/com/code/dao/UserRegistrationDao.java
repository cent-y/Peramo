package com.code.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.code.model.User;

@Component
public interface UserRegistrationDao {
	public int saveUserRegistration(User user);
	public User findByUsername(String username);
	public User findById(int userId);
	public int getUserId(String username);
	public List<User> listOfUsernames();
	public List<User> getListOfTxn(int userId);
	public List<User> getTotalAmountPerCategory(String category, int userId);
	public int saveTxn(User user);
	public int getCashBalance(int userId);
	public void updateCashBalance(int userId, int cash);
	public int getOnlineFundsBalance(int userId);
	public void updateOnlineFundsBalance(int userId, int cash);
}
