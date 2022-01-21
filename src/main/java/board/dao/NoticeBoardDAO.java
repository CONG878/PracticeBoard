package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.base.BaseDB;
import board.model.NoticeBoardVO;

public class NoticeBoardDAO extends BaseDB {

	// field

	// R
	public ArrayList<NoticeBoardVO> All_read(int pg, int ppn) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> al = new ArrayList<NoticeBoardVO>();

		try {
			StringBuffer qry = new StringBuffer().append(" SELECT * FROM noticeboard ORDER BY num DESC ")
					.append(" limit " + ((pg - 1) * ppn) + ", " + ppn + " ");
			String sql = qry.toString();

			// 드라이버 로드
			// 연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql 실행
			rs = stmt.executeQuery();
			// Restset 결과처리
			while (rs.next()) {
				NoticeBoardVO nvo = new NoticeBoardVO();
				nvo.setNum(rs.getInt("num"));
				nvo.setSubject(rs.getString("subject"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriterId(rs.getString("writerId"));
				nvo.setWriterName(rs.getString("writerName"));
				nvo.setWriterDate(rs.getTimestamp("writerDate"));
				nvo.setHit(rs.getInt("hit"));
				nvo.setIp(rs.getString("ip"));
				nvo.setLike(rs.getInt("like"));
				nvo.setReplyCount(rs.getInt("replyCount"));

				al.add(nvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, rs);
		}

		return al;
	}

	public NoticeBoardVO read(int num) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		NoticeBoardVO nvo = null;

		try {

			StringBuffer qry = new StringBuffer().append(" SELECT * FROM noticeboard WHERE num = ? ORDER BY num DESC ");
			String sql = qry.toString();
			// 드라이버 로드

			// 연결
			conn = getConn();

			// statement 생성
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, num);

			// sql 실행
			rs = stmt.executeQuery();
			// Resultset 결과처리
			if (rs.next()) {
				nvo = new NoticeBoardVO();
				nvo.setNum(rs.getInt("num"));
				nvo.setSubject(rs.getString("subject"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriterId(rs.getString("writerId"));
				nvo.setWriterName(rs.getString("writerName"));
				nvo.setWriterDate(rs.getTimestamp("writerDate"));
				nvo.setHit(rs.getInt("hit"));
				nvo.setIp(rs.getString("ip"));
				nvo.setLike(rs.getInt("like"));
				nvo.setReplyCount(rs.getInt("replyCount"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 연결 닫기
			dbClose(conn, stmt, rs);
		}

		return nvo;
	}

	public void create(NoticeBoardVO nvo) {
		Connection conn = null;
		PreparedStatement stmt = null;

		StringBuffer qry = new StringBuffer().append(" INSERT INTO noticeboard SET subject = ?, ")
				.append(" content = ?, writerId = ?, writerName = ?, writerDate = now(), hit = null, ip = ? ");

		String sql = qry.toString();

		try {
			// 드라이브로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 디비연결
			conn = getConn();
			// statment 생성
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, nvo.getSubject());
			stmt.setString(2, nvo.getContent());
			stmt.setString(3, nvo.getWriterId());
			stmt.setString(4, nvo.getWriterName());
			stmt.setString(5, nvo.getIp());
			// sql실행

			stmt.executeUpdate();

			stmt.setInt(1, nvo.getNum());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 닫기
			try {
				if (conn != null)
					conn.close();
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void readHit(int num) {
		Connection conn = null;
		PreparedStatement stmt = null;
		StringBuffer qry = new StringBuffer().append(" UPDATE noticeboard SET hit = IFNULL(hit,0)+1 WHERE num = ? ");

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql실행
			stmt.setInt(1, num);
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}

	}

	public void update(NoticeBoardVO nvo) {
		Connection conn = null;
		PreparedStatement stmt = null;

		StringBuffer qry = new StringBuffer().append(" UPDATE noticeboard SET subject = ?, content = ? WHERE num = ? ");
		// .append(" like = ?, ")

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql실행
			stmt.setString(1, nvo.getSubject());
			stmt.setString(2, nvo.getContent());
			// stmt.setInt(3, nvo.getLike());
			stmt.setInt(3, nvo.getNum());

			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}
	}

	public ArrayList<NoticeBoardVO> search(String search) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> al = new ArrayList<NoticeBoardVO>();

		StringBuffer qry = new StringBuffer().append(" SELECT * FROM noticeboard WHERE ")
				.append(" subject LIKE ? OR content LIKE ? ORDER BY num DESC LIMIT 0 , 10 ");

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql실행
			stmt.setString(1, "%" + search + "%");
			stmt.setString(2, "%" + search + "%");

			rs = stmt.executeQuery();

			while (rs.next()) {
				NoticeBoardVO nvo = new NoticeBoardVO();
				nvo.setNum(rs.getInt("num"));
				nvo.setSubject(rs.getString("subject"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriterId(rs.getString("writerId"));
				nvo.setWriterName(rs.getString("writerName"));
				nvo.setWriterDate(rs.getTimestamp("writerDate"));
				nvo.setHit(rs.getInt("hit"));
				nvo.setIp(rs.getString("ip"));
				nvo.setLike(rs.getInt("like"));
				nvo.setReplyCount(rs.getInt("replyCount"));

				al.add(nvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}

		return al;
	}

	public ArrayList<NoticeBoardVO> t_search(String t_search) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> al = new ArrayList<NoticeBoardVO>();

		StringBuffer qry = new StringBuffer().append(" SELECT * FROM noticeboard WHERE subject LIKE ? ")
				.append(" UNION SELECT * FROM freeboard WHERE subject LIKE ? ORDER BY num DESC LIMIT 0 , 10 ");

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql실행
			stmt.setString(1, "%" + t_search + "%");
			stmt.setString(2, "%" + t_search + "%");

			rs = stmt.executeQuery();

			while (rs.next()) {
				NoticeBoardVO nvo = new NoticeBoardVO();
				nvo.setNum(rs.getInt("num"));
				nvo.setSubject(rs.getString("subject"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriterId(rs.getString("writerId"));
				nvo.setWriterName(rs.getString("writerName"));
				nvo.setWriterDate(rs.getTimestamp("writerDate"));
				nvo.setHit(rs.getInt("hit"));
				nvo.setIp(rs.getString("ip"));
				nvo.setLike(rs.getInt("like"));
				nvo.setReplyCount(rs.getInt("replyCount"));

				al.add(nvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}

		return al;
	}

	public ArrayList<NoticeBoardVO> arrayHit() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> al = new ArrayList<NoticeBoardVO>();

		try {
			StringBuffer qry = new StringBuffer().append(" SELECT * FROM noticeboard ORDER BY hit DESC LIMIT 0, 3 ");
			String sql = qry.toString();
			// 드라이버 로드
			// 연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql 실행
			rs = stmt.executeQuery();
			// Resultset 결과처리
			while (rs.next()) {
				NoticeBoardVO nvo = new NoticeBoardVO();
				nvo.setNum(rs.getInt("num"));
				nvo.setSubject(rs.getString("subject"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriterId(rs.getString("writerId"));
				nvo.setWriterName(rs.getString("writerName"));
				nvo.setWriterDate(rs.getTimestamp("writerDate"));
				nvo.setHit(rs.getInt("hit"));
				nvo.setIp(rs.getString("ip"));
				nvo.setLike(rs.getInt("like"));
				nvo.setReplyCount(rs.getInt("replyCount"));

				al.add(nvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, rs);
		}

		return al;
	}

	public int conting() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int totalRows = 0;
		StringBuffer qry = new StringBuffer().append(" SELECT count(*) count FROM noticeboard ");

		String sql = qry.toString();
		try {
			// 드라이브로드
			// 디비연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql실행
			rs = stmt.executeQuery();

			if (rs.next()) {
				totalRows = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, null);
		}
		return totalRows;

	}

	public ArrayList<NoticeBoardVO> arrayNew() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBoardVO> al = new ArrayList<NoticeBoardVO>();

		try {
			StringBuffer qry = new StringBuffer().append(" SELECT * FROM noticeboard ORDER BY num DESC LIMIT 0, 2 ");
			String sql = qry.toString();
			// 드라이버 로드
			// 연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);
			// sql 실행
			rs = stmt.executeQuery();
			// Resultset 결과처리
			while (rs.next()) {
				NoticeBoardVO nvo = new NoticeBoardVO();
				nvo.setNum(rs.getInt("num"));
				nvo.setSubject(rs.getString("subject"));
				nvo.setContent(rs.getString("content"));
				nvo.setWriterId(rs.getString("writerId"));
				nvo.setWriterName(rs.getString("writerName"));
				nvo.setWriterDate(rs.getTimestamp("writerDate"));
				nvo.setHit(rs.getInt("hit"));
				nvo.setIp(rs.getString("ip"));
				nvo.setLike(rs.getInt("like"));
				nvo.setReplyCount(rs.getInt("replyCount"));

				al.add(nvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, rs);
		}

		return al;
	}

	public void delete(int bnum) {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String user = "root";
			String password = "smart";
			StringBuffer qry = new StringBuffer().append(" DELETE FROM noticeboard WHERE num = ? ");
			String sql = qry.toString();
			// 드라이버 로드
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 연결
			conn = DriverManager.getConnection(url, user, password);

			// statement 생성
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, bnum);

			// sql 실행
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 연결 닫기
			try {
				if (conn != null)
					conn.close();
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
