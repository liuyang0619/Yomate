package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

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
@RequestMapping("user")
public class UserController {
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String test(
			@RequestParam(value="email", required=false) String email,
			@RequestParam(value="password", required=false) String password,
			@RequestParam(value="remember", required=false) boolean remember,
			Model model) {

		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("password", password);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.LOGIN, map);
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
    	
		if (result.isEmpty()) {
			model.addAttribute("idUser", "NonValid");
		} else {
			Map<String, Object>[] res = JsonHelper.deserilisationArray(result);			
			model.addAttribute("idUser", (String)res[0].get("idUser"));
		}
		model.addAttribute("rememberMe", remember);
		return "index.jsp";
	}
	
	@RequestMapping(value = "/signup", method = {RequestMethod.GET, RequestMethod.POST}) //inscription
	public String inscription(
			@RequestParam(value="nom", required=false) String nom,
			@RequestParam(value="prenom", required=false) String prenom,
			@RequestParam(value="email", required=false) String email,
			@RequestParam(value="password", required=false) String password,
			@RequestParam(value="sex", required=false) String sex,
			Model model) {

		Properties pp = new Properties();
    	pp.setProperty(Profile.MAIN_HOST, "localhost");
    	pp.setProperty(Profile.MAIN_PORT, "2000");
    	JadeGateway.init(null, pp);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("nom", nom);
    	map.put("prenom", prenom);
    	map.put("email", email);
    	map.put("password", password);
    	map.put("sex", sex);
    	ActionMessageContent amc = new ActionMessageContent(Constants.Action.CREATE_ACCOUNT, map);
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
		
		if (result.equals(Constants.Message.ERROR_WITH_DATABASE)) {
			model.addAttribute("result", "error");
			return "inscription.jsp";
		} else {
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("email", email);
			map2.put("password", password);
	    	ActionMessageContent amc2 = new ActionMessageContent(Constants.Action.LOGIN, map2);
	    	String content2 = JsonHelper.serilisation(amc2);
	    	ProcessBehaviour behaviour2 = new ProcessBehaviour(content2);
			try {
				JadeGateway.execute(behaviour2);
			} catch (StaleProxyException e) {
				e.printStackTrace();
			} catch (ControllerException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			String result2 = behaviour2.getAnswer();
			Map<String, Object>[] res = JsonHelper.deserilisationArray(result2);			
			model.addAttribute("idUser", (String)res[0].get("idUser"));
			model.addAttribute("rememberMe", false);
			return "index.jsp";
		}
	}
}
