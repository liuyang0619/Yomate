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
	public final static String SELECT_PROFIL_BY_ID = "SELECT temp.*, GROUP_CONCAT(la.id SEPARATOR ',') as language  FROM "
			+ "("
			+ "SELECT u.idUser, u.lieu, u.nom, u.prenom, u.birthday, u.sex, u.email, u.haspet, u.situationFam, u.ecole, p.id as profession, n.id as nationnalite, up.image, GROUP_CONCAT(l.id SEPARATOR ',') as loisir "
			+ "FROM YOMATE.USER as u "
			+ "LEFT JOIN YOMATE.user_loisir as ul on u.idUser = ul.user "
			+ "LEFT JOIN YOMATE.loisir as l on ul.loisir = l.id "
			+ "LEFT JOIN YOMATE.nationnalite as n ON u.nationnalite = n.id "
			+ "LEFT JOIN  YOMATE.profession as p ON u.profession = p.id "
			+ "LEFT JOIN  YOMATE.user_photo as up ON u.idUser = up.user "
			+ "where u.idUser = ### "
			+ "GROUP BY u.idUser,u.nom,u.prenom,u.birthday,u.sex,u.email,u.lieu,u.haspet,u.situationFam,u.ecole,u.profession,u.lieu,n.nationnalite,up.image "
			+ ") as temp "
			+ "LEFT JOIN  YOMATE.user_language as ula on temp.idUser = ula.user "
			+ "LEFT JOIN  YOMATE.language as la on ula.language = la.id "
			+ "GROUP BY temp.idUser,temp.nom,temp.prenom,temp.birthday,temp.sex,temp.email,temp.haspet,temp.situationFam,temp.ecole,temp.profession,temp.nationnalite,temp.image;";
	public final static String CHECK_IF_USER_EXIST_BY_EMAIL_PW = "SELECT idUser FROM yomate.user "
			+ "WHERE email= ### AND password= ###;";
	public final static String CREATE_USER_COMPTE = "INSERT INTO yomate.user (nom, prenom, email, password, sex) VALUES "
			+ "(###, ###, ###, ###, ###);";
	public final static String UPDATE_USER_PROFILE_MAIN_BY_ID = "UPDATE yomate.user SET nom = ###, prenom = ###, "
			+ "sex = ###, haspet = ###, situationFam = ###, ecole = ###, profession = ###, nationnalite = ###, lieu = ###, birthday = ### "
			+ "WHERE idUser = ###;";
	public final static String DELETE_USER_PROFILE_PHOTO_BY_ID_URL = "DELETE FROM yomate.user_photo WHERE user = ### AND image = ###;";
	public final static String UPDATE_USER_PROFILE_PHOTO = "INSERT INTO yomate.user_photo (user, image) values (###, ###);";
	public final static String DELETE_USER_PROFILE_LOISIR_BY_ID = "DELETE FROM yomate.user_loisir WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_LOISIR = "INSERT INTO yomate.user_loisir (user, loisir) values (###, ###)";
	public final static String DELETE_USER_PROFILE_LANGUAGE_BY_ID = "DELETE FROM yomate.user_language WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_LANGUAGE = "INSERT INTO yomate.user_language (user, language) values (###, ###)";
	public final static String ADD_FAVORITE_ANNONCE = "INSERT INTO yomate.favoriser (user, annonce) values (###, ###)";
	public final static String SELECT_FAVORITE_ANNONCE = "SELECT a.idAnnonce, a.proposer, a.budget, a.lieu, u.prenom as proposer_prenom, " 
			+"u.birthday as proposer_birthday, u.sex as proposer_sex, a.description, u.nom as proposer_nom, uphoto.image "
			+"from yomate.annonce as a, yomate.user as u, yomate.favoriser as f, yomate.user_photo as uphoto "
			+"WHERE f.user = ### and a.idAnnonce = f.annonce and a.proposer = u.idUser ";
	public final static String DELETE_FAVORITE_ANNONCE = "DELETE FROM yomate.favoriser WHERE user = ### AND annonce = ###;";
	public final static String ADD_EVALUATION = "INSERT INTO yomate.evaluation (user_commenter, user_commented, note, desription, date_evaluation) values (###, ###, ###, ###, ###)";
	public final static String SELECT_HISTORY_ANNONCES  = "SELECT idAnnonce, budget, lieu, description "
			+ "FROM yomate.annonce "
			+ "WHERE proposer = ###;";
	public final static String CREATE_ANNONCE = "INSERT INTO yomate.annonce "
			+ "(date_proposer, date_debut, date_fin, proposer, description, budget, lieu, description_Logement, sex, age_min, age_max, status, haspet, situationFam, profession, nationnalite)  "
			+ "VALUES "
			+ "(###, ###,###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###, ###);";
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
			+ "SELECT u.*, p.id as professionName, n.id as nationnaliteName, la.id as language, "
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
	public final static String SELECT_HISTORY_COLO = "SELECT a.* "
			+ "FROM yomate.user as u, annonce as a "
			+ "WHERE u.idUser = ### AND u.idUser = a.proposer ";
	public final static String SEARCH_ANNONCE_MAIN = "SELECT  a.*, lan.language as language, loi.loisir as loisir , u.nom as proposer_nom, u.prenom as proposer_prenom, u.birthday as proposer_birthday, u.sex as proposer_sex , uphoto.image "
			+ "FROM yomate.annonce as a, yomate.user_loisir as uloi, yomate.user_language as ulan, yomate.loisir as loi, yomate.language as lan, yomate.user as u , yomate.user_photo as uphoto "
			+ "WHERE u.idUser = uloi.user AND u.idUser = ulan.user AND uloi.loisir = loi.id AND ulan.language = lan.id AND u.idUser = a.proposer AND uphoto.user = u.idUser ";
	public final static String SEARCH_ANNONCE_BUDGET = "AND a.budget<= ### AND a.budget >= ### ";
	public final static String SEARCH_ANNONCE_LIEU = "AND a.lieu = ### ";
	public final static String SEARCH_ANNONCE_SEX = "AND u.sex = ### ";
	public final static String SEARCH_ANNONCE_MINAGE = "AND u.birthday >= ### ";
	public final static String SEARCH_ANNONCE_MAXAGE = "AND u.birthday < ### ";
	public final static String SEARCH_ANNONCE_PET = "AND u.haspet = ### ";
	public final static String SEARCH_ANNONCE_SITUATIONFAM = "AND u.situationFam = ### ";
	public final static String SEARCH_ANNONCE_SCHOOL = "AND u.ecole = ### ";
	public final static String SEARCH_ANNONCE_PROFESSION = "AND u.profession = ### ";
	public final static String SEARCH_ANNONCE_NATIONNALITY = "AND u.nationnalite = ### ";
	public final static String SEARCH_ANNONCE_DATE_DEBUT = "AND a.date_debut >= ### AND  a.date_debut <= ### ";
	public final static String SEARCH_ANNONCE_DATE_FIN = "AND a.date_fin >= ### AND  a.date_fin <= ### ";
	public final static String SEARCH_ANNONCE_HOBBY = "AND uloi.loisir = ### ";
	public final static String SEARCH_ANNONCE_LANGUAGE = "AND ulan.language = ### ";
	public final static String SEARCH_ANNONCE_DESCRIPTION_LOGE = "AND a.description_logement LIKE ### ";
	public final static String ADD_USER_TO_ANNONCE = "INSERT INTO annonc_user (annonce, user) VALUES (###, ###);";
	public final static String GET_USER_RECOMMENDED_BY_ID_ANNONCE = "select u.*, m.rate from yomate.matching as m, yomate.user as u "
			+ "where m.user = u.idUser AND m.annonce = ###;";
	public final static String DELETE_MATCHING_BY_ID = "DELETE FROM yomate.matching WHERE annonce = ### AND user = ###;";
	public final static String UPDATE_MATCHING = "INSERT INTO yomate.matching (annonce, user, rate) values (###, ###, ###);";
	
}
