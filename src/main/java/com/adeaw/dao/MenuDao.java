package com.adeaw.dao;

import java.util.List;

public interface MenuDao {
	public List<Object[]> getMenuByUserRole(int userRole);
}
