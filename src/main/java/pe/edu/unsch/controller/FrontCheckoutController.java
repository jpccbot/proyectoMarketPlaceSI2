package pe.edu.unsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FrontCheckoutController {
	
	@GetMapping("/checkout")
	public String checkout() {
		return "views/front/checkout";
	}
}
