package beans;

import java.io.Serializable;
import java.util.Date;

public class NewPost implements Serializable {
	private static final long serialVersionUID = 1L;

	private String object;
	private String text;
	private String category;
	private Date created_at;
	private int id;

	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}