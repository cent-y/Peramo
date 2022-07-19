package com.code.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.swing.tree.TreePath;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.code.model.User;

@Repository
public class UserRegistrationDaoImplementation implements UserRegistrationDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int saveUserRegistration(User user) {
		String sql = "INSERT INTO peramo_user(username,password,cash,online_funds) VALUES('"+user.getUsername() +    "','"
					  + user.getPassword() + "','" + 0 + "','" + 0 + "')";
		return jdbcTemplate.update(sql);
	}
	
	@Override
	public List<User> listOfUsernames() {
		String sql="SELECT * FROM peramo_user";
		List<User> listOfUsernames = jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUsername(rs.getString("username"));
				return user;
			}
		});
		return listOfUsernames;
	}
	
	@Override
	public int getCashBalance(int userId) {
		String sql="SELECT cash FROM peramo_user WHERE userId='" + userId + "'";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public void updateCashBalance(int userId, int cash) {
		String sql="UPDATE peramo_user SET cash=? WHERE userId='" + userId + "'";
		jdbcTemplate.update(sql, cash);
	}
	
	@Override
	public int getOnlineFundsBalance(int userId) {
		String sql="SELECT online_funds FROM peramo_user WHERE userId='" + userId + "'";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public void updateOnlineFundsBalance(int userId, int online_funds) {
		String sql="UPDATE peramo_user SET online_funds=? WHERE userId='" + userId + "'";
		jdbcTemplate.update(sql, online_funds);
	}
	
	@Override
	public int saveTxn(User user) {
		String sql = "INSERT INTO txn_table(userId,txn_date,amount,category,in_out) VALUES('"+user.getUserId() + "','" +user.getTxn_date() + "','" 
				+user.getAmount() + "','" +user.getCategory() + "','" +user.getIn_out() + "')";
		return jdbcTemplate.update(sql);
	}
	
	@Override
	public List<User> getListOfTxn(int userId) {
		String sql="SELECT txn_date, amount, category, in_out FROM txn_table WHERE userId='" + userId + "'";
		List<User> listOfTxn = jdbcTemplate.query(sql, new RowMapper<User>() {
			
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setTxn_date(rs.getString("txn_date"));
				user.setAmount(rs.getInt("amount"));
				user.setCategory(rs.getString("category"));
				user.setIn_out(rs.getString("in_out"));
				return user;
			}
		});
		return listOfTxn;
	}
	
	@Override
	public User findByUsername(String username) {
		String sql="SELECT * FROM peramo_user WHERE username='" + username + "'";
		return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(User.class));
	}

	@Override
	public User findById(int userId) {
		String sql="SELECT * FROM peramo_user WHERE userId='" + userId + "'";
		return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(User.class));
	}
	
	@Override
	public int getUserId(String username) {
		String sql="SELECT userId FROM peramo_user WHERE username='" + username + "'";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public List<User> getTotalAmountPerCategory(String category, int userId) {
		String sql="SELECT amount, in_out FROM txn_table WHERE category='" + category + "'" + "AND userId='" + userId + "'";
		List<User> totalAmountPerCategory = jdbcTemplate.query(sql, new RowMapper<User>() {
			
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setAmount(rs.getInt("amount"));
				user.setIn_out(rs.getString("in_out"));
				return user;
			}
		});
		return totalAmountPerCategory;
	}
}

