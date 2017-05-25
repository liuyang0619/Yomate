package agents;

import java.util.Map;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;
import sql.util.SqlRequest;

public class ManageProfilAgent extends Agent{
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
				
				switch(action){
				case Constants.SELECT_PROFILE:
					String idUser = (String) params.get("idUser");
					String sql = SqlRequest.SELECT_PROFIL_BY_ID;
					sql = sql.replaceFirst("###", "\""+ idUser + "\"");
					System.out.println(sql);
					addBehaviour(new SendToSqlBehaviour(msg, sql, ACLMessage.QUERY_REF));
					break;
				case Constants.LOGIN:
//					email = (String) params.get("email");
//					password = (String) params.get("password");
//					sql = SqlRequest.CHECK_IF_USER_EXIST_BY_EMAIL_PW;
//					System.out.println(email + password);
//					sql = sql.replaceFirst("###", "\""+ email + "\"");
//					sql = sql.replaceFirst("###", "\""+ password + "\"");
//					System.out.println(sql);
//					addBehaviour(new SendToSqlBehaviour(msg, sql, ACLMessage.QUERY_REF));
					break;
				}
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
				msg.addReceiver(new AID(Constants.SQL_REQUEST_AGENT, AID.ISLOCALNAME));
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
