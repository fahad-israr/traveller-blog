package com.traveller.blog.dao;

import java.util.List;

import com.traveller.blog.entity.Blog;

public interface BlogDAO {

	public List<Blog> getBlogs();

	public void saveBlog(Blog theBlog);

	public Blog getBlog(int theId);

	public void deleteBlog(int theId);
	
}
