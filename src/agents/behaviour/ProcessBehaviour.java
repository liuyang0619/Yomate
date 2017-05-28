package agents.behaviour;

import agents.Constants;
import jade.core.AID;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

public class ProcessBehaviour extends Behaviour {
	private boolean stop = false;
	int step = 0;
	String content;
	String convId;
	String answer;

	public ProcessBehaviour(String content) {
		super();
		this.content = content;
		convId = String.valueOf(System.currentTimeMillis());
	}


	public String getAnswer() {
		return answer;
	}

	@Override
	public void action() {
		switch (step) {
		case 0:
			final ACLMessage msg = new ACLMessage(ACLMessage.REQUEST);
			AID receiver = new AID(Constants.Agent.ADMIN_AGENT, false);
			msg.addReceiver(receiver);
			msg.setContent(content);
			msg.setConversationId(convId);
			myAgent.send(msg);
			step = 1;
			break;
		case 1:
			MessageTemplate mt = MessageTemplate.MatchConversationId(convId);
			ACLMessage answer = myAgent.receive(mt);
			if (answer != null) {
				stopProcess(answer.getContent());
			} else
				block();
			break;
		}
	}

	private void stopProcess(String ans) {
		answer = ans;
		stop = true;
	}

	@Override
	public boolean done() {
		return stop;
	}
}
