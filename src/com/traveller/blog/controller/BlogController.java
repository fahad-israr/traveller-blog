package com.traveller.blog.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.traveller.blog.entity.Blog;
import com.traveller.blog.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	private static final String UPLOAD_DIRECTORY ="/";
	// need to inject our blog service
	@Autowired
	private BlogService blogService;
	
	@GetMapping("/list")
	public String listBlogs(Model theModel) {
		
		// get blogs from the service
		List<Blog> theBlogs = blogService.getBlogs();
				
		// add the blogs to the model
		theModel.addAttribute("blogs", theBlogs);
		
		return "list-blogs";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		// create model attribute to bind form data
		Blog theBlog = new Blog();
		
		theModel.addAttribute("blog", theBlog);
		
		return "blog-form";
	}
	
	@PostMapping("/saveBlog")
	public String saveBlog(@ModelAttribute("blog") Blog theBlog,@RequestParam CommonsMultipartFile file,  
	           HttpSession session) throws Exception {
		//System.out.println(theBlog);
		ServletContext context = session.getServletContext();  
	    String path = context.getRealPath(UPLOAD_DIRECTORY);  
	    String filename = file.getOriginalFilename();  
	    //System.out.println("File:"+filename);
	     
	    String storage_path=path+file.getOriginalFilename();
	    System.out.println(storage_path  );   //Logging the storage Path on Disk
	  
	    byte[] bytes = file.getBytes();  
	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
	         new File(path + File.separator + filename)));  
	    stream.write(bytes);  
	    stream.flush();  
	    stream.close();  
		// save the blog using our service
	    theBlog.setImage(storage_path);
		blogService.saveBlog(theBlog);	
		
		return "redirect:/blog/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("blogId") int theId,
									Model theModel) {
		
		// get the blog from our service
		Blog theBlog= blogService.getBlog(theId);	
		
		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("blog", theBlog);
		
		// send over to our form		
		return "blog-form";
	}
	
	@GetMapping("/delete")
	public String deleteBlog(@RequestParam("blogId") int theId) {
		
		// delete the blog
		blogService.deleteBlog(theId);
		
		return "redirect:/blog/list";
	}
	  
    

  
}









