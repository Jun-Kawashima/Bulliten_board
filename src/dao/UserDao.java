package dao;

import static utils.CloseableUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import beans.User;
import exception.SQLRuntimeException;

public class UserDao {
	public User getUser(Connection connection, String account, String encPassword) {
		PreparedStatement ps = null;
		try {
			String sql = "SELECT * FROM users WHERE account = ? AND password = ?";
			ps = connection.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, encPassword);

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

				User users = new User();
				users.setId(id);
				users.setName(name);
				users.setAccount(account);
				users.setPassword(password);
				users.setBranchId(branch_id);
				users.setDepartmentId(department_id);
				users.setIsStoped(is_stoped);

				ret.add(users);
			}
			return ret;
		} finally {
			close(rs);
		}
	}

	public void insert(Connection connection, User users) {
		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO users ( ");
			//			sql.append("id");
			sql.append("  name");
			sql.append(", account");
			sql.append(", password");
			sql.append(", branch_id");
			sql.append(", department_id");
			sql.append(", created_at");
			//			sql.append(", message_id");
			sql.append(", updated_at");
			sql.append(") VALUES (");
			//			sql.append(""); //id
			sql.append("  ?"); //name
			sql.append(", ?"); //account
			sql.append(", ?"); //password
			sql.append(", ?"); //branch_id
			sql.append(", ?"); //department_id
			sql.append(", CURRENT_TIMESTAMP"); //created_at
			sql.append(", CURRENT_TIMESTAMP"); //updateed_at
			sql.append(") ");

			ps = connection.prepareStatement(sql.toString());

			ps.setString(1, users.getName());
			ps.setString(2, users.getAccount());
			ps.setString(3, users.getPassword());
			ps.setInt(4, users.getBranchId());
			ps.setInt(5, users.getDepartmentId());

			ps.executeUpdate();
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}

	public void update(Connection connection, User users) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE users SET");
			sql.append("  name = ?");
			sql.append(", account = ?");
			if (!StringUtils.isEmpty(users.getPassword())) {
				sql.append(", password = ?");
			}
			sql.append(", branch_id = ?");
			sql.append(", department_id = ?");
			sql.append(" WHERE");
			sql.append(" id = ?");

			ps = connection.prepareStatement(sql.toString());

			ps.setString(1, users.getName());
			ps.setString(2, users.getAccount());
			if (!StringUtils.isEmpty(users.getPassword())) {
				ps.setString(3, users.getPassword());
				ps.setInt(4, users.getBranchId());
				ps.setInt(5, users.getDepartmentId());
				ps.setInt(6, users.getId());
			} else {
			ps.setInt(3, users.getBranchId());
			ps.setInt(4, users.getDepartmentId());
			ps.setInt(5, users.getId());
			ps.executeUpdate();
			}

		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}

	public User getUser(Connection connection, int id) {
		PreparedStatement ps = null;
		try {
			String sql = "SELECT * FROM users WHERE id = ?";

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
	public User getSuffer(Connection connection, String account) {
		PreparedStatement ps = null;
		try {
			String sql = "SELECT * FROM users WHERE account = ?";

			ps = connection.prepareStatement(sql);
			ps.setString(1, account);

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
