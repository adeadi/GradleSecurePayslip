package com.adeaw.dao;

import java.util.List;

import com.adeaw.model.User;

public interface UserDao {
	
	public boolean insertUser(User user);
	public User getUserDetails(String id);
	public List<User> getAllStaff();
	public boolean deleteUser(String id);
	public boolean updateUser(User user);
}
