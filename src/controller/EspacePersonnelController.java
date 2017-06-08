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
import jade.core.behaviours.SequentialBehaviour;
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
    	
    	System.out.println("userid----------------------"+userId);
    	
    	//Test the "Login" method 
    	map.put("idUser", userId);
    	SequentialBehaviour seqBehaviour = new SequentialBehaviour();
    	
    	ActionMessageContent amc1 = new ActionMessageContent(Constants.Action.SELECT_PROFILE, map);
    	String content1 = JsonHelper.serilisation(amc1);
    	ProcessBehaviour behaviourProfile = new ProcessBehaviour(content1);
    	
    	ActionMessageContent amc2 = new ActionMessageContent(Constants.Action.SELECT_FAVORITE_ANNONCES, map);
    	String content2 = JsonHelper.serilisation(amc2);
    	ProcessBehaviour behaviourAnnonceFavorite = new ProcessBehaviour(content2);
    	
    	seqBehaviour.addSubBehaviour(behaviourProfile);
    	seqBehaviour.addSubBehaviour(behaviourAnnonceFavorite);
    	
		try {
			JadeGateway.execute(seqBehaviour);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (ControllerException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		String resultProfile = behaviourProfile.getAnswer();
		String resultAnnonceFavorite = behaviourAnnonceFavorite.getAnswer();
		
		System.out.println("res----------------------"+resultProfile);
		System.out.println("annonces----------------------"+resultAnnonceFavorite);

		
		model.addAttribute("userProfile", resultProfile);
		model.addAttribute("AnnonceFavorite", resultAnnonceFavorite);
		return "espacePersonnel";
	}
}
