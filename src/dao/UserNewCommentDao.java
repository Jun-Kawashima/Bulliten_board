package dao;

import static utils.CloseableUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import beans.Comment;
import beans.UserNewComment;
import exception.SQLRuntimeException;

public class UserNewCommentDao {

	public List<UserNewComment> getUserNewComment(Connection connection) {//コメント

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM users_comments ");
			sql.append("ORDER BY created_at ASC ");

			ps = connection.prepareStatement(sql.toString());


			ResultSet rs = ps.executeQuery();
			List<UserNewComment> ret = toUserNewCommentList(rs);
			return ret;
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}

	private List<UserNewComment> toUserNewCommentList(ResultSet rs)throws SQLException {//コメント

		List<UserNewComment> ret = new ArrayList<UserNewComment>();
		try {
			while (rs.next()) {
				int id = rs.getInt("id");
				int user_id = rs.getInt("user_id");
				String name = rs.getString("name");
				String account = rs.getString("account");
				String text = rs.getString("text");
				int message_id = rs.getInt("message_id");
				int branch_id = rs.getInt("branch_id");
				int department_id = rs.getInt("department_id");
				Timestamp created_at = rs.getTimestamp("created_at");

				UserNewComment message = new UserNewComment();
				message.setId(id);
				message.setUserId(user_id);
				message.setName(name);
				message.setAccount(account);
				message.setText(text);
				message.setMessageId(message_id);
				message.setBranchId(branch_id);
				message.setDepartmentId(department_id);
				message.setCreatedAt(created_at);

				ret.add(message);
			}
			return ret;
		} finally {
			close(rs);
		}
	}

	public void getDelete(Connection connection, Comment comments) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM board.comments ");
			sql.append(" WHERE");
			sql.append(" id = ?");

			ps = connection.prepareStatement(sql.toString());

			ps.setInt(1, comments.getUserId());
//			System.out.println(ps.toString());
			ps.executeUpdate();

		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
}