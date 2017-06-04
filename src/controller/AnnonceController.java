package controller;

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

@Controller
@RequestMapping("/annonce")
public class AnnonceController {
	
	//pour voir les annonces des autres
	@RequestMapping(value = "/afficher/{annonceId}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String afficher(@PathVariable String annonceId, Model model){ 
		//recuperer les informations de l'annonce 
		System.out.println("Showing annonce!");
		//recuperer toutes les informations d'utilisateur pour afficher dans l'espace personnel
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
		if(result == null){
			System.out.println("result null");
		}
		else{
			System.out.println("result not null");
		}
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
		
		model.addAttribute("annonceInfo", result);
		return "PageAnnonce";
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
	
	//modifier une annonce
	@RequestMapping(value = "/modifier", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String modifer(){ 
		
			
		return "PageAnnonce";
	}
}
