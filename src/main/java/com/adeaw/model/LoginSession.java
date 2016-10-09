package com.adeaw.model;

import java.util.List;

public class LoginSession {
	private String user;
	private List<Menu> parentMenu;
	private List<Menu> subMenu;
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public List<Menu> getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(List<Menu> parentMenu) {
		this.parentMenu = parentMenu;
	}
	public List<Menu> getSubMenu() {
		return subMenu;
	}
	public void setSubMenu(List<Menu> subMenu) {
		this.subMenu = subMenu;
	}
	
}
