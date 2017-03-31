package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.NewPost;
import service.NewPostService;

@WebServlet (urlPatterns={"/deletemessage"})
public class DeleteMessageServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		NewPost messages = getDeleteMessage(request);
		new NewPostService().delete(messages);
		response.sendRedirect("./");
	}

	private NewPost getDeleteMessage(HttpServletRequest request)throws IOException, ServletException {
		NewPost status = new NewPost();
		status.setUserId(Integer.parseInt(request.getParameter("message.id")));
		return status;
	}
}
