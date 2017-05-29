package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/annonce")
public class AnnonceController {
	
	//pour voir les annonces des autres
	@RequestMapping(value = "/afficher", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String afficher(){ 
		//recuperer les informations de l'annonce 
		
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
