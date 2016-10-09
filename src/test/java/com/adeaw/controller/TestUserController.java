package com.adeaw.controller;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.View;

import com.adeaw.dao.UserDaoImpl;
import com.adeaw.model.User;

@ContextConfiguration("file:webapp/WEB-INF/webmvc-dispatcher-servlet.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUserController {

	@InjectMocks
	UserController controller;

	@Mock
	UserDaoImpl mockUserDao;

	@Mock
	View mockView;

	MockMvc mockMvc;

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(controller).setSingleView(mockView).build();
	}
	
	@Test
	public void testAddUserRequest() throws Exception {
		mockMvc.perform(get("/add_user_request")).andExpect(status().isOk())
				.andExpect(model().attribute("mainPage", "new_user.jsp"))
				.andExpect(view().name("skeleton"));
	}
	
	@Test
	public void testManageUserRequest() throws Exception {
		List<User> expectedUsers = Arrays.asList(new User());
		when(mockUserDao.getAllStaff()).thenReturn(expectedUsers);
		
		mockMvc.perform(get("/manage_user_request")).andExpect(status().isOk())
				.andExpect(model().attribute("users", expectedUsers))
				.andExpect(model().attribute("mainPage", "manage_user.jsp"))
				.andExpect(view().name("skeleton"));
	}

	/*@Test
	public void testAddUser() throws Exception {
		User user = new User();
		Boolean expectedAddUser = true;
		when(mockUserDao.insertUser(user)).thenReturn(expectedAddUser);

		mockMvc.perform(post("/add_user")).andExpect(status().isOk())
				.andExpect(model().attribute("successMessage", "User successfully created!"))
				.andExpect(view().name("skeleton"));
	}*/
}
