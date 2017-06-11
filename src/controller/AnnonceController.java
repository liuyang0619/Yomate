package controller;

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
import jade.util.leap.Properties;
import jade.wrapper.ControllerException;
import jade.wrapper.StaleProxyException;
import jade.wrapper.gateway.JadeGateway;
import json.util.JsonHelper;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/annonce")
public class AnnonceController {
	
	//pour voir les annonces des autres
	@RequestMapping(value = "/{annonceId}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String afficher(@PathVariable String annonceId, Model model){ 
		//recuperer les informations de l'annonce 
		System.out.println("Showing annonce!");
		
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	//Test the "Login" method 
    	map.put("idAnnonce", annonceId);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.GET_ANNONCE, map);
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
		model.addAttribute("annonceInfo", result);
		
		
		//get proposer(user) id
		String proposerId = null;
		Map<String, Object>[] res = JsonHelper.deserilisationArray(result);
		System.out.println("res----------------------"+res);
		Map<String, Object> r = new HashMap<String, Object>();
		//for (Map<String, Object> o : res){
		for (Map.Entry<String, Object> e : res[0].entrySet()){
			//model.addAttribute(e.getKey(), e.getValue());
			//r.put(e.getKey(),e.getValue());
			if(e.getKey().toString().equals("proposer")){
				proposerId = (String) e.getValue();
			}
		}
		System.out.println("proposer---------------------"+proposerId);
		
		/*Properties p = new Properties();
    	p.setProperty(Profile.MAIN_HOST, "localhost");
    	p.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);*/
    	Map<String, String> mapU = new HashMap<String, String>();
    	//Test the "Login" method 
    	mapU.put("idUser", proposerId);
    	ActionMessageContent amcU = new ActionMessageContent(Constants.Action.SELECT_PROFILE, mapU);
    	String contentU = JsonHelper.serilisation(amcU);
    	ProcessBehaviour behaviourU = new ProcessBehaviour(contentU);
		try {
			JadeGateway.execute(behaviourU);
		} catch (StaleProxyException e) {
			e.printStackTrace();
		} catch (ControllerException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		String resultU = behaviourU.getAnswer();
		System.out.println("resUUUU----------------------"+resultU);
		
		model.addAttribute("userProfile", resultU);
		return "PageAnnonce.jsp";
	}
	
	//supprimer une annonce depuis l'espace personnel
	@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String delete(){ 
		
		return "espacePersonnel";
	}
	
	//cloturer ou rouvrir une annonce
	@RequestMapping(value = "/etat", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String gestionEtat(){ 
		
		
		return "PageAnnonce";
	}
	
	//favoriser une annonce
	@RequestMapping(value = "/favorie", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String favoriser(){ 
		
		
		return "PageAnnonce";
	}
	
	//creer une annonce
	@RequestMapping(value = "/add", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String creation(){ 
		
		
		return "PageAnnonce";
	}
	
	/*@RequestMapping(value = "/modifierTest/{idAnnonce}/{dateD}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String modifierTest(@PathVariable(value="idAnnonce") String idAnnonce, @PathVariable(value="dateD") String dateD){
		
		System.out.println("testing modifier");
		System.out.println(idAnnonce);
		System.out.println(dateD);
		
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
		map.put("idAnnonce", "2");
		map.put("dateDebut", "1940-11-11");
		map.put("dateFin", "1940-11-11");
		map.put("description", "asdfadsf");
		map.put("budget", "344");
		map.put("nbPersonneBesoin", "3");
		map.put("lieu", "wenzhou");
		map.put("descriptionLogement", "good location");
		map.put("sex", "0");
		map.put("ageMin", "1");
		map.put("ageMax", "78");
		map.put("haspet", "0");
		map.put("situationFam", "celibataire");
		map.put("ecole", "UTC");
		map.put("profession", "11");
		map.put("nationnalite", "6");
    	map.put("loisir", "1,3,5");
    	map.put("language", "4,7");
    	map.put("peutetre", "sex, haspet");
    	map.put("obligatoire", "age, language");
    	map.put("important", "nationnalite");
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.MODIFY_ANNONCE, map);
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
		//return "annonce/"+idAnnonce;
		return "PageAnnonce";
	}*/
	
	//modifier une annonce
	@RequestMapping(value = "/modifier/{idAnnonce}/{dateD}/{dateF}/{description}/{budget}/{nbPersonneBesoin}/{lieu}/{descriptionLogement}/{sex}/"
			+ "{ageMin}/{ageMax}/{pet}/{situationF}/{ecole}/{profession}/{nationnalite}/{loisirValue}/{language}/{peutetre}/{obligatoire}/{important}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String modifier(@PathVariable String idAnnonce, @PathVariable String dateD, @PathVariable String dateF,
			@PathVariable String description, @PathVariable String budget, @PathVariable String nbPersonneBesoin,
			@PathVariable String lieu, @PathVariable String descriptionLogement, @PathVariable String sex, @PathVariable String ageMin, @PathVariable String ageMax,
			@PathVariable String pet, @PathVariable String situationF, @PathVariable String ecole, @PathVariable String profession,
			@PathVariable String nationnalite, @PathVariable String loisirValue, @PathVariable String language,
			@PathVariable String peutetre, @PathVariable String obligatoire, @PathVariable String important,
			Model model){ 
		
		System.out.println("Modifying annonce!");
		
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	//Test the "Login" method 
    	map.put("idAnnonce", idAnnonce);
		map.put("dateDebut", dateD);
		map.put("dateFin", dateF);
		map.put("description", description);
		map.put("budget", budget);
		map.put("nbPersonneBesoin", nbPersonneBesoin);
		map.put("lieu", lieu);
		map.put("descriptionLogement", descriptionLogement);
		map.put("sex", sex);
		map.put("ageMin", ageMin);
		map.put("ageMax", ageMax);
		map.put("haspet", pet);
		map.put("situationFam", situationF);
		map.put("ecole", ecole);
		map.put("profession", profession);
		map.put("nationnalite", nationnalite);
    	map.put("loisir", loisirValue);
    	map.put("language", language);
    	map.put("peutetre", peutetre);
    	map.put("obligatoire", obligatoire);
    	map.put("important", important);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.MODIFY_ANNONCE, map);  
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
		/*if(result == null){
			System.out.println("result null");
		}
		else{
			System.out.println("result not null");
		}*/
		
		//model.addAttribute("annonceInfo", result);
			
		return "annonce/"+idAnnonce;
	}

}
