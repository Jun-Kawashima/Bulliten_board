package dao;
import static utils.CloseableUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Management;
import exception.SQLRuntimeException;

public class ManagementDao {
	public Management getUser(Connection connection, String account, String encPassword) {

		PreparedStatement ps = null;
		try {
			String sql = "SELECT * FROM managements";
			ps = connection.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, encPassword);

			ResultSet rs = ps.executeQuery();
			List<Management> userList = toManagementList(rs);
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

	private List<Management> toManagementList(ResultSet rs) throws SQLException {

		List<Management> ret = new ArrayList<Management>();
		try {
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String account = rs.getString("account");
				int branch_id = rs.getInt("branch_id");
				int department_id = rs.getInt("department_id");
				String branch_name = rs.getString("branch_name");
				String department_name = rs.getString("department_name");
				int is_stoped = rs.getInt("is_stoped");

				Management users = new Management();
				users.setId(id);
				users.setName(name);
				users.setAccount(account);

				users.setBranchId(branch_id);
				users.setDepartmentId(department_id);
				users.setBranchName(branch_name);
				users.setDepartmentName(department_name);
				users.setIsStoped(is_stoped);

				ret.add(users);
			}
				return ret;
		} finally {
			close(rs);
		}
	}
	public List<Management> getUser(Connection connection) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM managements ");
			ps = connection.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();
			List<Management> UserList = toManagementList(rs);
			return UserList;
		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
	public void update(Connection connection, Management users) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE users SET");
			sql.append("  is_stoped = ?");
			sql.append(" WHERE");
			sql.append(" id = ?");

			ps = connection.prepareStatement(sql.toString());

			ps.setInt(1, users.getIsStoped());
			ps.setInt(2, users.getId());
//			System.out.println(ps.toString());
			ps.executeUpdate();

		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
	public void delete(Connection connection, Management users) {

		PreparedStatement ps = null;
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM board.users");
			sql.append(" WHERE");
			sql.append(" id = ?");

			ps = connection.prepareStatement(sql.toString());

			ps.setInt(1, users.getId());
//			System.out.println(ps.toString());
			ps.executeUpdate();

		} catch (SQLException e) {
			throw new SQLRuntimeException(e);
		} finally {
			close(ps);
		}
	}
}