package service;

import static utils.CloseableUtil.*;
import static utils.DBUtil.*;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;

import beans.NewPost;
import beans.UserNewPost;
import dao.NewPostDao;
import dao.UserNewPostDao;

public class NewPostService {

	public void register(NewPost messages) {

		Connection connection = null;
		try {
			connection = getConnection();

			NewPostDao messageDao = new NewPostDao();
			messageDao.insert(connection, messages);

			commit (connection);
		} catch (RuntimeException e) {
			rollback (connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}

	public Timestamp getCreatedAt() {//カテゴリ

		Connection connection = null;

		try {
			connection = getConnection();

			UserNewPostDao messageDao = new UserNewPostDao();
			Timestamp ret = messageDao.getCreatedAt(connection);

			commit(connection);

			return ret;
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

	public List<UserNewPost> getNewPost(String start, String end, String category) {//投稿

		Connection connection = null;
		try {
			connection = getConnection();

			UserNewPostDao messageDao = new UserNewPostDao();
			List<UserNewPost> ret = messageDao.getUserNewPost(connection, start, end, category);

			commit(connection);

			return ret;
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

	public List<UserNewPost> getNewPostCategory() {//カテゴリ

		Connection connection = null;

		try {
			connection = getConnection();

			UserNewPostDao messageDao = new UserNewPostDao();
			List<UserNewPost> ret = messageDao.getUserNewPost(connection);

			commit(connection);

			return ret;
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
	public void delete(NewPost messages) {

		Connection connection = null;
		try {
			connection = getConnection();

			UserNewPostDao messageDao = new UserNewPostDao();
			messageDao.getDelete(connection, messages);

			commit (connection);
		} catch (RuntimeException e) {
			rollback (connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}
}