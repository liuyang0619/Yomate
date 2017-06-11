package agents;

import java.util.HashMap;
import java.util.Map;


import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;
import sql.util.SqlRequest;

public class ManageAnnonceAgent extends Agent{
	protected void setup(){
		addBehaviour(new ReceiveActionFromAdminBehaviour());
	}
	protected class ReceiveActionFromAdminBehaviour extends Behaviour{
		String sql;
		String idAnnonce;
		@Override
		public void action() {
			MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.REQUEST); 
			ACLMessage msg = receive(mt);
			if(msg != null){
				String content = msg.getContent();
				ActionMessageContent amc = (ActionMessageContent) JsonHelper.deserilisation(content, ActionMessageContent.class);
				String action = amc.getAction();
				Map<String, String> params = amc.getParams();
				int performative = 0;
				switch(action){
				case Constants.Action.CREATE_ANNONCE:
					sql = sqlCreateAnnonce(params);
					performative = ACLMessage.REQUEST;
					addBehaviour(new SendToSqlBehaviour(msg, sql, performative));
					break;	
				case Constants.Action.MODIFY_ANNONCE:
					sql = sqlModifyAnnonce(params);
					idAnnonce = (String) params.get("idAnnonce");
					performative = ACLMessage.REQUEST;
					addBehaviour(new SendToSqlBehaviour(msg, sql, performative, idAnnonce));
					break;
				case Constants.Action.CLOSE_ANNONCE:
					sql = SqlRequest.CLOSE_ANNONCE;
					idAnnonce = (String) params.get("idAnnonce");
					sql = sql.replaceFirst("###", "\""+ idAnnonce + "\"");
					performative = ACLMessage.REQUEST;
					addBehaviour(new SendToSqlBehaviour(msg, sql, performative, idAnnonce));
					break;
				case Constants.Action.REOPEN_ANNONCE:
					sql = SqlRequest.REOPEN_ANNONCE;
					idAnnonce = (String) params.get("idAnnonce");
					sql = sql.replaceFirst("###", "\""+ idAnnonce + "\"");
					performative = ACLMessage.REQUEST;
					addBehaviour(new SendToSqlBehaviour(msg, sql, performative, idAnnonce));
					break;
				}
			}
			
		}

		@Override
		public boolean done() {
			return false;
		}
		protected String sqlCreateAnnonce(Map<String, String> params){
			sql = SqlRequest.CREATE_ANNONCE;
			sql = sql.replaceFirst("###", "\""+ (String) params.get("dateProposer") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("dateDebut") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("dateFin") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("proposer") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("description") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("budget") + "\"");
//			sql = sql.replaceFirst("###", "\""+ (String) params.get("nbPersonneBesoin") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("lieu") + "\"");
//			sql = sql.replaceFirst("###", "\""+ (String) params.get("descriptionLogement") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("sex") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("ageMin") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("ageMax") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("status") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("haspet") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("situationFam") + "\"");
//			sql = sql.replaceFirst("###", "\""+ (String) params.get("ecole") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("profession") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("nationnalite") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("status") + "\"");
			
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_LOISIR;
			String [] listLoisir = ((String) params.get("loisir")).split(",");
			for(int i = 0; i < listLoisir.length; i++){
				listLoisir[i] = listLoisir[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "Last_insert_id()");
					sql = sql.replaceFirst("###", "\""+ listLoisir[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "Last_insert_id()" + ", " + "\""+ listLoisir[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_LANGUAGE;
			
			String [] listLanguage = ((String) params.get("language")).split(",");
			for(int i = 0; i < listLanguage.length; i++){
				listLanguage[i] = listLanguage[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "Last_insert_id()");
					sql = sql.replaceFirst("###", "\""+ listLanguage[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "Last_insert_id()" + ", " + "\""+ listLanguage[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_PEUTETRE;
			
			String [] listPeutetre = ((String) params.get("peutetre")).split(",");
			for(int i = 0; i < listPeutetre.length; i++){
				listPeutetre[i] = listPeutetre[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "Last_insert_id()");
					sql = sql.replaceFirst("###", "\""+ listPeutetre[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "Last_insert_id()" + ", " + "\""+ listPeutetre[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_IMPORTANT;
			
			String [] listImportant = ((String) params.get("important")).split(",");
			for(int i = 0; i < listImportant.length; i++){
				listImportant[i] = listImportant[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "Last_insert_id()");
					sql = sql.replaceFirst("###", "\""+ listImportant[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "Last_insert_id()" + ", " + "\""+ listImportant[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_OBLIGATOIRE;
			
			String [] listObligatoire = ((String) params.get("obligatoire")).split(",");
			for(int i = 0; i < listObligatoire.length; i++){
				listObligatoire[i] = listObligatoire[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "Last_insert_id()");
					sql = sql.replaceFirst("###", "\""+ listObligatoire[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "Last_insert_id()" + ", " + "\""+ listObligatoire[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			return sql;
		}
		protected String sqlModifyAnnonce(Map<String, String> params){
			sql = SqlRequest.UPDATE_ANNONCE_MAIN_BY_ID;
			sql = sql.replaceFirst("###", "\""+ (String) params.get("dateDebut") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("dateFin") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("description") + "\"");
			sql = sql.replaceFirst("###", "\""+ Integer.parseInt((String) params.get("budget")) + "\"");
			sql = sql.replaceFirst("###", "\""+ Integer.parseInt((String) params.get("nbPersonneBesoin")) + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("lieu") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("descriptionLogement") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("sex") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("ageMin") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("ageMax") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("haspet") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("situationFam") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("ecole") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("profession") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("nationnalite") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
			//update "loisir"
			sql += SqlRequest.DELETE_ANNONCE_PROFILE_LOISIR_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idAnnonce") + "\"");
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_LOISIR;
			String [] listLoisir = ((String) params.get("loisir")).split(",");
			for(int i = 0; i < listLoisir.length; i++){
				listLoisir[i] = listLoisir[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					sql = sql.replaceFirst("###", "\""+ listLoisir[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idAnnonce") + "\"" + ", " + "\""+ listLoisir[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			//update "language"
			sql += SqlRequest.DELETE_ANNONCE_PROFILE_LANGUAGE_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idAnnonce") + "\"");
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_LANGUAGE;
			
			String [] listLanguage = ((String) params.get("language")).split(",");
			for(int i = 0; i < listLanguage.length; i++){
				listLanguage[i] = listLanguage[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					sql = sql.replaceFirst("###", "\""+ listLanguage[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idAnnonce") + "\"" + ", " + "\""+ listLanguage[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			//update "important"
			sql += SqlRequest.DELETE_ANNONCE_IMPORTANT_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idAnnonce") + "\"");
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_IMPORTANT;
			
			String [] listImportant = ((String) params.get("important")).split(",");
			for(int i = 0; i < listImportant.length; i++){
				listImportant[i] = listImportant[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					sql = sql.replaceFirst("###", "\""+ listImportant[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idAnnonce") + "\"" + ", " + "\""+ listImportant[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			//update "important"
			sql += SqlRequest.DELETE_ANNONCE_OBLIGATOIRE_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idAnnonce") + "\"");
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_OBLIGATOIRE;
			
			String [] listObligatoire = ((String) params.get("obligatoire")).split(",");
			for(int i = 0; i < listObligatoire.length; i++){
				listObligatoire[i] = listObligatoire[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					sql = sql.replaceFirst("###", "\""+ listObligatoire[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idAnnonce") + "\"" + ", " + "\""+ listObligatoire[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			//update "important"
			sql += SqlRequest.DELETE_ANNONCE_PEUTETRE_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idAnnonce") + "\"");
			sql += SqlRequest.UPDATE_ANNONCE_PROFILE_PEUTETRE;
			
			String [] listPeutetre = ((String) params.get("peutetre")).split(",");
			for(int i = 0; i < listPeutetre.length; i++){
				listPeutetre[i] = listPeutetre[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					sql = sql.replaceFirst("###", "\""+ listPeutetre[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idAnnonce") + "\"" + ", " + "\""+ listPeutetre[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			
			return sql;
		}
	}
	protected class SendToSqlBehaviour extends Behaviour{
		String sql;
		String idAnnonce;
		boolean flag = false;
		String conversationId;
		ACLMessage msgReceived = null;
		int performative;
		int step = 1;
		
		public SendToSqlBehaviour(ACLMessage msgReceived, String sql, int performative, String idAnnonce) {
			this.idAnnonce = idAnnonce;
			this.sql = sql;
			this.msgReceived = msgReceived;
			this.performative = performative;
			conversationId = msgReceived.getConversationId();
		}
		public SendToSqlBehaviour(ACLMessage msgReceived, String sql, int performative) {
			this.sql = sql;
			this.msgReceived = msgReceived;
			this.performative = performative;
			conversationId = msgReceived.getConversationId();
		}
		
		@Override
		public void action() {
			switch(step){
			case 1:
				ACLMessage msg = new ACLMessage();
				msg.setPerformative(performative);
				msg.addReceiver(new AID(Constants.Agent.SQL_REQUEST_AGENT, AID.ISLOCALNAME));
				msg.setContent(sql);
				msg.setConversationId(conversationId);
				send(msg);
				step++;
				break;
			case 2:
				MessageTemplate mt = MessageTemplate.MatchConversationId(conversationId); 
				ACLMessage response = receive(mt);
				if(response != null){
					ACLMessage reply = msgReceived.createReply();
					reply.setContent(response.getContent());
					reply.setPerformative(response.getPerformative());
					send(reply);
					if(response.getPerformative() != ACLMessage.FAILURE && idAnnonce != null){
					}
					flag = true;
				}
				break;
			}
			
		}

		@Override
		public boolean done() {
			return flag;
		}
		
	}
		String idAnnonce;
		
		public SendToMatchingBehaviour(String idAnnonce) {
			this.idAnnonce = idAnnonce;
		}
		
		@Override
		public void action() {
			Map<String, String> map = new HashMap<String, String>();
			map.put("idAnnonce", idAnnonce);
	    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.MATCH_ANNONCE, map);
	    	String content = JsonHelper.serilisation(amc);
			ACLMessage msg = new ACLMessage();
			msg.setPerformative(ACLMessage.REQUEST);
			msg.addReceiver(new AID(Constants.Agent.CALCULATE_MATCH_AGENT, AID.ISLOCALNAME));
			msg.setContent(content);
			send(msg);
		}	
	}
}
