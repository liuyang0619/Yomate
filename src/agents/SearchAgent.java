package agents;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import agents.ManageAnnonceAgent.ReceiveActionFromAdminBehaviour;
import agents.ManageAnnonceAgent.SendToSqlBehaviour;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;
import sql.util.SqlRequest;

public class SearchAgent extends Agent{
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
				case Constants.Action.SEARCH_ANNONCE:
					sql = sqlSearchAnnonce(params);
					System.out.println(sql);
					performative = ACLMessage.QUERY_REF;
					addBehaviour(new SendToSqlBehaviour(msg, sql, performative));
					break;	
				}
			}
			
		}

		@Override
		public boolean done() {
			return false;
		}
		protected String sqlSearchAnnonce(Map<String, String> params){
			sql = SqlRequest.SEARCH_ANNONCE_MAIN;
			if (params.get("budgetMax") != null || params.get("budgetMin") != null){
				sql += SqlRequest.SEARCH_ANNONCE_BUDGET;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("budgetMax") + "\"");
				sql = sql.replaceFirst("###", "\""+ (String) params.get("budgetMin") + "\"");
			}
			if (params.get("dateFin") != null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        String str = (String) params.get("dateFin");
		        Date dt = null;
				try {
					dt = sdf.parse(str);
				} catch (ParseException e) {
					e.printStackTrace();
				}
		        Calendar date = Calendar.getInstance();
		        date.setTime(dt);
		        date.add(Calendar.DAY_OF_YEAR, 7);
		        String max = sdf.format(date.getTime());
		        date.add(Calendar.DAY_OF_YEAR, -14);
		        String min = sdf.format(date.getTime());
				sql += SqlRequest.SEARCH_ANNONCE_DATE_FIN;
				sql = sql.replaceFirst("###", "\""+ min + "\"");
				sql = sql.replaceFirst("###", "\""+ max + "\"");
			}
			if (params.get("dateDebut") != null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        String str = (String) params.get("dateDebut");
		        Date dt = null;
				try {
					dt = sdf.parse(str);
				} catch (ParseException e) {
					e.printStackTrace();
				}
		        Calendar date = Calendar.getInstance();
		        date.setTime(dt);
		        date.add(Calendar.DAY_OF_YEAR, 7);
		        String max = sdf.format(date.getTime());
		        date.add(Calendar.DAY_OF_YEAR, -14);
		        String min = sdf.format(date.getTime());
				sql += SqlRequest.SEARCH_ANNONCE_DATE_DEBUT;
				sql = sql.replaceFirst("###", "\""+ min + "\"");
				sql = sql.replaceFirst("###", "\""+ max + "\"");
			}
			if (params.get("lieu") != null){
				sql += SqlRequest.SEARCH_ANNONCE_LIEU;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("lieu") + "\"");
			}
			if (params.get("sex") != null){
				sql += SqlRequest.SEARCH_ANNONCE_SEX;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("sex") + "\"");
			}
			if (params.get("ageMin") != null || params.get("ageMax") != null){
				sql += SqlRequest.SEARCH_ANNONCE_AGE;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("ageMin") + "\"");
				sql = sql.replaceFirst("###", "\""+ (String) params.get("ageMax") + "\"");
			}
			if (params.get("haspet") != null){
				sql += SqlRequest.SEARCH_ANNONCE_PET;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("haspet") + "\"");
			}
			if (params.get("situationFam") != null){
				sql += SqlRequest.SEARCH_ANNONCE_SITUATIONFAM;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("situationFam") + "\"");
			}
			if (params.get("ecole") != null){
				sql += SqlRequest.SEARCH_ANNONCE_SCHOOL;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("ecole") + "\"");
			}
			if (params.get("profession") != null){
				sql += SqlRequest.SEARCH_ANNONCE_PROFESSION;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("profession") + "\"");
			}
			if (params.get("nationnalite") != null){
				sql += SqlRequest.SEARCH_ANNONCE_NATIONNALITY;
				sql = sql.replaceFirst("###", "\""+ (String) params.get("nationnalite") + "\"");
			}
			if (params.get("keyWordLoge") != null){
				String[] keywords = params.get("keyWordLoge").split(",");
				for(String s : keywords){
					sql += SqlRequest.SEARCH_ANNONCE_DESCRIPTION_LOGE;
					sql = sql.replaceFirst("###", "\"%"+ s + "%\"");
				}
				
			}
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
