package com.kh.zoomin.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SupervisorMemberView
 */
@WebServlet("/supervisor/memberView")
public class SupervisorMemberView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자 입력값처리(id)
		String memberId = request.getParameter("memberId");
		//System.out.println("memberId = " + memberId);
		
		//업무로직(사용자 정보 조회)
		
		
		//응답처리
		request.getRequestDispatcher("/WEB-INF/views/supervisor/memberView.jsp").forward(request, response);
	}

}
