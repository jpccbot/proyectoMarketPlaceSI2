package pe.edu.unsch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.ProductoDao;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.common.GenericServiceImpl;

@Service
public class ProductoServiceImpl extends GenericServiceImpl<Producto, Long> implements ProductoService{

	@Autowired
	private ProductoDao productoDao;
	
	@Override
	public CrudRepository<Producto, Long> getDao(){
		return productoDao;
	}
	
}
