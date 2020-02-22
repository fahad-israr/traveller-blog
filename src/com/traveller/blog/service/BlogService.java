package com.traveller.blog.service;

import java.util.List;

import com.traveller.blog.entity.Blog;

public interface BlogService {

	public List<Blog> getBlogs();

	public void saveBlog(Blog theBlog);

	public Blog getBlog(int theId);

	public void deleteBlog(int theId);
	
}
