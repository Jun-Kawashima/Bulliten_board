package dao;

import static utils.CloseableUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.Comment;
import exception.SQLRuntimeException;

public class CommentDao {

	public void insert (Connection connection, Comment text) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO comments (");
			sql.append("  text");
			sql.append(", user_id");
			sql.append(", message_id");
			sql.append(", created_at");
			sql.append(") VALUES (");

			sql.append("  ?"); //text
			sql.append(", ?"); //user_id
			sql.append(", ?"); //message_id
			sql.append(", CURRENT_TIMESTAMP"); //created_at
			sql.append(")");

			ps = connection.prepareStatement(sql.toString());

			ps.setString(1, text.getText());
			ps.setInt(2, text.getUserId());
			ps.setInt(3, text.getMessageId());
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
}