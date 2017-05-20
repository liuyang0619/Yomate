package model;

public class Evaluation {
	private int note;
	private String date;
	private String description;
	private UserSimple userCommenter;
	private UserSimple userCommented;
	
	public int getNote() {
		return note;
	}
	public void setNote(int note) {
		this.note = note;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public UserSimple getUserCommenter() {
		return userCommenter;
	}
	public void setUserCommenter(UserSimple userCommenter) {
		this.userCommenter = userCommenter;
	}
	public UserSimple getUserCommented() {
		return userCommented;
	}
	public void setUserCommented(UserSimple userCommented) {
		this.userCommented = userCommented;
	}
	
}
