package model;

public class AnnonceSimple {
	private String id;
	private String lieu;
	private String description;
	private int budget;
	private UserSimple owner;
	public AnnonceSimple(String id, String lieu, String description, int budget, UserSimple owner) {
		super();
		this.id = id;
		this.lieu = lieu;
		this.description = description;
		this.budget = budget;
		this.owner = owner;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public UserSimple getOwner() {
		return owner;
	}
	public void setOwner(UserSimple owner) {
		this.owner = owner;
	}
	
}
