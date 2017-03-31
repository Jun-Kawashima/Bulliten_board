package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Management;
import service.ManagementService;

@WebServlet (urlPatterns={"/managementuser"})
public class ManagementUserServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		List<Management> managementusers = new ManagementService().getUser();
		request.setAttribute("managements", managementusers);

		request.getRequestDispatcher("managementUser.jsp").forward(request,  response);
	}

	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		Management userStatus = getUserStatus(request);
		session.setAttribute("userStatus", userStatus);
		new ManagementService().Update(userStatus);
		response.sendRedirect("managementuser");
	}

	private Management getUserStatus(HttpServletRequest request)throws IOException, ServletException {
		Management status = new Management();
		status.setIsStoped(Integer.parseInt(request.getParameter("is_stoped")));
		status.setId(Integer.parseInt(request.getParameter("id")));
		return status;
	}
}