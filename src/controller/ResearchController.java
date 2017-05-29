package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/research")
public class ResearchController {
	
	@RequestMapping(value = "/{city}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String rechercheDepuisAcceuil(){ 
		
		//retourner sur la page recherche
		return "recherche";
	}
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String recherche(){
		return "recherche";
	}
}
