package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/espacePersonnel")
public class EspacePersonnelController {
	@RequestMapping(value = "/{userId}", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String acces(){ 
		//recuperer toutes les informations d'utilisateur pour afficher dans l'espace personnel
		
		return "espacePersonnel";
	}
}
