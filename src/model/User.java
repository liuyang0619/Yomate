package model;

import java.util.List;

public class User {
	private String id;
	public User(String id, String nom, String prenom, String email, String situationFam, String ecole,
			String profession, String nationnalite, boolean sex, boolean haspet) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.situationFam = situationFam;
		this.ecole = ecole;
		this.profession = profession;
		this.nationnalite = nationnalite;
		this.sex = sex;
		this.haspet = haspet;
		//construxtor of the lists
	}
	private String nom;
	private String prenom;
	private String email;
	private String situationFam;
	private String ecole;
	private String profession;
	private String nationnalite;
	private boolean sex;
	private boolean haspet;
	private List<AnnonceSimple> listAnnonceFavoris;
	private List<AnnonceSimple> listAnnonceHist;
	private List<Evaluation> listEvaluation;
	private List<String> listUrlPhoto;
	private List<String> listLangue;
	private List<String> listLoisir;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSituationFam() {
		return situationFam;
	}
	public void setSituationFam(String situationFam) {
		this.situationFam = situationFam;
	}
	public String getEcole() {
		return ecole;
	}
	public void setEcole(String ecole) {
		this.ecole = ecole;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getNationnalite() {
		return nationnalite;
	}
	public void setNationnalite(String nationnalite) {
		this.nationnalite = nationnalite;
	}
	public boolean isSex() {
		return sex;
	}
	public void setSex(boolean sex) {
		this.sex = sex;
	}
	public boolean isHaspet() {
		return haspet;
	}
	public void setHaspet(boolean haspet) {
		this.haspet = haspet;
	}
	public List<AnnonceSimple> getListAnnonceFavoris() {
		return listAnnonceFavoris;
	}
	public void setListAnnonceFavoris(List<AnnonceSimple> listAnnonceFavoris) {
		this.listAnnonceFavoris = listAnnonceFavoris;
	}
	public List<AnnonceSimple> getListAnnonceHist() {
		return listAnnonceHist;
	}
	public void setListAnnonceHist(List<AnnonceSimple> listAnnonceHist) {
		this.listAnnonceHist = listAnnonceHist;
	}
	public List<Evaluation> getListEvaluation() {
		return listEvaluation;
	}
	public void setListEvaluation(List<Evaluation> listEvaluation) {
		this.listEvaluation = listEvaluation;
	}
	public List<String> getListUrlPhoto() {
		return listUrlPhoto;
	}
	public void setListUrlPhoto(List<String> listUrlPhoto) {
		this.listUrlPhoto = listUrlPhoto;
	}
	public List<String> getListLangue() {
		return listLangue;
	}
	public void setListLangue(List<String> listLangue) {
		this.listLangue = listLangue;
	}
	public List<String> getListLoisir() {
		return listLoisir;
	}
	public void setListLoisir(List<String> listLoisir) {
		this.listLoisir = listLoisir;
	}
	
}
