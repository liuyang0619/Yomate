package sql.util;

public class SqlRequest {
	public final static String SELECT_ALL_PROFIL = "SELECT temp.*, GROUP_CONCAT(la.language SEPARATOR ',') as language "
			+ " FROM (SELECT u.idUser, u.nom, u.prenom, u.birthday, u.sex, u.email, u.haspet, "
			+ "u.situationFam, u.ecole, p.profession, n.nationnalite, GROUP_CONCAT(l.loisir SEPARATOR ',') as loisir "
			+ "FROM YOMATE.USER as u, YOMATE.nationnalite as n, YOMATE.profession as p, "
			+ "YOMATE.user_loisir as ul, YOMATE.loisir as l "
			+ "where u.nationnalite = n.id and u.profession = p.id and u.idUser = ul.user "
			+ "and ul.loisir = l.id "
			+ "GROUP BY u.idUser) as temp, "
			+ "YOMATE.user_language as ula, YOMATE.language as la "
			+ "WHERE temp.idUser = ula.user AND ula.language = la.id "
			+ "GROUP BY temp.idUser;";
	public final static String SELECT_PROFIL_BY_ID = "SELECT temp.*, GROUP_CONCAT(la.language SEPARATOR ',') as language "
			+ " FROM (SELECT u.idUser, u.nom, u.prenom, u.birthday, u.sex, u.email, u.haspet, "
			+ "u.situationFam, u.ecole, p.profession, n.nationnalite, GROUP_CONCAT(l.loisir SEPARATOR ',') as loisir "
			+ "FROM YOMATE.USER as u, YOMATE.nationnalite as n, YOMATE.profession as p, "
			+ "YOMATE.user_loisir as ul, YOMATE.loisir as l "
			+ "where u.nationnalite = n.id and u.profession = p.id and u.idUser = ul.user "
			+ "and ul.loisir = l.id AND u.idUser = ### "
			+ "GROUP BY u.idUser) as temp, "
			+ "YOMATE.user_language as ula, YOMATE.language as la "
			+ "WHERE temp.idUser = ula.user AND ula.language = la.id "
			+ "GROUP BY temp.idUser;";
	public final static String CHECK_IF_USER_EXIST_BY_EMAIL_PW = "SELECT idUser FROM yomate.user "
			+ "WHERE email= ### AND password= ###;";
	public final static String CREATE_USER_COMPTE = "INSERT INTO yomate.user (nom, prenom, email, password, sex) VALUES "
			+ "(###, ###, ###, ###, ###);";
	public final static String UPDATE_USER_PROFILE_MAIN_BY_ID = "UPDATE yomate.user SET nom = ###, prenom = ###, password = ###, "
			+ "sex = ###, haspet = ###, situationFam = ###, ecole = ###, profession = ###, nationnalite = ###, lieu = ###, birthday = ### "
			+ "WHERE idUser = ###;";
	public final static String DELETE_USER_PROFILE_PHOTO_BY_ID_URL = "DELETE FROM yomate.user_photo WHERE user = ### AND image = ###;";
	public final static String UPDATE_USER_PROFILE_PHOTO = "INSERT INTO yomate.user_photo (user, image) values (###, ###);";
	public final static String DELETE_USER_PROFILE_LOISIR_BY_ID = "DELETE FROM yomate.user_loisir WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_LOISIR = "INSERT INTO yomate.user_loisir (user, loisir) values (###, ###)";
	public final static String DELETE_USER_PROFILE_LANGUAGE_BY_ID = "DELETE FROM yomate.user_language WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_LANGUAGE = "INSERT INTO yomate.user_language (user, language) values (###, ###)";
	public final static String ADD_FAVORITE_ANNONCE = "INSERT INTO yomate.favoriser (user, annonce) values (###, ###)";
	public final static String SELECT_FAVORITE_ANNONCE = "SELECT a.idAnnonce, a.proposer, u.nom, u.prenom, a.budget, a.lieu, a.description "
			+ "FROM yomate.favoriser as f, yomate.annonce as a, yomate.user as u "
			+ "WHERE f.user = ### AND a.idAnnonce = f.annonce AND a.proposer = u.idUser";
	public final static String DELETE_FAVORITE_ANNONCE = "DELETE FROM yomate.favoriser WHERE user = ### AND annonce = ###;";
	public final static String ADD_EVALUATION = "INSERT INTO yomate.evaluation (user_commenter, user_commented, note, desription, date_evaluation) values (###, ###, ###, ###, ###)";
//	public final static String ADD_HISTORY_COLO = "INSERT INTO yomate.histoirecolo "
//			+ "(user1, user2, dateDebut, dateFin, annonce) "
//			+ "values"
//			+ "(###, ###, ###,###, ###);";
//	public final static String SELECT_HISTORY_COLO = "SELECT h.dateDebut, h.dateFin, h.annonce, a.lieu, a.budget, u.nom, u.prenom, u.idUser "
//			+ "FROM yomate.histoirecolo as h, yomate.user as u, annonce as a "
//			+ "WHERE (h.user1 = ### OR h.user2 = ###) AND (h.user1 = u.idUser OR h.user2 = u.idUser) "
//			+ "AND (u.idUser <> ###) AND a.idAnnonce = h.annonce;";

}
