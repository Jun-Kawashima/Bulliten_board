package dao;

import static utils.CloseableUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.NewPost;
import exception.SQLRuntimeException;

public class NewPostDao {

	public void insert (Connection connection, NewPost message) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO message (");
//			sql.append("id");
			sql.append(", object");
			sql.append(", text");
			sql.append(", category");
			sql.append(" id");
			sql.append(", created_at");
			sql.append(", updated_at");
			sql.append(") VALUES (");

			sql.append(" ?");
			sql.append(", ?");
			sql.append(", ?");
			sql.append(", ?");
			sql.append(", CURRENT_TIMESTAMP"); //insert_date
			sql.append(", CURRENT_TIMESTAMP"); //update_date
			sql.append(")");

			ps = connection.prepareStatement(sql.toString());

			ps.setInt(1, message.getId());
			ps.setString(2, message.getText());
			System.out.println(ps.toString());
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
}