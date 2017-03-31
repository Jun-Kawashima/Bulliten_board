package service;

import static utils.CloseableUtil.*;
import static utils.DBUtil.*;

import java.sql.Connection;

import org.apache.commons.lang.StringUtils;

import beans.User;
import dao.UserDao;
import utils.CipherUtil;

public class UserService {
	public void register(User users) {
		Connection connection = null;
		try {
			connection = getConnection();

				String encPassword = CipherUtil.encrypt(users.getPassword());
				users.setPassword(encPassword);

			UserDao userDao = new UserDao();
			userDao.insert(connection, users);

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

	public void update(User users) {

		Connection connection = null;
		try {
			connection = getConnection();

			if (!StringUtils.isEmpty(users.getPassword())) {
				String encPassword = CipherUtil.encrypt(users.getPassword());
				users.setPassword(encPassword);
			}

			UserDao userDao = new UserDao();
			userDao.update(connection, users);

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

	public User getUser(int userId) {
		Connection connection = null;
		try {
			connection = getConnection();

			UserDao userDao = new UserDao();
			User user = userDao.getUser(connection, userId);

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
	public User getSuffer(String account) {
		Connection connection = null;
		try {
			connection = getConnection();

			UserDao userDao = new UserDao();
			User user = userDao.getSuffer(connection, account);

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
}