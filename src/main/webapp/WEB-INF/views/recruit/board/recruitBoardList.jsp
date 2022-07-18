<%@page import="com.kh.zoomin.common.ZoominUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.zoomin.recruit.board.dto.RecruitBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
List<RecruitBoard> rbl = (List<RecruitBoard>) request.getAttribute("boardList");

Date currDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
%>
<link
	href="<%=request.getContextPath()%>/css/recruit/board/recruit-board.css"
	rel="stylesheet" type="text/css">



<%-- 구인자 recruit계정인 경우 --%>
<%
if (loginMember != null && loginMember.getMemberType()==1) { // 1이 구인자용인다.
	List<RecruitBoard> recruiterBoard = (List<RecruitBoard>) request.getAttribute("recruiterBoard");
%>
<h1>-등록한 채용 게시글-</h1>
<div class="write-recruit-button-wrapper">
	<button type="button" id="write-button"
		onclick="location.href='<%=request.getContextPath()%>/recruit/board/writeRecruitBoard'">신규
		채용 공고글 작성하기</button>
</div>
<section id="my-recruit-board">

	<%
	if (recruiterBoard == null) {
	%>
	<h2>아직 등록된 채용글이 없습니다.</h2>
	<%
	} else {
	for (RecruitBoard recruitBoard : recruiterBoard) {

		// 마감일까지 남은 시간을 계산.
		String closureDate = sdf.format(recruitBoard.getClosureDate());
		int daysToClosuer = (int) Math
		.ceil(((double) recruitBoard.getClosureDate().getTime() - currDate.getTime()) / 1000 / 60 / 60 / 24);
	%>
	<%-- 여기엔 jsp구문 --%>
	<table class="recruit-board-item">
		<tr>
			<td rowspan="2" class="board-remaining-days">
				<%-- 마감까지 남은 시간을 입력 --%> D-<%=daysToClosuer%>일 <br /> <span
				class="closure-date">마감일 : <%=closureDate%></span>
			</td>
			<td colspan="3" class="board-title">
				<%-- 여기에는 Title을 넣는다. --%> <%-- 해당 게시글로 이동하는 링크도 만든다. --%> <a
				href="<%=request.getContextPath()%>/recruit/board/viewRecruitBoard?boardNo=<%=recruitBoard.getNo()%>"
				target="_blank"> <%=ZoominUtils.escapeXml(recruitBoard.getTitle())%>
			</a>
			</td>

		</tr>
		<tr class="small-info-text">
			<td>
				<%-- 경력사항 및 학력사항 --%> 
				경력사항 : <%=recruitBoard.getCareerYears()%> <br>
				학력사항 : <%=recruitBoard.getSchoolStatus()%>
			</td>
			<td>
				<%-- 근무형태 및 근무지역 --%> 
				근무형태 : <%=recruitBoard.getWorkType()%> <br />
				근무지역 : <%=recruitBoard.getOfficeLocation()%>
			</td>
			<td>
				<%-- 연봉정도 --%> 
				연봉 : <%=recruitBoard.getSalary()%>
			</td>
		</tr>

	</table>

	<%
		}
	}
	%>
</section>

<%
}
%>
<%-- 채용게시글 위치 --%>
<h1>-채용게시판-</h1>
<section id="recruit-board">
	<%
	if (rbl != null) {
		for (RecruitBoard recruitBoard : rbl) {
			// 마감일까지 남은 시간을 계산.
			String closureDate = sdf.format(recruitBoard.getClosureDate());
			int daysToClosuer = (int) Math
			.ceil(((double) recruitBoard.getClosureDate().getTime() - currDate.getTime()) / 1000 / 60 / 60 / 24);
			//System.out.println(daysToClosuer);
	%>
	<%-- 여기에 채용게시글의 리스트를 전개한다. --%>
	<table class="recruit-board-item">
		<tr>
			<td rowspan="2" class="board-company-logo">
				<%-- 여기에 원래 기업 아이콘을 삽입하도록 한다. 지금은 기업번호로 대체한다.--%> <%=recruitBoard.getCompany_no()%>
			</td>
			<td colspan="3" class="board-title">
				<%-- 여기에는 Title을 넣는다. --%> <%-- 해당 게시글로 이동하는 링크도 만든다. --%> <a
				href="<%=request.getContextPath()%>/recruit/board/viewRecruitBoard?boardNo=<%=recruitBoard.getNo()%>"
				target="_blank"> <%=ZoominUtils.escapeXml(recruitBoard.getTitle())%>
			</a>
			</td>
			<td rowspan="2" class="board-remaining-days">
				<%-- 마감까지 남은 시간을 입력 --%> 
				D-<%=daysToClosuer%>일 <br /> 
				<span class="closure-date">마감일 : <%=closureDate%></span>
			</td>
		</tr>
		<tr class="small-info-text">
			<td>
				<%-- 경력사항 및 학력사항 --%> 
				경력사항 : <%=recruitBoard.getCareerYears()%> <br>
				학력사항 : <%=recruitBoard.getSchoolStatus()%>
			</td>
			<td>
				<%-- 근무형태 및 근무지역 --%> 
				근무형태 : <%=recruitBoard.getWorkType()%> <br />
				근무지역 : <%=recruitBoard.getOfficeLocation()%>
			</td>
			<td>
				<%-- 연봉정도 --%> 
				연봉 : <%=recruitBoard.getSalary()%>
			</td>
		</tr>

	</table>
	<%
	}
	}
	%>
	<%=request.getAttribute("pagebar")%>
</section>

<br />
<br />
<br />
<%-- 여기에 footer를 배치. --%>

</body>
</html>