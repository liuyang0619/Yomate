package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping(value = "/test")
public class Test {

	/*public Test() {
		System.out.println("------------------------------");
	}*/

	@RequestMapping(value = "/one", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(
			@RequestParam(value="email", required=false) String email,
			@RequestParam(value="password", required=false) String password,
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
		System.out.println(result);
    	
		model.addAttribute("msg", result);
		return "success";
	}
	/*@RequestMapping(value = "/one", method = RequestMethod.GET)
	public String test(String username, Model model) {
		System.out.println("in controller");
		model.addAttribute("msg", username);
		return "success";
	}*/
	/*
	 * @RequestMapping("/SpringTest") public String test(String user, Model
	 * model) throws Exception { System.out.println(user);
	 * model.addAttribute("user",user); return "success"; }
	 */
	/*
	 * @RequestMapping(value = "/Spring", method = RequestMethod.GET) public
	 * ModelAndView myMethod(HttpServletRequest request,HttpServletResponse
	 * response,
	 * 
	 * @PathVariable("user") String user, ModelMap modelMap) throws Exception {
	 * modelMap.put("loginUser", user); return new ModelAndView("/testSpring",
	 * modelMap); }
	 */
	/*
	 * @RequestMapping(value = "/welcome", method = RequestMethod.GET) public
	 * String registPost() { return "/welcome"; }
	 */
}
