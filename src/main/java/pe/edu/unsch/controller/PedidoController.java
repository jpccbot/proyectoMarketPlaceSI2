package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.PedidoService;

@Controller
public class PedidoController {
	
	@Autowired
	private PedidoService pedidoService;
	
	@RequestMapping("/listPedido")
	public String PedidoSeguimiento(Model model) {
		
		model.addAttribute("pedidos", pedidoService.getAll());
		
		return "/views/front/listPedido";
	}

}
