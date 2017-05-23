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
			AgentController SqlRequestAgent = mc.createNewAgent("SqlRequestAgent", "agents.SqlRequestAgent", null);
			SqlRequestAgent.start();
			AgentController AdminAgent = mc.createNewAgent("AdminAgent", "agents.AdminAgent", null);
			AdminAgent.start();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
