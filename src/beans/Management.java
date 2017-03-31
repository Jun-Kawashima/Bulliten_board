package beans;

import java.io.Serializable;

public class Management implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private String account;
	private String password;
	private int branch_id;
	private int department_id;
	private String branch_name;
	private String department_name;
	private int is_stoped;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public int getBranchId() {
		return branch_id;
	}
	public void setBranchId(int branch_id) {
		this.branch_id = branch_id;
	}

	public int getDepartmentId() {
		return department_id;
	}
	public void setDepartmentId(int department_id) {
		this.department_id = department_id;
	}

	public String getBranchName() {
		return branch_name;
	}
	public void setBranchName(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getDepartmentName() {
		return department_name;
	}
	public void setDepartmentName(String department_name) {
		this.department_name = department_name;
	}
	public int getIsStoped() {
		return is_stoped;
	}
	public void setIsStoped(int is_stoped) {
		this.is_stoped = is_stoped;
	}
}