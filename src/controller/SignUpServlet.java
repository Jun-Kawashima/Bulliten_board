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

import beans.User;
import service.UserService;

@WebServlet (urlPatterns={"/signup"})
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.getRequestDispatcher("signup.jsp").forward(request,  response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<String> messages = new ArrayList<String>();

		String account  = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String branch_id = request.getParameter("branch_id");
		String department_id = request.getParameter("department_id");

		request.setAttribute("account", account);
		request.setAttribute("password", password);
		request.setAttribute("name", name);
		request.setAttribute("branch_id", branch_id);
		request.setAttribute("department_id", department_id);

		HttpSession session = request.getSession();
		if(isValid(request, messages) == true) {

			User user = new User();
			user.setName(request.getParameter("name"));
			user.setAccount(request.getParameter("account"));
			user.setPassword(request.getParameter("password"));
			user.setBranch_id(Integer.parseInt("branch_id"));
			user.setDepartment_id(Integer.parseInt("department_id"));

			new UserService().register(user);
			session.removeAttribute("errorMessages");
			response.sendRedirect("./usermanagement");
		} else {
			session.setAttribute("errorMessages", messages);
			request.getRequestDispatcher("/").forward(request, response);
		}
	}
	private boolean isValid (HttpServletRequest request, List<String>messages) {
		String name = request.getParameter("name");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String branch_id = request.getParameter("branch_id");
		String department_id = request.getParameter("department_id");

		//バリデーションメッセージ
		if (StringUtils.isEmpty(name)) {
			messages.add("名前を入力してください");
		}
		if (10 <= name.length()) {
			messages.add("10文字以下で入力してください");
		}
		if (StringUtils.isEmpty(account)) {
			messages.add("ログインIDを入力してください");
		}
		if (account.matches("[a-zA-Z0-9]{6,20}")) {
			messages.add("ログインIDは半角英数字6文字以上20文字以下で入力してください");
		}
		if (StringUtils.isEmpty(password)) {
			messages.add("パスワードを入力してください");
		}
		if (6 <= password.length()) {
			messages.add("パスワードは6文字以上で入力してください");
		}
		if (StringUtils.isEmpty(branch_id)) {
			messages.add("支店名を入力してください");
		}
		if (StringUtils.isEmpty(department_id)) {
			messages.add("部署名または役職名を入力してください");
		}

		if (messages.size() == 0){
			return true;
		} else {
			return false;
		}
	}
}