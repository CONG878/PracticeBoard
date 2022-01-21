package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.base.BaseDB;
import board.model.ReplyVO;

public class ReplyDAO extends BaseDB {

	public void create(ReplyVO rvo) {
		Connection conn = null;
		PreparedStatement stmt = null;

		StringBuffer qry = new StringBuffer().append(" INSERT INTO reply SET refNum = ?, comment = ?,  goodHit = null,")
				.append(" writerId = ?, writerName = ?, ").append(" writerDate = now(), badHit = null ");

		String sql = qry.toString();

		try {
			// 드라이브로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 디비연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, rvo.getRefNum());
			stmt.setString(2, rvo.getComment());
			stmt.setString(3, rvo.getWriterId());
			stmt.setString(4, rvo.getWriterName());
			// sql실행

			stmt.executeUpdate();

			// stmt.setInt(1, nvo.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 닫기
			try {
				if (conn != null)
					conn.close();
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public int counting(int bnum) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalRows = 0;
		StringBuffer qry = new StringBuffer().append(" SELECT count(*) count FROM reply ").append(" WHERE refNum = ? ");

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statment 생성
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, bnum);
			// sql실행
			rs = stmt.executeQuery();

			if (rs.next()) {
				totalRows = rs.getInt("count");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}
		return totalRows;
	}

	public ArrayList<ReplyVO> read(int bnum) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ReplyVO> al = new ArrayList<ReplyVO>();

		try {

			StringBuffer qry = new StringBuffer().append(" SELECT * FROM reply ").append(" WHERE refNum = ? ")
					.append(" ORDER BY num DESC ").append(" LIMIT 0 , 10 ");
			String sql = qry.toString();
			// 드라이버 로드

			// 연결
			conn = getConn();

			// statement 생성
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, bnum);

			// sql 실행
			rs = stmt.executeQuery();
			// Restset 결과처리
			while (rs.next()) {
				ReplyVO rvo = new ReplyVO();
				rvo.setNum(rs.getInt("num"));
				rvo.setComment(rs.getString("comment"));
				rvo.setWriterId(rs.getString("writerId"));
				rvo.setWriterName(rs.getString("writerName"));
				rvo.setWriterDate(rs.getTimestamp("writerDate"));
				rvo.setGoodHit(rs.getInt("goodHit"));
				rvo.setBadHit(rs.getInt("badHit"));
				rvo.setIp(rs.getString("ip"));

				al.add(rvo);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 연결 닫기
			dbClose(conn, stmt, rs);
		}

		return al;
	}

	public void bo_update(int bnum) {
		Connection conn = null;
		PreparedStatement stmt = null;
		StringBuffer qry = new StringBuffer().append(" UPDATE noticeboard ")
				.append(" SET replyCount = IFNULL(replyCount,0)+1 ").append(" WHERE num = ? ");

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statment 생성
			stmt = conn.prepareStatement(sql);
			// sql실행
			stmt.setInt(1, bnum);
			stmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}

	}

}
