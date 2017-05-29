package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user")
public class UserController {
	
	@RequestMapping(value = "/connect", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String connexion(){ 
		String pageName = null;
		//retourner sur la meme page
		return pageName;
	}
	@RequestMapping(value = "/disconnect", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String deconnexion(){ 
		String pageName = null;
		//retourner sur la meme page
		return pageName;
	}
	
	@RequestMapping(value = "/inscript", method = {RequestMethod.GET, RequestMethod.POST}) //inscription
	public String inscription(){
		String pageName = null;
		//retourner sur la meme page
		return pageName;
	}
}
