package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Management;
import service.ManagementService;

@WebServlet (urlPatterns={"/deleteuser"})
public class DeleteUserServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Management user = getDeleteUserStatus(request);
		new ManagementService().Delete(user);
		response.sendRedirect("managementuser");
	}

	private Management getDeleteUserStatus(HttpServletRequest request)throws IOException, ServletException {
		Management status = new Management();
		status.setId(Integer.parseInt(request.getParameter("management.id")));
		return status;
	}
}
