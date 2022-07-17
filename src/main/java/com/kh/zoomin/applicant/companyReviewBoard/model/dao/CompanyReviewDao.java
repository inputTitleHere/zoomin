package com.kh.zoomin.applicant.companyReviewBoard.model.dao;

import static com.kh.zoomin.common.JdbcTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.zoomin.applicant.companyReviewBoard.model.dto.CompanyReview;
import com.kh.zoomin.applicant.companyReviewBoard.model.dto.CompanyReviewExt;
import com.kh.zoomin.applicant.companyReviewBoard.model.exception.CompanyReviewException;


public class CompanyReviewDao {

	private Properties prop = new Properties();

	public CompanyReviewDao() {
		String filename = CompanyReviewDao.class.getResource("/sql/zoomin/applicant/companyreview-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertCompanyReview(Connection conn, CompanyReview companyReview) {
		PreparedStatement pstmt = null;
		int result = 0;
		// insertReview = insert into COMPANY_REVIEW values (seq_no, ?, ?, ?, ?, ?,?,?,?,?,?, default)
		String sql = prop.getProperty("insertCompanyReview");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, '"'+ companyReview.getUid() + '"');
			pstmt.setString(2, companyReview.getCompanyNo());
			pstmt.setInt(3, companyReview.getCategoryNumber());
			pstmt.setString(4, companyReview.getContent());
			pstmt.setInt(5, companyReview.getStars());
			pstmt.setInt(6, companyReview.getWorkLifeBalance());
			pstmt.setInt(7, companyReview.getLevelUp());
			pstmt.setInt(8, companyReview.getWorkIntensity());
			pstmt.setInt(9, companyReview.getPotential());
			pstmt.setInt(10, companyReview.getSalarySatisfaction());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new CompanyReviewException("회사 리뷰 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public CompanyReview findByCompanyReviewNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CompanyReview companyReview = null;
		// findByCompanyReviewNo = select * from company_review where no = ?
		String sql = prop.getProperty("findByCompanyReviewNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				companyReview = handleCompanyReviewResultSet(rset);
			}
		} catch (Exception e) {
			throw new CompanyReviewException("리뷰 1건 조회 오류!", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return companyReview;
	}

	private CompanyReviewExt handleCompanyReviewResultSet(ResultSet rset) throws SQLException {
		int no = rset.getInt("no");
		String content = rset.getString("content");
		int stars = rset.getInt("stars");
		int workLifeBalance = rset.getInt("work_life_balance");
		int levelUp = rset.getInt("level_up");
		int workIntensity = rset.getInt("work_intensity");
		int potential = rset.getInt("potential");
		int salarySatisfaction = rset.getInt("salary_satisfaction");
		Date regDate = rset.getDate("reg_date");
		return new CompanyReviewExt(no, content, stars, workLifeBalance, levelUp, workIntensity, potential, salarySatisfaction, regDate);
	}

	public int updateCompanyReview(Connection conn, CompanyReviewExt companyReview) {
		PreparedStatement pstmt = null;
		int result = 0;
		// update company_review set content = ?, stars = ?, work_life_balance = ?, level_up = ? , work_intensity = ?, potential = ?, salay_satisfaction =? where no = ?
		String sql = prop.getProperty("updateCompanyReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, companyReview.getContent());
			pstmt.setInt(2, companyReview.getStars());
			pstmt.setInt(3, companyReview.getWorkLifeBalance());
			pstmt.setInt(4, companyReview.getLevelUp());
			pstmt.setInt(5, companyReview.getWorkIntensity());
			pstmt.setInt(6, companyReview.getPotential());
			pstmt.setInt(7, companyReview.getSalarySatisfaction());
			pstmt.setInt(8, companyReview.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new CompanyReviewException("리뷰 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCompanyReview(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		// deleteCompanyReview = delete from company_review where no = ?
		String sql = prop.getProperty("deleteCompanyReview");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw new CompanyReviewException("리뷰 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	
}
