<%@page import="com.kh.zoomin.recruit.member.model.dto.RecruitMember"%>
<%@page import="com.kh.zoomin.member.dto.Member"%>
<%@page import="com.kh.zoomin.applicant.member.model.dto.ApplicantMember"%>
<%@page import="com.kh.zoomin.applicant.companyReviewBoard.model.dto.CompanyReview"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/applicantLoginHeader.jsp" %>


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
	List<CompanyReview> list = (List<CompanyReview>) request.getAttribute("list");
	CompanyReview companyReview = (CompanyReview) request.getAttribute("companyReivew");
	ApplicantMember applicant = null;
	Member applicantM = (Member) session.getAttribute("loginMember");
	if(applicantM instanceof ApplicantMember){
		applicant = (ApplicantMember) applicantM;
	}
	int uid = Integer.parseInt(request.getParameter("uid"));
	String companyNo = request.getParameter("companyNo");
%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/applicant/companyReviewEnroll.css" />
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/common.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/applicant/applicantLoginHeader.css"/> --%>

<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<section id="company-review-view-container">
	<h2>-회사 리뷰 등록-</h2>

	<form 
		name="companyReviewEnrollFrm"
		action="<%= request.getContextPath() %>/review/company/companyReviewEnroll"
		method="post"
	>
		<table id="tbl-company-review">
			 <tr>
				<th>작성자 번호</th>
				<td>
					<input type="text" name="uid" value="<%= uid %>" readonly/>
				</td>
			</tr>
			<tr>
				<th>회사명</th>
				<td>
				
					<input type="text" name ="companyNo" value="<%= companyNo %>" readonly/>
				</td>
			</tr> 
			<tr>
				<th>분야</th>
				<td>
					<select name="category_number" id="category_number">
						<option disabled selected value="">---카테고리 선택---</option>
						<option value="1">인사팀</option>
						<option value="2">회계/총무팀</option>
						<option value="3">마케팅팀</option>
						<option value="4">영업팀</option>
						<option value="5">생산/관리팀</option>
						<option value="6">연구개발팀</option>
						<option value="7">기술팀</option>
						<option value="8">서비스팀</option>
						<option value="9">인터넷팀</option>
					</select>
				</td>
			</tr>
			<tr>
	            <th>평점</th>
	            <td>
		            <select name="stars" id="aaaa">
		            	<option value="1">1점</option>
		            	<option value="2">2점</option>
		            	<option value="3">3점</option>
		            	<option value="4">4점</option>
		            	<option value="5">5점</option>
		            </select>
	            </td>
	        </tr>
	        <tr>
	            <th>워라벨</th>
	            <td>
	            	<select name="work_life_balance" id="aaaa">
		            	<option value="1">1점</option>
		            	<option value="2">2점</option>
		            	<option value="3">3점</option>
		            	<option value="4">4점</option>
		            	<option value="5">5점</option>
		            </select>
	            </td>
	        </tr>
	        <tr>
	            <th>승진 가능성</th>
	            <td>
	            	<select name="level_up" id="aaaa">
		            	<option value="1">1점</option>
		            	<option value="2">2점</option>
		            	<option value="3">3점</option>
		            	<option value="4">4점</option>
		            	<option value="5">5점</option>
		            </select>
	            </td>
	        </tr>
	        <tr>
	            <th>업무 강도</th>
	            <td>
	            	<select name="work_intensity" id="aaaa">
		            	<option value="1">1점</option>
		            	<option value="2">2점</option>
		            	<option value="3">3점</option>
		            	<option value="4">4점</option>
		            	<option value="5">5점</option>
		            </select>
	            </td>
	        </tr>
	        <tr>
	            <th>발전 가능성</th>
	            <td>
	            	<select name="potential" id="aaaa">
		            	<option value="1">1점</option>
		            	<option value="2">2점</option>
		            	<option value="3">3점</option>
		            	<option value="4">4점</option>
		            	<option value="5">5점</option>
		            </select>
	            </td>
	        </tr>
	        <tr>
	            <th>연봉 만족도</th>
	            <td>
					<select name="salary_satisfaction" id="aaaa">
		            	<option value="1">1점</option>
		            	<option value="2">2점</option>
		            	<option value="3">3점</option>
		            	<option value="4">4점</option>
		            	<option value="5">5점</option>
		            </select>
				</td>
	        </tr>
			<tr>
				<th>내용</th>
				<td id="content">
					<textarea name="content" id="contentBox" cols ="50" rows="10"/></textarea>
					<p id="content-p">
					<span id="counter"></span> / <span id="max-counter"></span>
		            </p>     
				</td>
			</tr>
		</table>
	</form>
	
	<div id="end">
		<button onclick="location.href='<%= request.getContextPath() %>/recruit/review/recruitReviewList?companyNo=<%= companyNo %>'">cancel</button>
		<button id="btnSubmit" onclick="location.href='<%= request.getContextPath() %>/recruit/review/recruitReviewList?companyNo=<%= companyNo %>'">submit</button>
	</div>

<script type="text/javascript">
document.querySelector("#btnSubmit").onclick = () =>{
	document.companyReviewEnrollFrm.submit();
};

const MAX_COUNTER = 30;
$(counter).html(0);
$("#max-counter").html(MAX_COUNTER);

$(content).keyup((e) => {
    const {target: {value}} = e;
    console.log(value);
    const len = value.length;
    const $counter = $(counter);
    $counter.html(len);

    const $submit = document.querySelector('#btnSubmit');
    if(len <= MAX_COUNTER){
        $counter.css('color', 'initial'); // 초기값 initial inherit  
        
    } 
    else {
        $counter.css('color', 'red');
        alert('너무 길어서 제출이 불가합니다. 내용을 줄여주세요.');
    }
})
</script>

</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>