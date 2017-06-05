package agents;

import java.util.Map;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;

public class AdminAgent extends Agent{
	/*
	 * The main agent who receives the request from server
	 * and transfers the requests to the others agents
	 * */
	protected void setup(){
		addBehaviour(new ReceiveActionFromServerBehaviour());
	}
	protected class ReceiveActionFromServerBehaviour extends Behaviour{

		@Override
		public void action() {
			MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.REQUEST); 
			ACLMessage msg = receive(mt);
			if(msg != null){
				String content = msg.getContent();
				ActionMessageContent amc = (ActionMessageContent) JsonHelper.deserilisation(content, ActionMessageContent.class);
				String action = amc.getAction();
				String agentName = "";
				switch(action){
				case Constants.Action.CREATE_ACCOUNT:
					agentName = Constants.Agent.MANAGE_USER_AGENT;
					break;
				case Constants.Action.LOGIN:
					agentName = Constants.Agent.MANAGE_USER_AGENT;
					break;
				case Constants.Action.SELECT_PROFILE:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.MODIFY_PROFILE:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.ADD_PHOTO:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.DELETE_PHOTO:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.ADD_FAVORITE_ANNONCE:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.DELETE_FAVORITE_ANNONCE:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.SELECT_FAVORITE_ANNONCES:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
//				case Constants.Action.SELECT_HISTORYS_COLO:
//					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
//					break;
//				case Constants.Action.INSERT_HISTORY_COLO:
//					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
//					break;
				case Constants.Action.ADD_EVALUATION_TO_USER:
					agentName = Constants.Agent.MANAGE_PROFIL_AGENT;
					break;
				case Constants.Action.CREATE_ANNONCE:
					agentName = Constants.Agent.MANAGE_ANNONCE_AGENT;
					break;
				case Constants.Action.MODIFY_ANNONCE:
					agentName = Constants.Agent.MANAGE_ANNONCE_AGENT;
					break;
				case Constants.Action.CLOSE_ANNONCE:
					agentName = Constants.Agent.MANAGE_ANNONCE_AGENT;
					break;
				case Constants.Action.REOPEN_ANNONCE:
					agentName = Constants.Agent.MANAGE_ANNONCE_AGENT;
					break;
				case Constants.Action.SEARCH_ANNONCE:
					agentName = Constants.Agent.SEARCH_AGENT;
					break;
				case Constants.Action.GET_ANNONCE:
					agentName = Constants.Agent.SEARCH_AGENT;
					break;
				}
				addBehaviour(new sendActionToAgentBehaviour(msg, agentName));
			}
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
	protected class sendActionToAgentBehaviour extends Behaviour{
		boolean flag = false;
		String conversationId;
		String agentName;
		ACLMessage msgReceived = null;
		int step = 1;
		sendActionToAgentBehaviour(ACLMessage msgReceived, String agentName){
			this.agentName = agentName;
			this.msgReceived = msgReceived;
			conversationId = msgReceived.getConversationId();
		}
		@Override
		public void action() {
			switch(step){
			case 1:
				ACLMessage msg = new ACLMessage();
				msg.setPerformative(ACLMessage.REQUEST);
				msg.addReceiver(new AID(agentName, AID.ISLOCALNAME));
				msg.setContent(msgReceived.getContent());
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
