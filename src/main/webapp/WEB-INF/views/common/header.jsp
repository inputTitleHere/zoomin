<%@page import="com.kh.zoomin.applicant.member.model.dto.ApplicantMember"%>
<%@page import="com.oreilly.servlet.CookieNotFoundException"%>
<%@page import="com.kh.zoomin.member.dto.Member"%>
<%@page import="com.kh.zoomin.recruit.member.model.dto.RecruitMember"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String msg = (String) session.getAttribute("msg");
	//System.out.println("msg@jsp = " + msg);
	if(msg != null) session.removeAttribute("msg"); 
	Member loginMember = (Member) session.getAttribute("loginMember");
	System.out.println("loginMember = " + loginMember);
	ApplicantMember am=null;
	RecruitMember rm=null;
	
	if(loginMember instanceof ApplicantMember){
		am=(ApplicantMember)loginMember;
	}else if(loginMember instanceof RecruitMember){
		rm=(RecruitMember)loginMember;
	}
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			//System.out.println("[cookie] " + name + " = " + value);
			
			}
	}
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoomin</title>


<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/common.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>

<script>
window.addEventListener('load',()=>{
	<% if(msg!=null){%>
	alert('<%=msg%>');
	<%}%>
});
//isempty 함수  null 체크용 -김승환-
function isEmpty(value){
	console.log(value);
	if(value == "" || value == null || value == undefined || value == "undefined"){
		console.log("true");
		return true;
	}else{
		console.log("false");
		return false;
	}
}
</script>	



<%
// 여기서 로그인 관련 처리를 수행한다.
// if not login(by any means) then show login option
// else show respective menus of either recruiter or applicant.
//System.out.println("loginMember = "+loginMember); // 없으면 null뜸
if (loginMember == null) {
%>
<%@ include file="/WEB-INF/views/common/noLoginHeader.jsp"%>
<%
}else if(rm != null && loginMember.getMemberType() == 0){ 
%>
	<%@ include file="/WEB-INF/views/common/supervisorLoginHeader.jsp"%>
<%
}else if(loginMember.getMemberType() == 1){
%>
<%@ include file="/WEB-INF/views/common/recruiterLoginHeader.jsp"%>
<%
}else if(loginMember.getMemberType() == 2){
%>
<%@ include file="/WEB-INF/views/common/applicantLoginHeader.jsp"%>
<%
	}
%>

</head>
