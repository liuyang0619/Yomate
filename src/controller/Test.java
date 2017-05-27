package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "/test")
public class Test {

	/*public Test() {
		System.out.println("------------------------------");
	}*/

	@RequestMapping(value = "/one", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(@RequestParam(value="userName", required=false) String username, Model model) {
		System.out.println("in controller");
		model.addAttribute("msg", username);
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
