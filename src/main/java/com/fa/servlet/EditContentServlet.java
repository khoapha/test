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
 * Servlet implementation class EditContentServlet
 */
@WebServlet("/EditContentServlet")
public class EditContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private ContentDao contentDao = new ContentDao();     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int id = Integer.parseInt(request.getParameter("id"));
		  Content content = contentDao.getInfoContentUpdate(id);
		  request.setAttribute("content", content);
		  request.getRequestDispatcher("views/add-content.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
