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

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@RequestMapping(value = "/{city}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String rechercheDepuisAcceuil(
			@PathVariable("city") String city,
			Model model) { 
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	
    	map.put("lieu", city);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.SEARCH_ANNONCE, map);
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

		System.out.println(result);
		model.addAttribute("results", result);
		model.addAttribute("city", city);
		return "recherche.jsp";
	}
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String pageDeRecherche(Model model) {
		model.addAttribute("results", "return");
		return "recherche.jsp";
	}
	
	@RequestMapping(value = "/criteres", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String recherche(@RequestParam(value="email", required=false) String email,
			@RequestParam(value="lieu", required=false) String lieu,
			@RequestParam(value="budgetMax", required=false) String budgetMax,
			@RequestParam(value="budgetMin", required=false) String budgetMin,
			@RequestParam(value="dateDebut", required=false) String dateDebut,
			@RequestParam(value="dateFin", required=false) String dateFin,
			@RequestParam(value="sex", required=false) String sex,
			@RequestParam(value="ageMin", required=false) String ageMin,
			@RequestParam(value="ageMax", required=false) String ageMax,
			@RequestParam(value="haspet", required=false) String haspet,
			@RequestParam(value="situationFam", required=false) String situationFam,
			@RequestParam(value="profession", required=false) String profession,
			@RequestParam(value="nationnalite", required=false) String nationnalite,
			@RequestParam(value="loisir", required=false) String loisir,
			@RequestParam(value="language", required=false) String language,
			@RequestParam(value="keyWordLoge", required=false) String keyWordLoge,
			Model model) {
				
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
		
    	map.put("lieu", lieu);
    	if (budgetMax != "")
    		map.put("budgetMax", budgetMax);
    	if (budgetMin != "")
    		map.put("budgetMin", budgetMin);
    	if (dateDebut != "")
    		map.put("dateDebut", dateDebut);
    	if (dateFin != "")
    		map.put("dateFin", dateFin);
    	if (sex != "")
    		map.put("sex", sex);
    	if (ageMin != "")
    		map.put("ageMin", ageMin);
    	if (ageMax != "")
    		map.put("ageMax", ageMax);
    	if (haspet != "")
    		map.put("haspet", haspet);
    	if (situationFam != "")
    		map.put("situationFam", situationFam);
    	if (profession != "")
    		map.put("profession", profession);
    	if (nationnalite != "")
    		map.put("nationnalite", nationnalite);
    	if (loisir != "")
    		map.put("loisir", loisir);
    	if (language != "")
    		map.put("language", language);
    	if (keyWordLoge != "")
    		map.put("keyWordLoge", keyWordLoge);
    	
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.SEARCH_ANNONCE, map);
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

		System.out.println("search reasult-----------------------------" + result);
		model.addAttribute("results", result);
		model.addAttribute("city", lieu);
		model.addAttribute("budgetMax", budgetMax);
		model.addAttribute("budgetMin", budgetMin);
		model.addAttribute("dateDebut", dateDebut);
		model.addAttribute("dateFin", dateFin);
		model.addAttribute("sex", sex);
		model.addAttribute("ageMin", ageMin);
		model.addAttribute("ageMax", ageMax);
		model.addAttribute("animal", haspet);
		model.addAttribute("situationFam", situationFam);
		model.addAttribute("profession", profession);
		model.addAttribute("nationnalite", nationnalite);
		model.addAttribute("loisir", loisir);
		model.addAttribute("language", language);
		model.addAttribute("logement", keyWordLoge);
		return "recherche.jsp";
	}
}
