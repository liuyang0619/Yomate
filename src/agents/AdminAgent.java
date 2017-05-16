package agents;

import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

public class AdminAgent extends Agent{
	/*
	 * The main agent who receives the request from server
	 * and transfers the requests to the others agents
	 * */
	protected void setup(){
		
	}
	protected class ReceiveFromServerBehaviour extends Behaviour{
		/*
		 * receive the request from server(JadeGateWay), judge which agent should be the target 
		 * and transfer the request to the others agents 
		 * */
		@Override
		public void action() {
			/*MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.INFORM); 
			ACLMessage msg = receive();
			if(msg != null){
				
			}
			else
				block();*/
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
	protected class ReceiveFromAgentsBehaviour extends Behaviour{
		/*
		 * receive the answer from the others agents, 
		 * and transfer the answer to the server(JadeGateWay) 
		 * */
		@Override
		public void action() {
			/*MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.INFORM); 
			ACLMessage msg = receive();
			if(msg != null){
				
			}
			else
				block();*/
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
}
