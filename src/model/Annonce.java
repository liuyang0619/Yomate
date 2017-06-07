package model;

import java.util.List;
import java.util.Map;

public class Annonce {
	private String idAnnonce;
	private String date_proposer;
	private String date_debut;
	private String date_fin;
	private String description;
	private String lieu;
	private String description_logement;
	private String budget;
	private String nbPersonneBesoin;
	private String proposer;
	private String status;
	private String languages;
	private String loisirs;
	private String obligatoirecritere;
	private String importantcritere;
	private String peutEtreCritere;
	private String sex;
	private String haspet;
	private String situationFam;
	private String ecole;
	private String professionName;
	private String nationnaliteName;
	private String age_min;
	private String age_max;
	
	public Annonce(Map<String, Object> map){
		idAnnonce = (String) map.get("idAnnonce");
		date_proposer = (String) map.get("date_proposer");
		date_debut = (String) map.get("date_debut");
		date_fin = (String) map.get("date_fin");
		description = (String) map.get("description");
		lieu = (String) map.get("lieu");
		description_logement = (String) map.get("description_logement");
		budget = (String) map.get("budget");
		nbPersonneBesoin = (String) map.get("nbPersonneBesoin");
		proposer = (String) map.get("proposer");
		status = (String) map.get("status");
		languages = (String) map.get("languages");
		loisirs = (String) map.get("loisirs");
		obligatoirecritere = (String) map.get("obligatoirecritere");
		importantcritere = (String) map.get("importantcritere");
		peutEtreCritere = (String) map.get("peutEtreCritere");
		sex = (String) map.get("sex");
		haspet = (String) map.get("haspet");
		situationFam = (String) map.get("situationFam");
		ecole = (String) map.get("ecole");
		professionName = (String) map.get("professionName");
		nationnaliteName = (String) map.get("nationnaliteName");
		age_min = (String) map.get("age_min");
		age_max = (String) map.get("age_max");
	}

	public String getIdAnnonce() {
		return idAnnonce;
	}

	public void setIdAnnonce(String idAnnonce) {
		this.idAnnonce = idAnnonce;
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

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getNbPersonneBesoin() {
		return nbPersonneBesoin;
	}

	public void setNbPersonneBesoin(String nbPersonneBesoin) {
		this.nbPersonneBesoin = nbPersonneBesoin;
	}

	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}

	public String isStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLanguages() {
		return languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public String getLoisirs() {
		return loisirs;
	}

	public void setLoisirs(String loisirs) {
		this.loisirs = loisirs;
	}

	public String getObligatoirecritere() {
		return obligatoirecritere;
	}

	public void setObligatoirecritere(String obligatoirecritere) {
		this.obligatoirecritere = obligatoirecritere;
	}

	public String getImportantcritere() {
		return importantcritere;
	}

	public void setImportantcritere(String importantcritere) {
		this.importantcritere = importantcritere;
	}

	public String getPeutEtreCritere() {
		return peutEtreCritere;
	}

	public void setPeutEtreCritere(String peutEtreCritere) {
		this.peutEtreCritere = peutEtreCritere;
	}

	public String isSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String isHaspet() {
		return haspet;
	}

	public void setHaspet(String haspet) {
		this.haspet = haspet;
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

	public String getProfessionName() {
		return professionName;
	}

	public void setProfessionName(String professionName) {
		this.professionName = professionName;
	}

	public String getNationnaliteName() {
		return nationnaliteName;
	}

	public void setNationnaliteName(String nationnaliteName) {
		this.nationnaliteName = nationnaliteName;
	}

	public String getAgeMin() {
		return age_min;
	}

	public void setAgeMin(String age_min) {
		this.age_min = age_min;
	}

	public String getAgeMax() {
		return age_max;
	}

	public void setAgeMax(String age_max) {
		this.age_max = age_max;
	}
	
	
}
