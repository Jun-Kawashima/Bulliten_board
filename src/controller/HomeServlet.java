package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import beans.UserNewComment;
import beans.UserNewPost;
import service.CommentService;
import service.NewPostService;

@WebServlet (urlPatterns={"/index.jsp"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Timestamp startdate = new NewPostService().getCreatedAt();
		String start = date.format(startdate);
		if (request.getParameter("start") != null && request.getParameter("start") != "") {
			start = request.getParameter("start") + " 00:00:00";
		}
		if (StringUtils.isEmpty(start)) {
			start = request.getParameter("start");
		}

		String end = date.format(new Date());
		if (request.getParameter("end") != null && request.getParameter("end") != "") {
			end = request.getParameter("end" )+ " 23:59:59";
		}
		if (StringUtils.isEmpty(end)) {
			end = request.getParameter("end");
		}

		String category = request.getParameter("category");
		if (!StringUtils.isEmpty(category)) {
			category = request.getParameter("category");
		}

		List<UserNewComment> comments = new CommentService().getNewComment();//コメント
		List<UserNewPost> messages =new NewPostService().getNewPost(start, end, category);//投稿
		List<UserNewPost> categories =  new NewPostService().getNewPostCategory();//カテゴリ
		String category1 = request.getParameter("category");
		request.setAttribute("messages", messages);
		request.setAttribute("comments", comments);
		request.setAttribute("categories", categories);
		request.setAttribute("start", request.getParameter("start"));
		request.setAttribute("end", request.getParameter("end"));
		request.setAttribute("category", category1);

		request.getRequestDispatcher("/top.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<UserNewComment> comments = new CommentService().getNewComment();
		String category1 = request.getParameter("category");
		request.setAttribute("comments", comments);
		request.setAttribute("start", request.getParameter("start"));
		request.setAttribute("end", request.getParameter("end"));
		request.setAttribute("category", category1);

		request.getRequestDispatcher("/top.jsp").forward(request, response);
	}
}