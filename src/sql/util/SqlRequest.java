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
	public final static String CREATE_USER_COMPTE = "INSERT INTO yomate.user (nom, prenom, email, passward, sex) VALUES "
			+ "(###, ###, ###, ###, ###);";
	public final static String UPDATE_USER_PROFILE_MAIN_BY_ID = "UPDATE yomate.user SET nom = ###, prenom = ###, email = ###, passward = ###, "
			+ "sex = ###, haspet = ###, situationFam = ###, ecole = ###, profession = ###, nationnalite = ### "
			+ "WHERE idUser = ###;";
	public final static String DELETE_USER_PROFILE_PHOTO_BY_ID = "DELETE FROM yomate.user_photo WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_PHOTO = "INSERT INTO yomate.user_photo (user, image) values (###, ###);";
	public final static String DELETE_USER_PROFILE_LOISIR_BY_ID = "DELETE FROM yomate.user_loisir WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_LOISIR = "INSERT INTO yomate.user_loisir (user, loisir) values (###, ###);";
	public final static String DELETE_USER_PROFILE_LANGUAGE_BY_ID = "DELETE FROM yomate.user_language WHERE user = ###;";
	public final static String UPDATE_USER_PROFILE_LANGUAGE = "INSERT INTO yomate.user_language (user, language) values (###, ###);";
	
}
