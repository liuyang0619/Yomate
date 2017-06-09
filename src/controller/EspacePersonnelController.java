package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

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
		
		model.addAttribute("userProfile", resultProfile);
		model.addAttribute("AnnonceFavorite", resultAnnonceFavorite);
		return "espacePersonnel";
	}
	
	@RequestMapping(value = "/modify/{userId}", method = {RequestMethod.POST}) 
	public String modify(
			@PathVariable(value="userId", required=false) String userId,
			@RequestParam(value="nom", required=false) String nom,
			@RequestParam(value="prenom", required=false) String prenom,
			@RequestParam(value="sex", required=false) String sex,
			@RequestParam(value="haspet", required=false) String haspet, 
			@RequestParam(value="situationFam", required=false) String situationFam,
			@RequestParam(value="profession", required=false) String profession, 
			@RequestParam(value="nationnalite", required=false) String nationnalite, 
			@RequestParam(value="birthday", required=false) String birthday, 
			@RequestParam(value="loisir", required=false) String loisir, 
			@RequestParam(value="language", required=false) String language, 
			@RequestParam(value="lieu", required=false) String lieu, 
			@RequestParam(value="ecole", required=false) String ecole, 
			@RequestParam(value="annonce", required=false) String annonce, 
			Model model ){ 
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("idUser", userId);
    	map.put("nom", nom);
    	map.put("prenom", prenom);
    	map.put("sex", sex);
    	map.put("haspet", haspet);
    	map.put("situationFam", situationFam);
    	map.put("profession", "5");
    	map.put("nationnalite", "6");
    	map.put("birthday", birthday);
    	map.put("loisir", "8");
    	map.put("language", "10");
    	map.put("lieu", lieu);
    	map.put("ecole", ecole);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.MODIFY_PROFILE, map);
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
	
		
		if (result != null){
			//map to json
			//JSON jsonObject = JSONSerializer.toJSON(map);
			//JSONObject jsonObject = JSONObject.fromObject(map);
			//model.addAttribute("userProfile", jsonObject);
			//System.out.println("json--------"+jsonObject);
			model.addAttribute("AnnonceFavorite", annonce);
			
		}
		else{
			model.addAttribute("status","failure" );
			
			return null;
		}
		return "espacePersonnel";
		
		
	}
}
