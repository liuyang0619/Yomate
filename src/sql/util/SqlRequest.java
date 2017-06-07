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
	public final static String SELECT_PROFIL_BY_ID = "SELECT temp.*, GROUP_CONCAT(la.language SEPARATOR ',') as language  FROM "
			+ "("
			+ "SELECT u.idUser, u.nom, u.prenom, u.birthday, u.sex, u.email, u.haspet, u.situationFam, u.ecole, p.profession, n.nationnalite, up.image, GROUP_CONCAT(l.loisir SEPARATOR ',') as loisir "
			+ "FROM YOMATE.USER as u "
			+ "LEFT JOIN YOMATE.user_loisir as ul on u.idUser = ul.user "
			+ "LEFT JOIN YOMATE.loisir as l on ul.loisir = l.id "
			+ "LEFT JOIN YOMATE.nationnalite as n ON u.nationnalite = n.id "
			+ "LEFT JOIN  YOMATE.profession as p ON u.profession = p.id "
			+ "LEFT JOIN  YOMATE.user_photo as up ON u.idUser = up.user "
			+ "where u.idUser = ### "
			+ "GROUP BY u.idUser "
			+ ") as temp "
			+ "LEFT JOIN  YOMATE.user_language as ula on temp.idUser = ula.user "
			+ "LEFT JOIN  YOMATE.language as la on ula.language = la.id "
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
	public final static String SELECT_HISTORY_ANNONCES  = "SELECT idAnnonce, budget, lieu, description "
			+ "FROM yomate.annonce "
			+ "WHERE proposer = ###;";
	public final static String CREATE_ANNONCE = "INSERT INTO yomate.annonce "
			+ "(date_proposer, date_debut, date_fin, proposer, description, budget, nbPersonneBesoin, lieu, description_logement, sex, age_min, age_max, status, haspet, situationFam, ecole, profession, nationnalite)  "
			+ "VALUES "
			+ "(###, ###,###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###);";
	public final static String DELETE_ANNONCE_IMPORTANT_BY_ID = "DELETE FROM yomate.annonce_important WHERE annonce = ###;";
	public final static String DELETE_ANNONCE_OBLIGATOIRE_BY_ID = "DELETE FROM yomate.annonce_obligatoire WHERE annonce = ###;";
	public final static String DELETE_ANNONCE_PEUTETRE_BY_ID = "DELETE FROM yomate.annonce_peutetre WHERE annonce = ###;";
	public final static String DELETE_ANNONCE_PROFILE_LOISIR_BY_ID = "DELETE FROM yomate.annonce_loisir WHERE annonce = ###;";
	public final static String UPDATE_ANNONCE_PROFILE_LOISIR = "INSERT INTO yomate.annonce_loisir (annonce, loisir) values (###, ###)";
	public final static String DELETE_ANNONCE_PROFILE_LANGUAGE_BY_ID = "DELETE FROM yomate.annonce_language WHERE annonce = ###;";
	public final static String UPDATE_ANNONCE_PROFILE_LANGUAGE = "INSERT INTO yomate.annonce_language (annonce, language) values (###, ###)";
	public final static String SELECT_LAST_INSERT_ID = "SELECT LAST_INSERT_ID();";
	public final static String UPDATE_ANNONCE_PROFILE_PEUTETRE = "INSERT INTO yomate.annonce_peutetre (annonce, critere) values (###, ###)";
	public final static String UPDATE_ANNONCE_PROFILE_OBLIGATOIRE = "INSERT INTO yomate.annonce_obligatoire (annonce, critere) values (###, ###)";
	public final static String UPDATE_ANNONCE_PROFILE_IMPORTANT = "INSERT INTO yomate.annonce_important (annonce, critere) values (###, ###)";
	public final static String CLOSE_ANNONCE = "update yomate.annonce set status = 0 WHERE idAnnonce = ###;";
	public final static String REOPEN_ANNONCE = "update yomate.annonce set status = 1 WHERE idAnnonce = ###;";
	public final static String UPDATE_ANNONCE_MAIN_BY_ID = "UPDATE yomate.annonce SET "
			+ "date_debut = ###, date_fin = ###, description = ###, "
			+ "budget = ###, nbPersonneBesoin = ###, lieu = ###, description_logement = ###, "
			+ "sex = ###, age_min = ###, age_max = ###, haspet = ###, situationFam = ###, "
			+ "ecole = ###, profession = ###, nationnalite = ###  "
			+ "WHERE idAnnonce = ###;";
	public final static String SELECT_ANNONCE_BY_ID = "SELECT temp4.idAnnonce, temp4.date_proposer, temp4.date_debut, temp4.date_fin, temp4.proposer, "
			+ "temp4.description, temp4.budget, temp4.nbPersonneBesoin, temp4.lieu, temp4.description_logement, "
			+ "temp4.sex, temp4.age_min, temp4.age_max, temp4.status, temp4.haspet, temp4.situationFam, temp4.ecole, "
			+ "temp4.professionName, temp4.nationnaliteName, GROUP_CONCAT(temp4.loisir SEPARATOR ',') as loisirs, "
			+ "temp4.languages, temp4.importantcritere, temp4.obligatoirecritere, temp4.peutetrecritere "
			+ "FROM("
			+ "SELECT temp3.*, GROUP_CONCAT(temp3.language SEPARATOR ',') as languages "
			+ "FROM("
			+ "SELECT temp2.*, GROUP_CONCAT(temp2.important SEPARATOR ',') as importantcritere "
			+ "FROM("
			+ "SELECT temp.*, GROUP_CONCAT(temp.obligatoire SEPARATOR ',') as obligatoirecritere "
			+ "FROM("
			+ "SELECT u.*, p.profession as professionName, n.nationnalite as nationnaliteName, la.language, "
			+ "l.loisir, ai.critere as important, ao.critere as obligatoire, GROUP_CONCAT(ap.critere SEPARATOR ',') as peutetrecritere "
			+ "FROM YOMATE.annonce as u, YOMATE.nationnalite as n, YOMATE.profession as p, "
			+ "YOMATE.annonce_loisir as ul, YOMATE.loisir as l, YOMATE.annonce_language as ula, "
			+ "YOMATE.language as la, yomate.annonce_important as ai, yomate.annonce_peutetre as ap, "
			+ "yomate.annonce_obligatoire as ao "
			+ "WHERE u.nationnalite = n.id AND u.profession = p.id AND u.idAnnonce = ul.annonce "
			+ "AND ul.loisir = l.id AND u.idAnnonce = ula.annonce "
			+ "AND ai.annonce = u.idAnnonce AND ao.annonce = u.idAnnonce AND ap.annonce = u.idAnnonce "
			+ "AND ula.language = la.id AND u.idAnnonce = ### "
			+ "group by u.idAnnonce, la.language, l.loisir, ai.critere, ao.critere "
			+ ") as temp "
			+ "GROUP BY temp.idAnnonce, temp.loisir, temp.language, temp.important "
			+ ") as temp2 "
			+ "GROUP BY temp2.idAnnonce, temp2.loisir, temp2.language"
			+ ") as temp3 "
			+ "GROUP BY temp3.idAnnonce, temp3.loisir"
			+ ") as temp4 "
			+ "GROUP BY temp4.idAnnonce;";
//	public final static String ADD_HISTORY_COLO = "INSERT INTO yomate.histoirecolo "
//			+ "(user1, user2, dateDebut, dateFin, annonce) "
//			+ "values"
//			+ "(###, ###, ###,###, ###);";
//	public final static String SELECT_HISTORY_COLO = "SELECT h.dateDebut, h.dateFin, h.annonce, a.lieu, a.budget, u.nom, u.prenom, u.idUser "
//			+ "FROM yomate.histoirecolo as h, yomate.user as u, annonce as a "
//			+ "WHERE (h.user1 = ### OR h.user2 = ###) AND (h.user1 = u.idUser OR h.user2 = u.idUser) "
//			+ "AND (u.idUser <> ###) AND a.idAnnonce = h.annonce;";
	public final static String SEARCH_ANNONCE_MAIN = "SELECT  a.*, lan.language as language, loi.loisir as loisir , u.nom as proposer_nom, u.prenom as proposer_prenom, u.age as proposer_age, u.sex as proposer_sex , uphoto.image "
			+ "FROM yomate.annonce as a, yomate.annonce_loisir as aloi, yomate.annonce_language as alan, yomate.loisir as loi, yomate.language as lan, yomate.user as u , yomate.user_photo as uphoto "
			+ "WHERE a.idAnnonce = aloi.annonce AND a.idAnnonce = alan.annonce AND aloi.loisir = loi.id AND alan.language = lan.id AND u.idUser = a.proposer AND uphoto.user = u.idUser ";
	public final static String SEARCH_ANNONCE_BUDGET = "AND budget<= ### AND budget >= ### ";
	public final static String SEARCH_ANNONCE_LIEU = "AND lieu = ### ";
	public final static String SEARCH_ANNONCE_SEX = "AND sex = ### ";
	public final static String SEARCH_ANNONCE_AGE = "AND age_min >= ### AND age_max < ### ";
	public final static String SEARCH_ANNONCE_PET = "AND haspet = ### ";
	public final static String SEARCH_ANNONCE_SITUATIONFAM = "AND situationFam = ### ";
	public final static String SEARCH_ANNONCE_SCHOOL = "AND ecole = ### ";
	public final static String SEARCH_ANNONCE_PROFESSION = "AND profession = ### ";
	public final static String SEARCH_ANNONCE_NATIONNALITY = "AND nationnalite = ### ";
	public final static String SEARCH_ANNONCE_DATE_DEBUT = "AND date_debut >= ### AND  date_debut <= ### ";
	public final static String SEARCH_ANNONCE_DATE_FIN = "AND date_fin >= ### AND  date_fin <= ### ";
	public final static String SEARCH_ANNONCE_HOBBY = "AND aloi.loisir = ### ";
	public final static String SEARCH_ANNONCE_LANGUAGE = "AND alan.language = ### ";
	public final static String SEARCH_ANNONCE_DESCRIPTION_LOGE = "AND description_logement LIKE ### ";
	public final static String ADD_USER_TO_ANNONCE = "INSERT INTO annonc_user (annonce, user) VALUES (###, ###);";
	public final static String GET_USER_RECOMMENDED_BY_ID_ANNONCE = "select u.*, m.rate from yomate.matching as m, yomate.user as u "
			+ "where m.user = u.idUser AND m.annonce = ###;";
}
