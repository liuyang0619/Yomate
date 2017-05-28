package agents;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.core.behaviours.SequentialBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;
import model.User;
import sql.util.SqlRequest;

public class ManageProfilAgent extends Agent{
	protected void setup(){
		addBehaviour(new ReceiveActionFromAdminBehaviour());
	}
	protected class ReceiveActionFromAdminBehaviour extends Behaviour{
		String sql;
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
				case Constants.Action.SELECT_PROFILE:
					sql = SqlRequest.SELECT_PROFIL_BY_ID;
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					performative = ACLMessage.QUERY_REF;
					break;
				case Constants.Action.MODIFY_PROFILE:
					sql = sqlModifyProfil(params);
					performative = ACLMessage.REQUEST;
					break;
				case Constants.Action.ADD_PHOTO:
					sql = SqlRequest.UPDATE_USER_PROFILE_PHOTO;
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("urlPhoto") + "\"");
					performative = ACLMessage.REQUEST;
					break;
				case Constants.Action.DELETE_PHOTO:
					sql = SqlRequest.DELETE_USER_PROFILE_PHOTO_BY_ID_URL;
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("urlPhoto") + "\"");
					performative = ACLMessage.REQUEST;
					break;
				case Constants.Action.ADD_FAVORITE_ANNONCE:
					sql = SqlRequest.ADD_ANNONCE_FAVORI;
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					performative = ACLMessage.REQUEST;
					break;
				case Constants.Action.DELETE_FAVORITE_ANNONCE:
					sql = SqlRequest.DELETE_ANNONCE_FAVORI;
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idAnnonce") + "\"");
					performative = ACLMessage.REQUEST;
					break;
				case Constants.Action.ADD_EVALUATION_TO_USER:
					sql = SqlRequest.ADD_EVALUATION;
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idcommenter") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idcommented") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("note") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("desription") + "\"");
					sql = sql.replaceFirst("###", "\""+ (String) params.get("date_evaluation") + "\"");
					performative = ACLMessage.REQUEST;
				}
				
				addBehaviour(new SendToSqlBehaviour(msg, sql, performative));
			}
		}

		@Override
		public boolean done() {
			return false;
		}
		protected String sqlModifyProfil(Map<String, String> params){
			sql = SqlRequest.UPDATE_USER_PROFILE_MAIN_BY_ID;
			sql = sql.replaceFirst("###", "\""+ (String) params.get("nom") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("prenom") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("password") + "\"");
			sql = sql.replaceFirst("###", "\""+ Integer.parseInt((String) params.get("sex")) + "\"");
			sql = sql.replaceFirst("###", "\""+ Integer.parseInt((String) params.get("haspet")) + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("situationFam") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("ecole") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("profession") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("nationnalite") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("lieu") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("birthday") + "\"");
			sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
			
			sql += SqlRequest.DELETE_USER_PROFILE_LOISIR_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idUser") + "\"");
			sql += SqlRequest.UPDATE_USER_PROFILE_LOISIR;
			String [] listLoisir = ((String) params.get("loisir")).split(",");
			for(int i = 0; i < listLoisir.length; i++){
				listLoisir[i] = listLoisir[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					sql = sql.replaceFirst("###", "\""+ listLoisir[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idUser") + "\"" + ", " + "\""+ listLoisir[i] + "\"" +")";
					sql += ", ";
				}
			}
			sql = sql.substring(0, sql.length() - 2); //delete the last ","
			sql += ";";
			sql += SqlRequest.DELETE_USER_PROFILE_LANGUAGE_BY_ID;
			sql = sql.replaceFirst("###",  "\""+ (String) params.get("idUser") + "\"");
			sql += SqlRequest.UPDATE_USER_PROFILE_LANGUAGE;
			
			String [] listLanguage = ((String) params.get("language")).split(",");
			for(int i = 0; i < listLanguage.length; i++){
				listLanguage[i] = listLanguage[i].replaceAll(" ", "");
				if(i == 0){
					sql = sql.replaceFirst("###", "\""+ (String) params.get("idUser") + "\"");
					sql = sql.replaceFirst("###", "\""+ listLanguage[i] + "\"");
					sql += ", ";
				}
				else{
					sql += "(" + "\""+ (String) params.get("idUser") + "\"" + ", " + "\""+ listLanguage[i] + "\"" +")";
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
		boolean flag = false;
		String conversationId;
		ACLMessage msgReceived = null;
		int performative;
		int step = 1;
		
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
}
