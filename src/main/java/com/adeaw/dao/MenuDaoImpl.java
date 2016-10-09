package com.adeaw.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.adeaw.service.HibernateSessionFactoryProvider;

@Repository
public class MenuDaoImpl implements MenuDao {

	@Override
	public List<Object[]> getMenuByUserRole(int userRole) {
		Session session = HibernateSessionFactoryProvider.getSessionFactory().openSession();
		String hql = "FROM Menu M INNER JOIN M.userRole U WHERE U.id = :userRole ORDER BY M.seqNo";
		Query query = session.createQuery(hql);
		query.setParameter("userRole", userRole);
		
		return query.list();
	}

}
