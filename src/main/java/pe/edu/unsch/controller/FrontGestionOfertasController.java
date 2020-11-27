package pe.edu.unsch.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.entities.OfertaProducto;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.OfertaProductoService;
import pe.edu.unsch.service.ProductoService;

@Controller
public class FrontGestionOfertasController {
	
	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private OfertaProductoService ofertaProductoService;

	
	//Lista de productos de un vendedor
	@RequestMapping("/gestionofertas")
	public String gestionOfertas(Model model){
		model.addAttribute("listProducts", productoService.getAll());
		List<Producto> productos = productoService.getAll();
		List filtro = new ArrayList();
		for(int i = 0; i < productos.size(); i++) {
			if(productos.get(i).isEstadoseleccionoferta() == true) {
				filtro.add(productos.get(i));
			}
		}
		
		model.addAttribute("oferta", filtro);
		return "views/front/CU08-19/gestionOfertas";
	}
	
	
	//Cambia estado de producto de 'Seleccionado' a 'Deseleccionado'
	@GetMapping("/gestionofertas/save/{id}")
	public String showSave(@PathVariable("id") int id, Model model) {
		
		Producto product = productoService.get((long) id);
	
		if(product.isEstadoseleccionoferta()) {
			product.setEstadoseleccionoferta(false);
			productoService.save(product);
		}
		else {
			product.setEstadoseleccionoferta(true);
			productoService.save(product);
		}
		return "redirect:/gestionofertas";
	}
	
	
	//Actualiza una oferta
	@GetMapping("/gestionofertas/create/{id}/{idP}")
	public String UpdateOferta(@PathVariable("id") int id, @PathVariable("idP") int idP, Model model) {
		
		if(id != 0) {
			Long updateOferta = null;
			List<OfertaProducto> ofertaProducto = ofertaProductoService.getAll();
			Producto producto = productoService.get((long) idP);
			
			for (int i = 0; i <ofertaProducto.size(); i++) {
				if(ofertaProducto.get(i).getProducto().getIdproducto() == idP) {
					updateOferta = ofertaProducto.get(i).getIdofertaproducto();
				}				
			}
			
			model.addAttribute("oferta", ofertaProductoService.get(updateOferta));
			model.addAttribute("productoo", producto);
			
		}else {
			
			Producto producto = productoService.get((long) idP);
			
			model.addAttribute("productoo", producto);
			model.addAttribute("oferta", new OfertaProducto());
		}
		return "views/front/CU08-19/save";
	}
	
	
	//Create una nueva oferta
	@PostMapping("/gestionofertas/create")
	public String CreateOferta(OfertaProducto ofertaProducto, Model model) {
		ofertaProductoService.save(ofertaProducto);
		return "redirect:/gestionofertas";
	}
	
	
	
	
	//delete
		@GetMapping("/gestionofertas/delete/{id}")
		public String delete(@PathVariable("id") int id, Model model) {
			Long deleteOferta = null;
			List<OfertaProducto> ofertaProducto = ofertaProductoService.getAll();
			Producto producto = productoService.get((long) id);
			
			for (int i = 0; i <ofertaProducto.size(); i++) {
				if(ofertaProducto.get(i).getProducto().getIdproducto() == id) {
					System.out.println(ofertaProducto.get(i).getIdofertaproducto());
					deleteOferta = ofertaProducto.get(i).getIdofertaproducto();
				}				
			}
			ofertaProductoService.delete(deleteOferta);
			return "redirect:/gestionofertas";
		}

}
