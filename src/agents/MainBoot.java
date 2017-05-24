package agents;

import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.wrapper.AgentContainer;
import jade.wrapper.AgentController;

public class MainBoot {
	/*
	 * The main application of MAS
	 * */
	public static String MAIN_PROPERTIES_FILE = "properties/main";
	 
	public static void main(String[] args) {
		Runtime rt = Runtime.instance();
		ProfileImpl p = null;
		try {
			p = new ProfileImpl(MAIN_PROPERTIES_FILE);
			AgentContainer mc = rt.createMainContainer(p);
			AgentController AdminAgent = mc.createNewAgent(Constants.ADMIN_AGENT, "agents.AdminAgent", null);
			AdminAgent.start();
			AgentController ManageUserAgent = mc.createNewAgent(Constants.MANAGE_USER_AGENT, "agents.ManageUserAgent", null);
			ManageUserAgent.start();
			AgentController SqlRequestAgent = mc.createNewAgent(Constants.SQL_REQUEST_AGENT, "agents.SqlRequestAgent", null);
			SqlRequestAgent.start();
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
