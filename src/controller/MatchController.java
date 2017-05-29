package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/match")
public class MatchController {
	
	
	@RequestMapping(value = "/{annonce1}&{annonce2}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String match(){ 
		
		
		return "recherche";
	}
}
