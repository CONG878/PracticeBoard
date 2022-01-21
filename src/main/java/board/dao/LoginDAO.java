package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.base.BaseDB;
import board.model.MemberVO;

public class LoginDAO extends BaseDB {

	public MemberVO loginChk(MemberVO amo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			StringBuffer qry = new StringBuffer().append(" SELECT * FROM member ")
					.append(" WHERE loginId = ? AND loginPw = sha2(?, 224) ");
			String sql = qry.toString();
			// 드라이버 로드
			// 연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, amo.getLoginId());
			stmt.setString(2, amo.getLoginPw());
			// sql 실행
			rs = stmt.executeQuery();

			if (rs.next()) {
				amo = new MemberVO();
				amo.setNum(rs.getInt("num"));
				amo.setLoginId(rs.getString("loginId"));
				amo.setLoginPw(rs.getString("loginPw"));
				amo.setLoginName(rs.getString("loginName"));
				amo.setTelNum(rs.getString("telNum"));
				amo.setAddr(rs.getString("Addr"));
				amo.setEmail(rs.getString("email"));
				amo.setLoginRole(rs.getString("LoginRole"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, rs);
		}

		return amo;
	}

	public String idchk(String loginId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String msg = null;
		try {
			StringBuffer qry = new StringBuffer().append(" SELECT * FROM member WHERE loginId = ? ");
			String sql = qry.toString();
			// 드라이버 로드
			// 연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, loginId);
			// sql 실행
			rs = stmt.executeQuery();

			if (rs.next()) {
				msg = "Y";
			} else {
				msg = "N";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, rs);
		}
		return msg;
	}
}
