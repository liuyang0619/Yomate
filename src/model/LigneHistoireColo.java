package model;


public class LigneHistoireColo {
	private String dateDebut;
	private String dateFin;
	private AnnonceSimple annonce;
	private UserSimple user1;
	private UserSimple user2;
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDateFin() {
		return dateFin;
	}
	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	}
	public AnnonceSimple getAnnonce() {
		return annonce;
	}
	public void setAnnonce(AnnonceSimple annonce) {
		this.annonce = annonce;
	}
	public UserSimple getUser1() {
		return user1;
	}
	public void setUser1(UserSimple user1) {
		this.user1 = user1;
	}
	public UserSimple getUser2() {
		return user2;
	}
	public void setUser2(UserSimple user2) {
		this.user2 = user2;
	}
	
}
