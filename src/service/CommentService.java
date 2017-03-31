package service;

import static utils.CloseableUtil.*;
import static utils.DBUtil.*;

import java.sql.Connection;
import java.util.List;

import beans.Comment;
import beans.UserNewComment;
import dao.CommentDao;
import dao.UserNewCommentDao;

public class CommentService {

	public void register(Comment text) {

		Connection connection = null;
		try {
			connection = getConnection();

			CommentDao messageDao = new CommentDao();
			messageDao.insert(connection, text);

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

	public List<UserNewComment> getNewComment() {//コメント

		Connection connection = null;
		try {
			connection = getConnection();

			UserNewCommentDao messageDao = new UserNewCommentDao();
			List<UserNewComment> ret = messageDao.getUserNewComment(connection);

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
	public void delete(Comment comments) {

		Connection connection = null;
		try {
			connection = getConnection();

			UserNewCommentDao commentDao = new UserNewCommentDao();
			commentDao.getDelete(connection, comments);

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