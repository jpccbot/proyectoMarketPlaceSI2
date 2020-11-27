package pe.edu.unsch.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class FrontHomeController {
	
	@GetMapping({"/","/front"})
	public String home() {
		return  "views/front/index";
	}
}
