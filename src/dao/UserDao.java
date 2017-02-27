package dao;

import static utils.CloseableUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import beans.User;
import exception.SQLRuntimeException;

public class UserDao {
	public User getUser(Connection connection, String account, String password) {

		PreparedStatement ps = null;
		try {
			String sql = "SELECT * FROM user WHERE account = ?  AND password = ?";
			ps = connection.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			List<User> userList = toUserList(rs);
			if (userList.isEmpty() == true) {
				return null;
			} else if (2 <= userList.size()) {
				throw new IllegalStateException("2 <= userList.size()");
			} else {
				return userList.get(0);
			}
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}

	private List<User> toUserList(ResultSet rs) throws SQLException {

		List<User> ret = new ArrayList<User>();
		try {
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String account = rs.getString("account");
				String password = rs.getString("password");
				int branch_id = rs.getInt("branch_id");
				int department_id = rs.getInt("department_id");
				int is_stoped = rs.getInt("is_stoped");
				Timestamp created_at = rs.getTimestamp("created_at");
				Timestamp updated_at = rs.getTimestamp("updated_at");

				User user = new User();
				user.setId(id);
				user.setName(name);
				user.setAccount(account);
				user.setPassword(password);
				user.setBranch_id(branch_id);
				user.setDepartment_id(department_id);
				user.setIs_stoped(is_stoped);
				user.setCreated_at(created_at);
				user.setUpdated_at(updated_at);

				ret.add(user);
			}
				return ret;
		} finally {
			close(rs);
		}
	}
	public void insert(Connection connection, User user) {
		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO user ( ");
//			sql.append("id");
			sql.append(", name");
			sql.append(" account");
			sql.append(", password");
			sql.append(", branch_id");
			sql.append(", department_id");
			sql.append(", is_stoped");
			sql.append(", created_at");
			sql.append(", updated_at");
			sql.append(") VALUES (");
//			sql.append(""); //id
			sql.append(", ?"); //name
			sql.append(" ?"); //account
			sql.append(", ?"); //password
			sql.append(", ?"); //branch_id
			sql.append(", ?"); //department_id
			sql.append(", ?"); //is_stoped
			sql.append(", CURRENT_TIMESTAMP"); //created_at
			sql.append(", CURRENT_TIMESTAMP"); //updateed_at
			sql.append(") ");

			ps = connection.prepareStatement(sql.toString());


			ps.setString(1, user.getName());
			ps.setString(2, user.getAccount());
			ps.setString(3, user.getPassword());
			ps.setInt(4, user.getBranch_id());
			ps.setInt(5, user.getDepartment_id());
			ps.setInt(6, user.getIs_stoped());


			ps.executeUpdate();
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
	public void update(Connection connection, User user) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE user SET");
			sql.append(", name = ?");
			sql.append(" account = ?");
			sql.append(", password = ?");
			sql.append(", branch_id = ?");
			sql.append(", department_id = ?");
			sql.append(", is_stoped = ?");
			sql.append(", created_at = CURRENT_TIMESTAMP");
			sql.append(", updated_at = CURRENT_TIMESTAMP");
			sql.append(" WHERE");
			sql.append(" id = ?");
			sql.append(" AND = ?");
			sql.append(" update_date = ?");

			ps = connection.prepareStatement(sql.toString());

			ps.setString(1, user.getName());
			ps.setString(2, user.getAccount());
			ps.setString(3, user.getPassword());
			ps.setInt(4, user.getBranch_id());
			ps.setInt(5, user.getDepartment_id());
			ps.setInt(6, user.getIs_stoped());

		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
	public User getUser(Connection connection, int id) {
		PreparedStatement ps = null;
		try {
			String sql = "SELECT * FROM user WHERE id = ?";

			ps = connection.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			List<User> userList = toUserList(rs);
			if (userList.isEmpty() == true) {
				return null;
			} else if (2 <= userList.size()) {
				throw new IllegalStateException("2 <= userList.size");
			} else {
				return userList.get(0);
			}
		} catch (SQLException e) {
				throw new SQLRuntimeException(e);
		} finally {
				close(ps);
		}
	}
}