package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import beans.NewPost;
import beans.User;
import service.NewPostService;

@WebServlet(urlPatterns = { "/newpost" })
public class NewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		List<String> messages = new ArrayList<String>();

		if (isValid(request, messages) == true) {

			User user = (User) session.getAttribute("");

			NewPost message = new NewPost();
			message.setText(request.getParameter(""));
			message.setUserId(user.getId());

			new NewPostService().register(message);

			response.sendRedirect("./");
		} else {
			session.setAttribute("errorMessages", messages);
			response.sendRedirect("./");
		}
	}

	private boolean isValid(HttpServletRequest request, List<String>messages) {

		String message = request.getParameter("message");

		if (StringUtils.isEmpty(message) == true) {
			messages.add("メッセージを入力してください");
		}
		if (140 < message.length()) {
			messages.add("140文字以下で入力してください");
		}
		if (messages.size() == 0){
			return true;
		} else {
			return false;
		}
	}
}