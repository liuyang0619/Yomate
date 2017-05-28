package agents;

import java.util.Map;

import agents.AdminAgent.sendActionToAgentBehaviour;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;
import sql.util.SqlRequest;

public class ManageUserAgent extends Agent {
	protected void setup(){
		addBehaviour(new ReceiveActionFromAdminBehaviour());
	}
	protected class ReceiveActionFromAdminBehaviour extends Behaviour{
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
				case Constants.Action.CREATE_ACCOUNT:
					String nom = (String) params.get("nom");
					String prenom = (String) params.get("prenom");
					email = (String) params.get("email");
					password = (String) params.get("password");
					int sex =  Integer.parseInt(params.get("sex"));
					sql = SqlRequest.CREATE_USER_COMPTE;
					sql = sql.replaceFirst("###", "\""+ nom + "\"");
					sql = sql.replaceFirst("###", "\""+ prenom + "\"");
					sql = sql.replaceFirst("###", "\""+ email + "\"");
					sql = sql.replaceFirst("###", "\""+ password + "\"");
					sql = sql.replaceFirst("###", "\""+ sex + "\"");
					performative = ACLMessage.REQUEST;
					break;
				case Constants.Action.LOGIN:
					email = (String) params.get("email");
					password = (String) params.get("password");
					sql = SqlRequest.CHECK_IF_USER_EXIST_BY_EMAIL_PW;
					sql = sql.replaceFirst("###", "\""+ email + "\"");
					sql = sql.replaceFirst("###", "\""+ password + "\"");
					performative = ACLMessage.QUERY_REF;
					break;
				}
				addBehaviour(new SendToSqlBehaviour(msg, sql, performative));
			}
		}

		@Override
		public boolean done() {
			return false;
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
