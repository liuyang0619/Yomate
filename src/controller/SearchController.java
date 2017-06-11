package controller;

import java.util.Calendar;
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
	
	@RequestMapping(value = "city/{city}", method = {RequestMethod.GET, RequestMethod.POST}) 
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
	
//	@RequestMapping(value = "/createAnnonce", method = {RequestMethod.GET, RequestMethod.POST}) 
//	public String creatAnnonce(
//			@PathVariable(value="userId", required=false) String userId,
//			@RequestParam(value="dateDebut", required=false) String dateDebut,
//			@RequestParam(value="dateFin", required=false) String dateFin,
//			@RequestParam(value="sex", required=false) String sex,
//			@RequestParam(value="budgetMax", required=false) String budgetMax,
//			@RequestParam(value="budgetMin", required=false) String budgetMin,
//			@RequestParam(value="haspet", required=false) String haspet, 
//			@RequestParam(value="situationFam", required=false) String situationFam,
//			@RequestParam(value="profession", required=false) String profession, 
//			@RequestParam(value="nationnalite", required=false) String nationnalite, 
//			@RequestParam(value="ageMin", required=false) String ageMin, 
//			@RequestParam(value="ageMax", required=false) String ageMax, 
//			@RequestParam(value="logement", required=false) String logement,
//			@RequestParam(value="loisir", required=false) String loisir, 
//			@RequestParam(value="language", required=false) String language, 
//			@RequestParam(value="lieu", required=false) String lieu, 
//			Model model ){ 
//		Properties pp = new Properties();
//    	pp.setProperty(Profile.MAIN_HOST, "localhost");
//    	pp.setProperty(Profile.MAIN_PORT, "2000");
//    	JadeGateway.init(null, pp);
//    	Map<String, String> map = new HashMap<String, String>();
//    	map.put("dateProposer", "2017-06-12");
//    	map.put("dateDebut", dateDebut);
//    	map.put("dateFin", dateFin);
//    	map.put("proposer", userId);
//    	map.put("budget", budgetMax);
//    	map.put("lieu", lieu);
//    	map.put("sex", sex);
//    	map.put("ageMin",ageMin);
//    	map.put("ageMax", ageMax);
//    	map.put("status", "1");
//    	map.put("haspet", haspet);
//    	map.put("situationFam", situationFam);
//    	map.put("profession", profession);
//    	map.put("nationnalite", nationnalite);
//    	map.put("loisir", loisir);
//    	map.put("language", language);
//    	map.put("logement", logement);
//		map.put("descriptionLogement", "");
//		map.put("description", "");
//		map.put("nbPersonneBesoin", "");
//		map.put("ecole", "");
//		map.put("peutetre", "");
//    	map.put("obligatoire", "");
//    	map.put("important", "");
//    	
//    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.CREATE_ANNONCE, map);
//    	String content = JsonHelper.serilisation(amc);
//    	System.out.println("create annonce content-----------------------------" + content);
//    	ProcessBehaviour behaviour = new ProcessBehaviour(content);
//		try {
//			JadeGateway.execute(behaviour);
//		} catch (StaleProxyException e) {
//			e.printStackTrace();
//		} catch (ControllerException e) {
//			e.printStackTrace();
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
//		String result = behaviour.getAnswer();
//		
//		System.out.println("create annonce result-----------------------------" + result);
//	
//		if (result.equals(Constants.Message.SUCCESS_MODIFY_DATABASE)) {
//			return "espacePersonnel/" + userId;
//		}
//		else {
//			model.addAttribute("city", lieu);
//			model.addAttribute("budgetMax", budgetMax);
//			model.addAttribute("budgetMin", budgetMin);
//			model.addAttribute("dateDebut", dateDebut);
//			model.addAttribute("dateFin", dateFin);
//			model.addAttribute("sex", sex);
//			model.addAttribute("ageMin", ageMin);
//			model.addAttribute("ageMax", ageMax);
//			model.addAttribute("animal", haspet);
//			model.addAttribute("situationFam", situationFam);
//			model.addAttribute("profession", profession);
//			model.addAttribute("nationnalite", nationnalite);
//			model.addAttribute("loisir", loisir);
//			model.addAttribute("language", language);
//			model.addAttribute("logement", logement);
//			return "search/criteres";
//		}
//	}
		
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
			@RequestParam(value="logement", required=false) String logement,
			Model model) {
				
		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
		
    	if (!lieu.isEmpty())
    		map.put("lieu", lieu);
    	if (!budgetMax.isEmpty())
    		map.put("budgetMax", budgetMax);
    	if (!budgetMin.isEmpty())
    		map.put("budgetMin", budgetMin);
    	if (!dateDebut.isEmpty())
    		map.put("dateDebut", dateDebut);
    	if (!dateFin.isEmpty())
    		map.put("dateFin", dateFin);
    	if (!sex.isEmpty())
    		map.put("sex", sex);
    	int year = Calendar.getInstance().get(Calendar.YEAR);
    	if (!ageMin.isEmpty()) {
    		String dateMax = (year - Integer.parseInt(ageMin)) + "-01-01";
    		map.put("ageMax", dateMax);
    	}
    	if (!ageMax.isEmpty()) {
    		String  dateMin = (year - Integer.parseInt(ageMax)) + "-01-01";
    		map.put("ageMin", dateMin);
    	}
    	if (!haspet.isEmpty())
    		map.put("haspet", haspet);
    	if (!situationFam.isEmpty())
    		map.put("situationFam", situationFam);
    	if (!profession.isEmpty())
    		map.put("profession", profession);
    	if (!nationnalite.isEmpty())
    		map.put("nationnalite", nationnalite);
    	if (!loisir.isEmpty())
    		map.put("loisir", loisir);
    	if (!language.isEmpty())
    		map.put("language", language);
    	if (!logement.isEmpty()) {
    		if (logement.equals("0")) {
    			map.put("keyWordLoge", "1");
    		} else {
    			map.put("keyWordLoge", "0");
    		}
		}
    	
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

		System.out.println("search content-----------------------------" + content);
		System.out.println("search result-----------------------------" + result);
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
		model.addAttribute("logement", logement);
		return "recherche.jsp";
	}
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String pageDeRecherche(Model model) {
		model.addAttribute("results", "return");
		return "recherche.jsp";
	}
}
