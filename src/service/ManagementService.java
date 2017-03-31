package service;

import static utils.CloseableUtil.*;
import static utils.DBUtil.*;

import java.sql.Connection;
import java.util.List;

import beans.Management;
import dao.ManagementDao;

public class ManagementService {
	public List<Management> getUser() {
		Connection connection = null;
		try {
			connection = getConnection();

			ManagementDao managementDao = new ManagementDao();
			List<Management> user = managementDao.getUser(connection);

			commit(connection);

			return user;
		} catch (RuntimeException e) {
			rollback(connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}
	public void Update(Management users) {

		Connection connection = null;
		try {
			connection = getConnection();

			ManagementDao managementDao = new ManagementDao();
			managementDao.update(connection, users);

			commit(connection);
		} catch (RuntimeException e) {
			rollback(connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}

	public void Delete(Management users) {

		Connection connection = null;
		try {
			connection = getConnection();

			ManagementDao managementDao = new ManagementDao();
			managementDao.delete(connection, users);

			commit(connection);
		} catch (RuntimeException e) {
			rollback(connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}
}