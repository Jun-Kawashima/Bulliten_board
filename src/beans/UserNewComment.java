package beans;

import java.io.Serializable;
import java.util.Date;

public class UserNewComment implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private int user_id;
	private String name;
	private String text;
	private String account;
	private int branch_id;
	private int department_id;
	private int message_id;
	private int comment_id;
	private Date created_at;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return user_id;
	}
	public void setUserId(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
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

	public int getMessageId() {
		return message_id;
	}
	public void setMessageId(int message_id) {
		this.message_id = message_id;
	}

	public int getCommentId() {
		return comment_id;
	}
	public void setCommentId(int comment_id) {
		this.comment_id = comment_id;
	}

	public Date getCreatedAt() {
		return created_at;
	}
	public void setCreatedAt(Date created_at) {
		this.created_at = created_at;
	}
}