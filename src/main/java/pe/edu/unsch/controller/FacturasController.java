package pe.edu.unsch.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import pe.edu.unsch.entities.Factura;
import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.entities.Persona;
import pe.edu.unsch.service.FacturaService;
import pe.edu.unsch.service.PedidoService;
//import pe.edu.unsch.service.PersonaService;
import pe.edu.unsch.service.PersonaService;

@Controller
public class FacturasController {
	
	@Autowired
	private FacturaService facturaService;
	
	@Autowired
	private PedidoService pedidoService;
	
	@Autowired
	private PersonaService personaService;
	
	@GetMapping("/facturas")
	public String facturas(Model model){
		model.addAttribute("list", facturaService.getAll());
		model.addAttribute("listPedido", pedidoService.getAll());
		List<Pedido> pedidos = pedidoService.getAll();
		Date hoy = new Date();
		
		List<Factura> semifacturas = new ArrayList<>();
		float suma = 0;
		float igv = 0;
		String numruc="";
		int j = 0;
		for (int i = 0; i <pedidos.size(); i++) {
			if (pedidos.get(i).getEstadoPedido() == 1 && pedidos.get(i).getFactura() == null ) {
				
				suma = suma + pedidos.get(i).getPrecioOfertado()*pedidos.get(i).getCantidadProducto();
				igv = (float) (igv) + (float) (suma*0.18);
				numruc = pedidos.get(i).getPersona().getNumeroRuc();
				Factura factura = new Factura(pedidos.get(i).getPersona(), hoy, igv, suma, numruc);
				semifacturas.add(factura);
				j=i;
			}
		}
		
		for (int i = 0; i <pedidos.size(); i++) {
			if (pedidos.get(i).getEstadoPedido() == 1 && pedidos.get(i).getFactura() == null ) {
				pedidos.get(i).setFactura(semifacturas.get(semifacturas.size()-1));
			}
		}

		if (semifacturas.size() > 0) {
			System.out.println(facturaService.save(semifacturas.get(semifacturas.size()-1)));
		}

		return "views/front/CU08-19/facturas";
	}
	
}

