package com.traveller.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.traveller.blog.dao.BlogDAO;
import com.traveller.blog.entity.Blog;

@Service
public class BlogServiceImpl implements BlogService {

	// need to inject customer dao
	@Autowired
	private BlogDAO blogDAO;
	
	@Override
	@Transactional
	public List<Blog> getBlogs() {
		return blogDAO.getBlogs();
	}

	@Override
	@Transactional
	public void saveBlog(Blog theBlog) {

		blogDAO.saveBlog(theBlog);
	}

	@Override
	@Transactional
	public Blog getBlog(int theId) {
		
		return blogDAO.getBlog(theId);
	}

	@Override
	@Transactional
	public void deleteBlog(int theId) {
		
		blogDAO.deleteBlog(theId);
	}
}





