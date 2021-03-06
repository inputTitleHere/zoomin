package com.kh.zoomin.supervisor.model.service;



import static com.kh.zoomin.common.JdbcTemplate.close;
import static com.kh.zoomin.common.JdbcTemplate.commit;
import static com.kh.zoomin.common.JdbcTemplate.getConnection;
import static com.kh.zoomin.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.zoomin.applicant.member.model.dto.ApplicantMember;
import com.kh.zoomin.recruit.member.model.dto.RecruitMember;
import com.kh.zoomin.supervisor.model.dto.RecruitBoard;
import com.kh.zoomin.supervisor.model.dto.Rmember;
import com.kh.zoomin.supervisor.model.dto.RmemberLog;
import com.kh.zoomin.supervisor.model.dto.SalLog;
import com.kh.zoomin.supervisor.model.dao.SupervisorDao;
import com.kh.zoomin.supervisor.model.dto.AmemberLog;
import com.kh.zoomin.supervisor.model.dto.ComLog;
import com.kh.zoomin.supervisor.model.dto.CompanyReview;
import com.kh.zoomin.supervisor.model.dto.RecLog;
import com.kh.zoomin.supervisor.model.dto.SalaryReview;
import com.kh.zoomin.supervisor.model.dto.WeekData;

public class SupervisorService {
	
	private SupervisorDao supervisorDao = new SupervisorDao();
	
	//DQL : select * from applicantMember
	public List<ApplicantMember> findApplicantMemberAll(Map<String, Object> param){
		Connection conn = getConnection();
		List<ApplicantMember> applicantMemberList = supervisorDao.findApplicantMemberAll(conn, param);
		close(conn);
		return applicantMemberList;
	}
	
	//DQL : select * from recruitMember
	public List<Rmember> findRecruitMemberAll(Map<String, Object> param){
		Connection conn = getConnection();
		List<Rmember> recruitMemberList = supervisorDao.findRecruitMemberAll(conn, param);
		close(conn);
		return recruitMemberList;
	}

	//DQL : select * from applicantMember where # like ?
//	public List<ApplicantMember> findApplicantMemberLike(Map<String, Object> param) {
//		Connection conn = getConnection();
//		List<ApplicantMember> applicantMemberList = supervisorDao.findApplicantMemberLike(conn, param);
//		close(conn);
//		return applicantMemberList;
//	}
//
//	//DQL : select * from recruitMember where # like ?
//	public List<RecruitMember> findRecruitMemberLike(Map<String, Object> param) {
//		Connection conn = getConnection();
//		List<RecruitMember> recruitMemberList = supervisorDao.findRecruitMemberLike(conn, param);
//		close(conn);
//		return recruitMemberList;
//	}

	//today????????? ??? ??????
	//select count(*) from visit where to_date(v_date, 'yyyy-mm-dd') = to_date(sysdate, 'yyyy-mm-dd')
	public int getTodayCount() {
		Connection conn = getConnection();
		int todayCnt = supervisorDao.getTodayCount(conn);
		close(conn);
		return todayCnt;
	}

	//??? ????????? ??? ??????
	public int getTotalCount() {
		Connection conn = getConnection();
		int totalCnt = supervisorDao.getTotalCount(conn);
		close(conn);
		return totalCnt;
	}

	//??? ????????? ??? ?????? : ???????????? ?????? ?????? ??? ??????
	//insert into visit values (sysdate)
	public int setCount() {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = supervisorDao.setCount(conn);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);			
		}
		return result;
	}

	//????????????????????? ??????
	public int getTodayComCnt() {
		Connection conn = getConnection();
		int todayComCnt = supervisorDao.getTodayComCnt(conn);
		close(conn);
		return todayComCnt;
	}

	//??????????????? ??????
	public int getTodaySalCnt() {
		Connection conn = getConnection();
		int todaySalCnt = supervisorDao.getTodaySalCnt(conn);
		close(conn);
		return todaySalCnt;
	}

	//?????? ????????? ??? ??? ??????
	public int getTotalBoardCnt() {
		Connection conn = getConnection();
		int totalBoardCnt = supervisorDao.getTotalBoardCnt(conn);
		close(conn);
		return totalBoardCnt;
	}
	
	//????????? ????????? ??? ??????
	public int getVisitCount(String dateStart, String dateEnd) {
		Connection conn = getConnection();
		int visitCnt = supervisorDao.getVisitCount(conn, dateStart, dateEnd);
		close(conn);
		return visitCnt;
	}

	//????????? ????????? ??? ??????
	public int getBoardCount(String dateStart, String dateEnd) {
		Connection conn = getConnection();
		int boardCnt = supervisorDao.getBoardCount(conn, dateStart, dateEnd);
		close(conn);
		return boardCnt;
	}

	//???????????? ????????? ??? ?????? 
	public List<WeekData> getVisitData() {
		List<WeekData> visitList = new ArrayList<>();
		Connection conn = getConnection();
		visitList = supervisorDao.getVisitData(conn);
		close(conn);
		return visitList;
	}

	//???????????? ????????? ??? ??????
	public List<WeekData> getBoardData() {
		List<WeekData> boardList = new ArrayList<>();
		Connection conn = getConnection();
		boardList = supervisorDao.getBoardData(conn);
		close(conn);
		return boardList;
	}

	//???????????? ????????????
	public List<SalaryReview> getSalReviewAll(Map<String, Object> param) {
		List<SalaryReview> salList = new ArrayList<>();
		Connection conn = getConnection();
		salList = supervisorDao.getSalReviewAll(conn, param);
		close(conn);
		return salList;
	}

	//???????????? ????????????
	public List<CompanyReview> getComReviewAll(Map<String, Object> param) {
		List<CompanyReview> comList = new ArrayList<>();
		Connection conn = getConnection();
		comList = supervisorDao.getComReviewAll(conn, param);
		close(conn);
		return comList;
	}

	//??????????????? ????????????
	public List<RecruitBoard> getRecBoardAll(Map<String, Object> param) {
		List<RecruitBoard> recList = new ArrayList<>();
		Connection conn = getConnection();
		recList = supervisorDao.getRecBoardAll(conn, param);
		close(conn);
		return recList;
	}
	
	//???????????? ?????? ????????? ??? ??????
	public int getTotalSalReviewCnt() {
		Connection conn = getConnection();
		int totalSalReviewCnt = supervisorDao.getTotalSalReviewCnt(conn);
		close(conn);
		return totalSalReviewCnt;
	}

	//???????????? ?????? ????????? ??? ??????
	public int getTotalComReviewCnt() {
		Connection conn = getConnection();
		int totalComReviewCnt = supervisorDao.getTotalComReviewCnt(conn);
		close(conn);
		return totalComReviewCnt;
	}

	//???????????? ????????? ??????
	public int deleteSalReview(String[] salBoardNo) {		
		Connection conn = getConnection();
		int result = 0;
		try {
			result = supervisorDao.deleteSalReview(conn, salBoardNo);
			if(salBoardNo.length == result)
				commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {			
			close(conn);
		}
		return result;
	}

	public int getTotalComRecruitCnt() {
		Connection conn = getConnection();
		int totalComRecruitCnt = supervisorDao.getTotalComRecruitCnt(conn);
		close(conn);
		return totalComRecruitCnt;
	}

	//?????????????????????
	public int deleteComBoard(String[] comBoardNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = supervisorDao.deleteComBoard(conn, comBoardNo);
			if(comBoardNo.length == result)
				commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {			
			close(conn);
		}
		return result;
	}

	//????????????????????? ??????
	public int deleteComReview(String[] comBoardNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = supervisorDao.deleteComReview(conn, comBoardNo);
			if(comBoardNo.length == result)
				commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {			
			close(conn);
		}
		return result;
	}

	public int getTotalAmCnt() {
		Connection conn = getConnection();
		int totalAmCnt = supervisorDao.getTotalAmCnt(conn);
		close(conn);
		return totalAmCnt;
	}

	public int getTotalRmCnt() {
		Connection conn = getConnection();
		int totalRmCnt = supervisorDao.getTotalRmCnt(conn);
		close(conn);
		return totalRmCnt;
	}

	//????????? ?????? 
	public int deleteAmember(String[] amUid) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = supervisorDao.deleteAmember(conn, amUid);
			if(amUid.length == result)
				commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {			
			close(conn);
		}
		return result;
	}

	//????????? ??????
	public int deleteRmember(String[] rmUid) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = supervisorDao.deleteRmember(conn, rmUid);
			if(rmUid.length == result)
				commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {			
			close(conn);
		}
		return result;
	}

	
	public List<AmemberLog> getAmemberLogAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<AmemberLog> amLogList = supervisorDao.getAmemberLogAll(conn, param);
		close(conn);
		return amLogList;
	}

	public List<RmemberLog> getRmemberLogAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<RmemberLog> rmLogList = supervisorDao.getRmemberLogAll(conn, param);
		close(conn);
		return rmLogList;
	}

	public List<SalLog> getSalLogAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<SalLog> salLogList = supervisorDao.getSalLogAll(conn, param);
		close(conn);
		return salLogList;
	}

	public List<RecLog> getRecLogAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<RecLog> recLogList = supervisorDao.getRecLogAll(conn, param);
		close(conn);
		return recLogList;
	}

	public List<ComLog> getComLogAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<ComLog> comLogList = supervisorDao.getComLogAll(conn, param);
		close(conn);
		return comLogList;
	}

	public int getTotalAmLogCnt() {
		Connection conn = getConnection();
		int totalAmLogCnt = supervisorDao.getTotalAmLogCnt(conn);
		close(conn);
		return totalAmLogCnt;
	}

	public int getTotalRmLogCnt() {
		Connection conn = getConnection();
		int totalRmLogCnt = supervisorDao.getTotalRmLogCnt(conn);
		close(conn);
		return totalRmLogCnt;
	}

	public int getTotalSalLogCnt() {
		Connection conn = getConnection();
		int totalSalLogCnt = supervisorDao.getTotalSalLogCnt(conn);
		close(conn);
		return totalSalLogCnt;
	}

	public int getTotalComLogCnt() {
		Connection conn = getConnection();
		int totalComLogCnt = supervisorDao.getTotalComLogCnt(conn);
		close(conn);
		return totalComLogCnt;
	}

	public int getTotalRecLogCnt() {
		Connection conn = getConnection();
		int totalRecLogCnt = supervisorDao.getTotalRecLogCnt(conn);
		close(conn);
		return totalRecLogCnt;
	}

	
	
}
