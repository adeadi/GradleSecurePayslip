package com.adeaw.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class UserRole {
	@Id @GeneratedValue(strategy=GenerationType.AUTO) 
	private int id;
	private String cd;
	private String dscp;
	@ManyToMany
	@JoinTable(name="UserRoleMenu",joinColumns=@JoinColumn(name="userRoleId"),inverseJoinColumns=@JoinColumn(name="menuId"))
	private Collection<Menu> menu = new ArrayList<Menu>();
	
	public Collection<Menu> getMenu() {
		return menu;
	}
	public void setMenu(Collection<Menu> menu) {
		this.menu = menu;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getDscp() {
		return dscp;
	}
	public void setDscp(String dscp) {
		this.dscp = dscp;
	}
	
}
