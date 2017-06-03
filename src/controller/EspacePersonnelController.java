package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import agents.ActionMessageContent;
import agents.Constants;
import agents.behaviour.ProcessBehaviour;
import jade.core.Profile;
import jade.util.leap.Properties;
import jade.wrapper.ControllerException;
import jade.wrapper.StaleProxyException;
import jade.wrapper.gateway.JadeGateway;
import json.util.JsonHelper;
import model.User;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/espacePersonnel")
public class EspacePersonnelController {
	@RequestMapping(value = "/{userId}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String acces(@PathVariable String userId, Model model ){ 
		System.out.println("espacePersonnel!");
		//recuperer toutes les informations d'utilisateur pour afficher dans l'espace personnel
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	//Test the "Login" method 
    	map.put("idUser", userId);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.SELECT_PROFILE, map);
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
		String result = behaviour.getAnswer();
		System.out.println("res----------------------"+result);
//		Map<String, Object>[] res = JsonHelper.deserilisationArray(result);
//		System.out.println("res----------------------"+res);
//		Map<String, Object> r = new HashMap<String, Object>();
//		for (Map<String, Object> o : res){
//		for (Map.Entry<String, Object> e : res[0].entrySet()){
//			model.addAttribute(e.getKey(), e.getValue());
//			r.put(e.getKey(),e.getValue());
//		}
//		
//		}
		
		model.addAttribute("userProfile", result);
		//System.out.println("res----------------------"+r);
		return "espacePersonnel";
	}
}
