<%@page import="com.kh.zoomin.applicant.companyReviewBoard.model.dto.CompanyReviewExt"%>
<%@page import="com.kh.zoomin.applicant.companyReviewBoard.model.dto.CompanyReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/applicantLoginHeader.jsp" %>
<%
	CompanyReview companyReview = (CompanyReview) request.getAttribute("companyReview");
	CompanyReviewExt companyReviewExt = (CompanyReviewExt) request.getAttribute("companyReviewExt"); 
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/common.css" />
<section id="company-review-view-container">
	<h1>Enroll.jsp회사 리뷰 등록</h1>
</section>
<form 
	name="companyReviewEnrollFrm"
	action="<%= request.getContextPath() %>/CompanyReviewUpdateServlet"
	method="post"
>
	<table id="tbl-company-review">
	<tr>
		<th>회사 고유번호</th>
		<td><input type="text" value="<%= companyReview.getNo() %>"/></td>
	</tr>
	<tr>
		<th>작성자 번호</th>
		<td><input type="text" value="<%= companyReview.getUid() %>"/></td>
	</tr>
	
	</table>
</form>

<%@ include file="/WEB-INF/views/common/commonFooter.jsp" %>