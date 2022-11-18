package com.Infinite.inventoryproject;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class AdminDAO {

	SessionFactory sessionFactory;

	
	 public int authenticate(String User,String password){
	        sessionFactory = SessionHelper.getConnection();
	        Session session = sessionFactory.openSession();
	        Criteria criteria = session.createCriteria(Admin.class);
	        criteria.add(Restrictions.eq("userName", User));
	        criteria.add(Restrictions.eq("passWord", password));
	        List<Admin>aList = criteria.list();
	        return aList.size();
	        
	            }

		public String addAdmin(Admin admin){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String Adminid=GenerateAdminId();
		admin.setAdminId(Adminid);
		Transaction transaction = session.beginTransaction();
		session.save(admin);
		transaction.commit();
		session.close();
		return " Added Successsfully...";
	}

		public String GenerateAdminId() {	
			sessionFactory = SessionHelper.getConnection();
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(Admin.class);
			List<Admin> stockList = cr.list();
			session.close();
			if( stockList.size()==0) {
				return "A001";
		
			}
			else {
				String id = stockList.get(stockList.size()-1).getAdminId();
				int id1 = Integer.parseInt(id.substring(1));
				id1++;
				String id2 = String.format("A%03d", id1);
	     		return id2;		
			}	
			
		}

		
		
	
	}
	 
