package edu.wustl.catissuecore.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CharacterEncodingFilter implements Filter { 
	

	private String encoding = "UTF-8";

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException { 
	HttpServletRequest request = (HttpServletRequest) req; 
	HttpServletResponse response = (HttpServletResponse) res; 
	
	request.setCharacterEncoding(encoding); 
	response.setContentType ("text / html; charset = UTF-8"); 
	response.setCharacterEncoding(encoding);
	
	chain.doFilter(request, response); 

	}
	
	@Override
	public void destroy() {
		// XXX Auto-generated method stub
		
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	    String encodingParam = filterConfig
	              .getInitParameter("encoding");
	    if (encodingParam != null) {
	      encoding = encodingParam;
	    }
	
	}

}
