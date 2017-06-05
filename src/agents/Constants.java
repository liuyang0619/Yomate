package agents;

public class Constants {
	public class Action{
		//list of actions
		public final static String CREATE_ACCOUNT = "CreateAccount";	
		public final static String LOGIN = "Login";
		public final static String MODIFY_PROFILE = "ModifyProfile";
		public final static String SELECT_PROFILE = "SelectProfile";
		public final static String SELECT_FAVORITE_ANNONCES = "SelectFavoriteAnnonces";
		public final static String SELECT_HISTORY_ANNONCES = "SelectHistoryAnnonces";
//		public final static String SELECT_HISTORYS_COLO = "SelectHistorysColo";
//		public final static String INSERT_HISTORY_COLO = "InsertHistoryColo";
		public final static String ADD_PHOTO = "AddPhoto";
		public final static String DELETE_PHOTO = "DeletePhoto";
		public final static String ADD_FAVORITE_ANNONCE = "AddFavoriteAnnonce";
		public final static String DELETE_FAVORITE_ANNONCE = "ManageProfilAgent";
		public final static String ADD_EVALUATION_TO_USER = "AddEvaluationToUser";
		public final static String CREATE_ANNONCE = "CreateAnnonce";
		public final static String MODIFY_ANNONCE = "ModifyAnnonce";
		public final static String CLOSE_ANNONCE = "CloseAnnonce";
		public final static String REOPEN_ANNONCE = "ReopenAnnonce";
		public final static String ADD_ROOMMATE_ANNONCE = "AddRoommateAnnonce";
		public final static String SEARCH_ANNONCE = "SearchAnnonce";
		public final static String GET_ANNONCE = "GetAnnonce";
		public final static String ADD_USER_TO_ANNONCE = "AddUserToAnnonce";
	}
	
	public class Agent{
		//list of agents'name
		public final static String MANAGE_USER_AGENT = "ManageUserAgent";
		public final static String MANAGE_PROFIL_AGENT = "ManageProfilAgent";
		public final static String SQL_REQUEST_AGENT = "SqlRequestAgent";
		public final static String CALCULATE_MATCH_AGENT = "CalculateMatchAgent";
		public final static String MANAGE_ANNONCE_AGENT = "ManageAnnonceAgent";
		public final static String MESSAGERIE_AGENT = "MessagerieAgent";
		public final static String SEARCH_AGENT = "SearchAgent";
		public final static String ADMIN_AGENT = "AdminAgent";
		public final static String INVITATION_AGENT = "InvitationAgent";
	}
	
	public class Message{
		//list of string contents
		public final static String ERROR_WITH_DATABASE = "Error: something wrong with the database";
		public final static String SUCCESS_MODIFY_DATABASE = "Votre modification est stock�e";
	}
	
}
