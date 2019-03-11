package com.fa.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fa.dao.MemberDao;
import com.fa.entities.Member;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private MemberDao memberDao = new MemberDao();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String userName = request.getParameter("userName");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    Member member = new Member();
	    member.setUsername(userName);
	    member.setEmail(email);
	    member.setPassword(password);
	    int a = memberDao.createMember(member);
	    if(a >0 ) {
	      request.setAttribute("message", "Registry successfully!");
	      request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	    }else {
	      request.setAttribute("message", "Registry fail!");
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	    }
	}

}
