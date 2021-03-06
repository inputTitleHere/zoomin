<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="content-wrapper">

  <div class="recruit-board-wrapper">
    <table class="recruit-board-table">
      <thead>
        <tr>
          <td>마감임박 채용!</td>
          <td><a href="<%=request.getContextPath()%>/recruit/board/recruitBoardList">→ 더 많은 채용글 보러가기 ←</a></td>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>

</div>


<script>
// AJAX script for loading first window : 채용글 목록

window.addEventListener('load',()=>{
	indexRecruiterBoard();
})


const indexRecruiterBoard=()=>{
	$.ajax({
		url:"<%=request.getContextPath()%>/recruit/board/indexRecruitBoard",
		success(response){
			console.log(response);
      const tbody = document.querySelector('.recruit-board-table tbody');
			response.forEach((rbl)=>{
        const {companyNo,title, closureDate}=rbl;
				const tr = document.createElement('tr');
        tr.classList.add('recruit-board-tr')
        const companyLogoTd = document.createElement('td');
        companyLogoTd.classList.add('recruit-board-company-logo');
        //임시로 companyNo으로 대체함
        companyLogoTd.append(companyNo);

        const titleTd=document.createElement('td');
        titleTd.classList.add('recruit-board-title');
        titleTd.append(title);

        const closureDateTd=document.createElement('td');
        closureDateTd.classList.add('recruit-board-closure-date');
        closureDateTd.append("마감일자 : "+closureDate);

        tr.append(companyLogoTd, titleTd, closureDateTd);
        tbody.append(tr);
			})
		},
		error:console.log
	});
};



</script>







