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
				Map <String, Object> map = JsonHelper.deserilisation(content);
				String action = (String) map.get("action");
				String agentName = "";
				switch(action){
				case "CreateAccount":
					agentName = "ManageUserAgent";
					break;
				case "Login":
					agentName = "ManageUserAgent";
					break;
				case "ModifyProfile":
					agentName = "ManageProfilAgent";
					break;
				case "AddPhoto":
					agentName = "ManageProfilAgent";
					break;
				case "DeletePhoto":
					agentName = "ManageProfilAgent";
					break;
				case "CreateAnnonce":
					agentName = "ManageAnnonceAgent";
					break;
				case "AddFavoriteAnnonce":
					agentName = "ManageProfilAgent";
					break;
				case "DeleteFavoriteAnnonce":
					agentName = "ManageProfilAgent";
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
		String content;
		String conversationId;
		String agentName;
		ACLMessage msgFromServer = null;
		int step = 1;
		sendActionToAgentBehaviour(ACLMessage msgFromServer, String agentName){
			this.agentName = agentName;
			this.msgFromServer = msgFromServer;
		}
		@Override
		public void action() {
			switch(step){
			case 1:
				ACLMessage msg = new ACLMessage();
				msg.setPerformative(ACLMessage.REQUEST);
				msg.addReceiver(new AID(agentName, AID.ISLOCALNAME));
				msg.setContent(content);
				msg.setConversationId(conversationId);
				send(msg);
				step++;
				break;
			case 2:
				MessageTemplate mt = MessageTemplate.and(MessageTemplate.MatchPerformative(ACLMessage.REQUEST), 
						MessageTemplate.MatchConversationId(conversationId)); 
				ACLMessage response = receive(mt);
				if(response != null){
					ACLMessage reply = msgFromServer.createReply();
					reply.setContent(response.getContent());
					reply.setPerformative(ACLMessage.INFORM);
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
