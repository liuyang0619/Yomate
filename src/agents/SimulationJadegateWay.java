package agents;
import java.util.HashMap;
import java.util.Map;

import agents.behaviour.ProcessBehaviour;
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
//Test the "Login" method 
//    	map.put("email", "olivier_zhu@163.com");
//    	map.put("password", "1234");
//    	ActionMessageContent amc = new ActionMessageContent(Constants.LOGIN, map);
//Test the "Create account" method
//    	map.put("nom", "LOU");
//    	map.put("prenom", "H");
//    	map.put("email", "Lou_Lou@163.com");
//    	map.put("password", "azer");
//    	map.put("sex", "1");
//    	ActionMessageContent amc = new ActionMessageContent(Constants.CREATE_ACCOUNT, map);
//Test the "select user's profil by using id" method 
//    	map.put("idUser", "1");
//    	ActionMessageContent amc = new ActionMessageContent(Constants.SELECT_PROFILE, map);
//Test the "Create account" method
    	map.put("idUser", "3");
    	map.put("nom", "LOU");
    	map.put("prenom", "Hhhhh");
    	map.put("password", "12345678");
    	map.put("sex", "0");
    	map.put("haspet", "1");
    	map.put("situationFam", "couple");
    	map.put("ecole", "xiaoxue");
    	map.put("profession", "13");
    	map.put("nationnalite", "14");
    	map.put("birthday", "1940-11-11");
    	map.put("lieu", "compiègne");
    	ActionMessageContent amc = new ActionMessageContent(Constants.MODIFY_PROFILE, map);
    	
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
