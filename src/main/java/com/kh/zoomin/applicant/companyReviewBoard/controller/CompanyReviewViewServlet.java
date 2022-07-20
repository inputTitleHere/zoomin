package com.kh.zoomin.applicant.companyReviewBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.zoomin.applicant.companyReviewBoard.model.dto.CompanyReview;
import com.kh.zoomin.applicant.companyReviewBoard.model.service.CompanyReviewService;

/**
 * Servlet implementation class CompanyReviewViewServlet
 */
@WebServlet("/review/company/companyReviewBoard")
public class CompanyReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CompanyReviewService companyReviewService = new CompanyReviewService();
	
	/**
	 * 리뷰 상세보기
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//			int no = Integer.parseInt(request.getParameter("no"));
			int no = 22; // 9번 게시글의 상세리뷰 보기 가능
			
			CompanyReview companyReview = companyReviewService.findByCompanyReviewNo(no);
			request.setAttribute("companyReview", companyReview);
			request.getRequestDispatcher("/WEB-INF/views/applicant/companyReviewView.jsp")
				.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}