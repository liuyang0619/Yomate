package agents;

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
				System.out.println(sql);
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
					System.out.println(res);
					Map<String, Object> map = JsonHelper.deserilisation(res);
					Annonce annonce = new Annonce(map);
					
					
					
					
					
					
					
					
					
					
					flag = true;
				}
				break;
			case 3:
				mt = MessageTemplate.MatchConversationId(conversationId); 
				response = receive(mt);
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
