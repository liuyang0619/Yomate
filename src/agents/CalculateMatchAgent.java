package agents;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import agents.ManageAnnonceAgent.SendToSqlBehaviour;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;
import model.Annonce;
import sql.util.SqlRequest;

public class CalculateMatchAgent extends Agent{

	protected void setup(){
		addBehaviour(new ReceiveActionBehaviour());
	}
	protected class ReceiveActionBehaviour extends Behaviour{
		String email;
		String password;
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
				case Constants.Action.MATCH_ANNONCE:
					String idAnnonce = (String) params.get("idAnnonce");
					addBehaviour(new MatchBehaviour(msg, idAnnonce));
					break;
				case Constants.Action.GET_USER_MATCHED:
					sql = SqlRequest.GET_USER_RECOMMENDED_BY_ID_ANNONCE;
					idAnnonce = (String) params.get("idAnnonce");
					sql = sql.replaceFirst("###", "\""+ idAnnonce + "\"");
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
		
	}
	
	protected class MatchBehaviour extends Behaviour{
		String idAnnonce;
		ACLMessage response;
		MessageTemplate mt;
		String sql;
		boolean flag = false;
		String conversationId;
		ACLMessage msgReceived = null;
		Annonce annonce;
		int step = 1;
		
		public MatchBehaviour(ACLMessage msgReceived, String idAnnonce) {
			this.idAnnonce = idAnnonce;
			this.msgReceived = msgReceived;
			conversationId = String.valueOf(System.currentTimeMillis());;
		}
		
		@Override
		public void action() {
			switch(step){
			case 1:
				ACLMessage msg = new ACLMessage();
				msg.setPerformative(ACLMessage.QUERY_REF);
				msg.addReceiver(new AID(Constants.Agent.SQL_REQUEST_AGENT, AID.ISLOCALNAME));
				sql = SqlRequest.SELECT_ANNONCE_BY_ID;
				sql = sql.replaceFirst("###", "\""+ idAnnonce + "\"");
				msg.setContent(sql);
				msg.setConversationId(conversationId);
				send(msg);
				step++;
				break;
			case 2:
				mt = MessageTemplate.MatchConversationId(conversationId); 
				response = receive(mt);
				if(response != null){
					String res = response.getContent();
					res = res.substring(1,res.length() - 1);
					Map<String, Object> map = JsonHelper.deserilisation(res);
					annonce = new Annonce(map);
					sql = this.getAnnonceByLieuDateDebutDateFin(annonce);
					msg = new ACLMessage();
					msg.setPerformative(ACLMessage.QUERY_REF);
					msg.addReceiver(new AID(Constants.Agent.SQL_REQUEST_AGENT, AID.ISLOCALNAME));
					msg.setContent(sql);
					msg.setConversationId(conversationId);
					send(msg);
					step++;
				}
				break;
			case 3:
				mt = MessageTemplate.MatchConversationId(conversationId); 
				response = receive(mt);
				if(response != null){
					Map<String, Object>[] array = JsonHelper.deserilisationArray(response.getContent());
					for(Map<String, Object> map : array){
						String idAnnonceOfProposer = (String) map.get("idAnnonce");
						String idProposer = (String) map.get("proposer");
						System.out.println(idProposer);
						addBehaviour(new UpdateMatchTableBehaviour(idProposer, annonce));
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
		
		protected String getAnnonceByLieuDateDebutDateFin(Annonce annonce){
			String sql = SqlRequest.SEARCH_ANNONCE_MAIN;
			sql += SqlRequest.SEARCH_ANNONCE_LIEU;
			sql = sql.replaceFirst("###", "\""+ annonce.getLieu() + "\"");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String dateDebut = annonce.getDate_debut();
	        Date dt = null;
			try {
				dt = sdf.parse(dateDebut);
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
			
	        String dateFin = annonce.getDate_fin();
			try {
				dt = sdf.parse(dateFin);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	        date.setTime(dt);
	        date.add(Calendar.DAY_OF_YEAR, 7);
	        max = sdf.format(date.getTime());
	        date.add(Calendar.DAY_OF_YEAR, -14);
	        min = sdf.format(date.getTime());
			sql += SqlRequest.SEARCH_ANNONCE_DATE_FIN;
			sql = sql.replaceFirst("###", "\""+ min + "\"");
			sql = sql.replaceFirst("###", "\""+ max + "\"");
			sql += " GROUP BY a.proposer ";
			sql += ";";
			return sql;
		}
		
	}
	
	protected class UpdateMatchTableBehaviour extends Behaviour{
		Annonce annonce;
		String idProposer;
		ACLMessage response;
		MessageTemplate mt;
		String sql;
		boolean flag = false;
		String conversationId;
		int step = 1;
		
		public UpdateMatchTableBehaviour(String idProposer, Annonce annonce) {
			this.annonce = annonce;
			this.idProposer = idProposer;
			conversationId = String.valueOf(System.currentTimeMillis());
		}
		
		@Override
		public void action() {
			switch(step){
			case 1:
				ACLMessage msg = new ACLMessage();
				msg.setPerformative(ACLMessage.QUERY_REF);
				msg.addReceiver(new AID(Constants.Agent.SQL_REQUEST_AGENT, AID.ISLOCALNAME));
				sql = SqlRequest.SELECT_PROFIL_BY_ID;
				sql = sql.replaceFirst("###", "\""+ idProposer + "\"");
				msg.setContent(sql);
				msg.setConversationId(conversationId);
				send(msg);
				step++;
				break;
			case 2:
				mt = MessageTemplate.MatchConversationId(conversationId); 
				response = receive(mt);
				if(response != null){
					String res = response.getContent();
					
					
					step++;
				}
				break;
			case 3:
				mt = MessageTemplate.MatchConversationId(conversationId); 
				response = receive(mt);
				if(response != null){
					Map<String, Object>[] array = JsonHelper.deserilisationArray(response.getContent());
					for(Map<String, Object> map : array){
						String idAnnonceOfProposer = (String) map.get("idAnnonce");
						String idProposer = (String) map.get("proposer");
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
