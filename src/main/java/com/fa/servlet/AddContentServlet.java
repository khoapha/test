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
 * Servlet implementation class AddContent
 */
@WebServlet("/AddContent")
public class AddContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private ContentDao contentDao = new ContentDao();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  int id = Integer.parseInt(request.getParameter("id"));
	  List<Content> list = contentDao.getListContent(id);
	  HttpSession session = request.getSession();
	  session.setAttribute("listContent", list);
	  response.sendRedirect("views/view-content.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int authorId = Integer.parseInt(request.getParameter("authorId"));
	    int id = 0;
	    if(request.getParameter("idContent")!=null || request.getParameter("idContent")!="" || !request.getParameter("idContent").isEmpty()) {
	      id =Integer.parseInt(request.getParameter("idContent"));
	    }else {
	      id =0;
	    }   
		  String title = request.getParameter("title");
		  String brief = request.getParameter("brief");
		  String content = request.getParameter("content");
		  Content content2 = new Content();
		  content2.setAuthorId(authorId);
		  content2.setContent(content);
		  content2.setTitle(title);
		  content2.setBrief(brief);
		  if(id != 0) {
		    content2.setId(id);
		    contentDao.updateContent(content2);
		    request.setAttribute("message", "Update content success");
		    response.sendRedirect(request.getContextPath()+"/UserProfileServlet");
		  }else {
	      int temp = contentDao.addContent(content2);
	      if(temp == 1) {
	        request.setAttribute("message", "Add content success");
	      }
	      response.sendRedirect(request.getContextPath()+"/UserProfileServlet");
	     // request.getRequestDispatcher().s;
		  }

	}

}
