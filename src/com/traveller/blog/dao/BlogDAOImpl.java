package com.traveller.blog.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.traveller.blog.entity.Blog;


@Repository
public class BlogDAOImpl implements BlogDAO {

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Blog> getBlogs() {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Blog> theQuery = 
				currentSession.createQuery("from Blog order by date",
											Blog.class);
		
		// execute query and get result list
		List<Blog> blogs = theQuery.getResultList();
				
		// return the results		
		return blogs;
	}

	@Override
	public void saveBlog(Blog theBlog) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/upate the customer ... finally LOL
		currentSession.saveOrUpdate(theBlog);
		
	}

	@Override
	public Blog getBlog(int theId) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Blog theCustomer = currentSession.get(Blog.class, theId);
		
		return theCustomer;
	}

	@Override
	public void deleteBlog(int theId) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// delete object with primary key
		Query theQuery = 
				currentSession.createQuery("delete from Blog where id=:blogId");
		theQuery.setParameter("blogId", theId);
		
		theQuery.executeUpdate();		
	}

}











