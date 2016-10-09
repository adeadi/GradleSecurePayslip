package com.adeaw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.adeaw.dao.UserDaoImpl;
import com.adeaw.model.User;

@Service("loginService")
public class LoginService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		UserDaoImpl dao = ApplicationContextProvider.getApplicationContext().getBean("userDao", UserDaoImpl.class);
		User user = dao.getUserDetails(id);
		
		if (user == null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("Username not found");
		}
		return new org.springframework.security.core.userdetails.User(user.getId(), user.getPassword(), true, true,
				true, true, getGrantedAuthorities(user));
	}

	private List<GrantedAuthority> getGrantedAuthorities(User user) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_" + user.getUserRole().getCd()));
		System.out.print("authorities :" + authorities);
		return authorities;
	}
}
