package com.fa.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fa.dao.ContentDao;
import com.fa.entities.Content;

/**
 * Servlet implementation class SearchContentServlet
 */
@WebServlet("/SearchContentServlet")
public class SearchContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private ContentDao contentDao = new ContentDao();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String name =  request.getParameter("name");
		  List<Content> contents = contentDao.findContent(name);
		  HttpSession session = request.getSession();
		  session.setAttribute("listContent", contents);
	    response.sendRedirect("views/view-content.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
