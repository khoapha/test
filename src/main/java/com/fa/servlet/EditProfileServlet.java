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
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   private MemberDao memberDao = new MemberDao();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
	    int id = Integer.parseInt(request.getParameter("memberId"));
	    String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
	    String phone = request.getParameter("phone");
	    String description = request.getParameter("description");
	    String email = request.getParameter("email");
	    Member member = new Member();
	    member.setId(id);
	    member.setFristname(firstName);
	    member.setLastname(lastName);
	    member.setPhone(phone);
	    member.setDescription(description);
	    member.setEmail(email);
	    member = memberDao.updateMember(member);
	    request.setAttribute("member", member);
    request.getRequestDispatcher("views/user-profile.jsp").forward(request, response);
	}

}
