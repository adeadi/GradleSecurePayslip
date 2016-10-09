package com.adeaw.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.adeaw.model.User;
import com.adeaw.model.UserRole;
import com.adeaw.service.HibernateSessionFactoryProvider;

@Repository
public class UserDaoImpl implements UserDao {
	
	public boolean insertUser(User user) {
		if(null != getUserDetails(user.getId())) {
			return false;
		} else {
			Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
			session.beginTransaction();
			
			user.setUserRole(getUserRole(2));
			
			session.save(user);
			session.getTransaction().commit();
			session.clear();
			session.close();
			
			return true;
		}
	}
	
	public User getUserDetails(String id) {
		Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("id", id));
		List results = cr.list();
		session.clear();
		session.close();
		
		return (results.isEmpty()) ? null : (User) results.get(0);
	}

	@Override
	public List<User> getAllStaff() {
		Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("userRole", getUserRole(2)));
		List<User> results = cr.list();
		session.clear();
		session.close();
		
		return results;
	}
	
	public UserRole getUserRole(int id){
		//ADMIN: id = 1
		//STAFF: id = 2
		Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(UserRole.class);
		cr.add(Restrictions.eq("id", id));
		List results = cr.list();
		session.clear();
		session.close();
		
		return (results.isEmpty()) ? null : (UserRole) results.get(0);
	}

	@Override
	public boolean deleteUser(String id) {
		Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
		session.beginTransaction();
		session.delete(getUserDetails(id));
		session.getTransaction().commit();
		session.clear();
		session.close();
		
		return true;
	}

	@Override
	public boolean updateUser(User user) {
		Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
		session.beginTransaction();
		
		user.setUserRole(getUserRole(2));
		session.update(user);
		session.getTransaction().commit();
		session.clear();
		session.close();
		
		return true;
	}

}
