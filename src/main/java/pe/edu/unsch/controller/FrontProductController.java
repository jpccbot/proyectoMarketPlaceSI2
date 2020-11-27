package pe.edu.unsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FrontProductController {
	@GetMapping("/product")
	public String product() {
		return "views/front/product";
	}
}

