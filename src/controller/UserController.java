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
    	//Test the "Login" method 
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
			//Map<String, String> res = JsonHelper.deserilisation(result);
			model.addAttribute("idUser", result);
		}
		model.addAttribute("rememberMe", remember);
		return "index";
	}
	
	@RequestMapping(value = "/signup", method = {RequestMethod.GET, RequestMethod.POST}) //inscription
	public String inscription(){
		String pageName = null;
		//retourner sur la meme page
		return pageName;
	}
}
