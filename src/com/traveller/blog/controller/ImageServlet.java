package com.traveller.blog.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* This serves images from our Local Disk with absolute path*/
@WebServlet(name = "SendImageServlet", urlPatterns = {"/image/*"})
public class ImageServlet extends HttpServlet {

    // Properties ---------------------------------------------------------------------------------

    private String imagePath;

    // Init ---------------------------------------------------------------------------------------

    public void init() throws ServletException {

        // Define base path somehow. You can define it as init-param of the servlet.
    	//Right now its serving at server base into /home/fahad/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/traveller-blog/
    	this.imagePath="/"; 
        
    }

    // Actions ------------------------------------------------------------------------------------

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        // Get requested image by path info.
        String requestedImage = request.getPathInfo();

        // Check if file name is actually supplied to the request URI.
        if (requestedImage == null) {
            
        	System.out.println("reqImgNUll");
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }

        // Decode the file name (might contain spaces and on) and prepare file object.
        File image = new File(imagePath, URLDecoder.decode(requestedImage, "UTF-8"));

        // Check if file actually exists in filesystem.
        if (!image.exists()) {
            
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }

        // Get content type by filename.
        String contentType = getServletContext().getMimeType(image.getName());

        // Check if file is actually an image
        
        if (contentType == null || !contentType.startsWith("image")) {
            // Do your thing if the file appears not being a real image.
            // Throw an exception, or send 404, or show default/warning image, or just ignore it.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }

        // Init servlet response.
        response.reset();
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(image.length()));

        // Write image content to response.
        Files.copy(image.toPath(), response.getOutputStream());
    }

}