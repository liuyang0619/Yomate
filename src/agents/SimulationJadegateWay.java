package agents;
import java.util.HashMap;
import java.util.Map;

import jade.core.AID;
import jade.core.Profile;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import jade.util.leap.Properties;
import jade.wrapper.ControllerException;
import jade.wrapper.StaleProxyException;
import jade.wrapper.gateway.JadeGateway;
import json.util.JsonHelper;

public class SimulationJadegateWay {
	public static void main(String[] args) {
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("email", "olivier_zhu@163.com");
    	map.put("password", "1234");
    	ActionMessageContent amc = new ActionMessageContent(Constants.LOGIN, map);
    	String content = JsonHelper.serilisation(amc);
    	
    	ProcessBehaviour behaviour = new ProcessBehaviour(content);
		try {
			JadeGateway.execute(behaviour);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (ControllerException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(behaviour.getAnswer());
		JadeGateway.shutdown();
	}
}
