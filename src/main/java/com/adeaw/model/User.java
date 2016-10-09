package com.adeaw.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class User {
	@Id
	@NotEmpty
	private String id;
	@OneToOne
	@JoinColumn(name="roleId")
	private UserRole userRole;
	private String name;
	private String icNo;
	private String dept;
	private String jobTitle;
	private String address1;
	private String address2;
	private String address3;
	private String email;
	private String password;
	@OneToMany(mappedBy="user")
	private Collection<PayslipContent> payslip = new ArrayList<PayslipContent>();
	@OneToMany(mappedBy="user")
	private Collection<EaFormContent> eaForm = new ArrayList<EaFormContent>();
	
	
	public Collection<EaFormContent> getEaForm() {
		return eaForm;
	}
	public void setEaForm(Collection<EaFormContent> eaForm) {
		this.eaForm = eaForm;
	}
	public Collection<PayslipContent> getPayslip() {
		return payslip;
	}
	public void setPayslip(Collection<PayslipContent> payslip) {
		this.payslip = payslip;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public UserRole getUserRole() {
		return userRole;
	}
	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIcNo() {
		return icNo;
	}
	public void setIcNo(String icNo) {
		this.icNo = icNo;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
