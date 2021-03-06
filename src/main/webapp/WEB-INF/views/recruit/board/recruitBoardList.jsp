<%@page import="com.kh.zoomin.member.dto.Member"%>
<%@page import="com.kh.zoomin.common.ZoominUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.zoomin.recruit.board.dto.RecruitBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/recruit/recruitNavbar.jsp" %> 
<%
List<RecruitBoard> rbl = (List<RecruitBoard>) request.getAttribute("boardList");
//Member loginMember = (Member)session.getAttribute("loginMember");

Date currDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
%>
<link	href="<%=request.getContextPath()%>/css/recruit/board/recruit-board.css" rel="stylesheet" type="text/css">
<link	href="<%=request.getContextPath()%>/css/recruit/board/board-common.css" rel="stylesheet" type="text/css">



<%-- 구인자 recruit계정인 경우 --%>
<%
if (loginMember != null && loginMember.getMemberType()==1) { // 1이 구인자용인다.
	List<RecruitBoard> recruiterBoard = (List<RecruitBoard>) request.getAttribute("recruiterBoard");
%>
<br /><br />
<h1>-등록한 채용 게시글-</h1>
<div class="write-recruit-button-wrapper">
	<button type="button" id="write-button"	onclick="location.href='<%=request.getContextPath()%>/recruit/board/writeRecruitBoard'">채용 공고글 작성하기</button>
</div>
<section id="my-recruit-board" class="recruit-board-section">

	<%
	if (recruiterBoard == null) {
	%>
	<h2>아직 등록된 채용글이 없습니다.</h2>
	<%
	} else {
	for (RecruitBoard recruitBoard : recruiterBoard) {

		// 마감일까지 남은 시간을 계산.
		String closureDate = sdf.format(recruitBoard.getClosureDate());
		int daysToClosuer = (int) Math.ceil(((double) recruitBoard.getClosureDate().getTime() - currDate.getTime()) / 1000 / 60 / 60 / 24);
	%>
	<table class="recruit-board-item" id="my-recruit-board-item">
		<tr>
			<td rowspan="2" class="board-remaining-days">
				<%-- 마감까지 남은 시간을 입력 --%> D-<%=daysToClosuer%>일 <br /> <span
				class="closure-date">마감일 : <%=closureDate%></span>
			</td>
			<td colspan="3" class="board-title">
				<%-- 여기에는 Title을 넣는다. --%> <%-- 해당 게시글로 이동하는 링크도 만든다. --%>
				<%
				if(loginMember.getMemberType()==2){
				%> 
				<a href="<%=request.getContextPath()%>/recruit/board/viewRecruitBoard?boardNo=<%=recruitBoard.getNo()%>&uid=<%=am.getUid()%>" target="_blank">
				<%
				}else{ %> 
				<a href="<%=request.getContextPath()%>/recruit/board/viewRecruitBoard?boardNo=<%=recruitBoard.getNo()%>" target="_blank">
				<%} %>
					<%=ZoominUtils.escapeXml(recruitBoard.getTitle())%>
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
<section id="recruit-board" class="recruit-board-section">
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
	<table class="recruit-board-item" id="other-recruit-board-item">
		<tr>
			<%--
			<td rowspan="2" class="board-company-logo">
				<%=recruitBoard.getCompanyNo()%> 
			</td>
			--%> 
			<td colspan="3" class="board-title">
				<%-- 여기에는 Title을 넣는다. --%> <%-- 해당 게시글로 이동하는 링크도 만든다. --%> 
				<a href="<%=request.getContextPath()%>/recruit/board/viewRecruitBoard?boardNo=<%=recruitBoard.getNo()%>" target="_blank"> <%=ZoominUtils.escapeXml(recruitBoard.getTitle())%>
			</a>
			</td>
			<%if(loginMember != null && loginMember.getMemberType()==1){ %>
			<td rowspan="2" class="board-remaining-days">
			<%}else{ %>
			<td rowspan="1" class="board-remaining-days">
			<%} %>
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
			<%--
			<%if(loginMember.getMemberType()==2){ %>
				<td>
					<div class="button-wrapper">
						<div class="fav-button">
						<form action="" class="fav-frm">
							<input type="hidden" value="<%=((ApplicantMember)loginMember).getUid() %>" name="uid" id="uid" />
							<input type="hidden" value="<%=recruitBoard.getNo() %>" name="boardNo" id="boardNo" />
							<input type="hidden" value="" name="isFavourited" id="isFavourited"/>
							<button>찜하기</button>
						</form>
						</div>
						<div class="enroll-button">
						<form action="" class="enroll-frm">
							<input type="hidden" value="<%=((ApplicantMember)loginMember).getUid() %>" name="uid" id="uid" />
							<input type="hidden" value="<%=recruitBoard.getNo() %>" name="boardNo" id="boardNo" />
							<button>지원하기</button>
						</form>
						</div>
					</div>
				</td>
			<%} %>
			--%>
		</tr>

	</table>
	<%
	}
	}
	%>
	<div class="pagebar-wrapper">
		<%=request.getAttribute("pagebar")%>
	</div>
</section>

<%--
<%if(loginMember.getMemberType()==2){%>
<script>
window.addEventListener('load',()=>{
	const favFrms=document.querySelectorAll(".fav-frm");
  const enrollFrms=document.querySelectorAll(".enroll-frm");
	
	favFrms.forEach((item)=>{
		item.addEventListener('submit',(e)=>{
      e.preventDefault();
			favourite(e);
		})		
	})
	enrollFrms.forEach((item)=>{
		item.addEventListener('submit',(e)=>{
			enroll(e);
		})
	})
	
})



const favourite=(e)=>{
	console.log(e.target.boardNo.value);
	console.log(e.target.uid.value);
	// ajax처리할것.
	$.ajax({
			url:`<%=request.getContextPath()%>/recruit/board/addFavourite?boardNo=${e.target.boardNo.value}&${e.target.uid.value}`,
      success(response){
        console.log("CONNECTION SUCCESS");
      }
	});
};
const enroll=(e)=>{
  // e으로 form이 들어옴
  console.log(e.target.boardNo.value);
	console.log(e.target.uid.value);
	// ajax처리
	$.ajax({
		
	});
};


</script>

<%} %>
--%>
<br />
<br />
<br />
<%-- 여기에 footer를 배치. --%>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>