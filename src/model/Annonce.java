package model;

import java.util.List;

public class Annonce {
	private String id;
	private String date_proposer;
	private String date_debut;
	private String date_fin;
	private String description;
	private String lieu;
	private String description_logement;
	private ProfileFiltre profileFiltre;
	private int budget;
	private int nbPersonneBesoin;
	private UserSimple owner;
	private boolean status;
	private List<String> listLangue;
	private List<String> listLoisir;
	private List<String> listOblig;
	private List<String> listImport;
	private List<String> listPeutEtre;
	private List<UserSimple> listUserIn;
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getDate_proposer() {
		return date_proposer;
	}



	public void setDate_proposer(String date_proposer) {
		this.date_proposer = date_proposer;
	}



	public String getDate_debut() {
		return date_debut;
	}



	public void setDate_debut(String date_debut) {
		this.date_debut = date_debut;
	}



	public String getDate_fin() {
		return date_fin;
	}



	public void setDate_fin(String date_fin) {
		this.date_fin = date_fin;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getLieu() {
		return lieu;
	}



	public void setLieu(String lieu) {
		this.lieu = lieu;
	}



	public String getDescription_logement() {
		return description_logement;
	}



	public void setDescription_logement(String description_logement) {
		this.description_logement = description_logement;
	}



	public ProfileFiltre getProfileFiltre() {
		return profileFiltre;
	}



	public void setProfileFiltre(ProfileFiltre profileFiltre) {
		this.profileFiltre = profileFiltre;
	}



	public int getBudget() {
		return budget;
	}



	public void setBudget(int budget) {
		this.budget = budget;
	}



	public int getNbPersonneBesoin() {
		return nbPersonneBesoin;
	}



	public void setNbPersonneBesoin(int nbPersonneBesoin) {
		this.nbPersonneBesoin = nbPersonneBesoin;
	}



	public UserSimple getOwner() {
		return owner;
	}



	public void setOwner(UserSimple owner) {
		this.owner = owner;
	}



	public boolean isStatus() {
		return status;
	}



	public void setStatus(boolean status) {
		this.status = status;
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



	public List<String> getListOblig() {
		return listOblig;
	}



	public void setListOblig(List<String> listOblig) {
		this.listOblig = listOblig;
	}



	public List<String> getListImport() {
		return listImport;
	}



	public void setListImport(List<String> listImport) {
		this.listImport = listImport;
	}



	public List<String> getListPeutEtre() {
		return listPeutEtre;
	}



	public void setListPeutEtre(List<String> listPeutEtre) {
		this.listPeutEtre = listPeutEtre;
	}



	public List<UserSimple> getListUserIn() {
		return listUserIn;
	}



	public void setListUserIn(List<UserSimple> listUserIn) {
		this.listUserIn = listUserIn;
	}

	
	
	public class ProfileFiltre{
		protected boolean sex;
		protected boolean haspet;
		protected String situationFam;
		protected String ecole;
		protected String profession;
		protected String nationnalite;
		protected int ageMin;
		protected int ageMax;
	}
}
