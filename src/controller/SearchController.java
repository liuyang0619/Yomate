package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@RequestMapping(value = "/{city}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String rechercheDepuisAcceuil(@PathVariable("city") String city){ 
		System.out.println(city);
		
		
		
		return "recherche";
	}
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String recherche(){
		return "recherche";
	}
}
