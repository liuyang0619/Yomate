package agents;

import java.util.Map;

import agents.AdminAgent.sendActionToAgentBehaviour;
import agents.SqlRequestAgent.ReceiveSelectSqlBehaviour;
import agents.SqlRequestAgent.ReceiveSqlBehaviour;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;

public class ManageUserAgent extends Agent {
	protected void setup(){
		
	}
	protected class ReceiveActionFromAdminBehaviour extends Behaviour{

		@Override
		public void action() {
			MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.REQUEST); 
			ACLMessage msg = receive(mt);
			if(msg != null){
				String content = msg.getContent();
				Map <String, Object> map = JsonHelper.deserilisation(content);
				String action = (String) map.get("action");
				switch(action){
				case "CreateAccount":
					break;
				case "Login":
					break;
				}
			}
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
}
