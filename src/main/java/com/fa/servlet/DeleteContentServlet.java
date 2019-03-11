package com.fa.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fa.dao.ContentDao;
import com.fa.entities.Content;

/**
 * Servlet implementation class DeleteContentServlet
 */
@WebServlet("/DeleteContentServlet")
public class DeleteContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private ContentDao contentDao = new ContentDao();     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  int id = Integer.parseInt(request.getParameter("id"));
    int check = contentDao.deleteContent(id);
    response.sendRedirect(request.getContextPath()+"/UserProfileServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
