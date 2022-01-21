package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.base.BaseDB;

public class LikeDAO extends BaseDB {

	public int like(String post_Id, String user_Id, String ip) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			StringBuffer qry = new StringBuffer().append(" SELECT * FROM likey INSERT INTO LIKEY VALUES (?, ?, ?) ");
			String sql = qry.toString();
			// 드라이버 로드
			// 연결
			conn = getConn();
			// statement 생성
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, post_Id);
			stmt.setString(2, user_Id);
			stmt.setString(3, ip);
			// sql 실행
			rs = stmt.executeQuery();

			if (rs.next()) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(conn, stmt, rs);
		}

		return -1;
	}
}
