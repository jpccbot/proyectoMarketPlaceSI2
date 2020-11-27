package pe.edu.unsch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.OfertaProductoDao;
import pe.edu.unsch.entities.OfertaProducto;
import pe.edu.unsch.service.common.GenericServiceImpl;

@Service
public class OfertaProductoServiceImpl extends GenericServiceImpl<OfertaProducto, Long> implements OfertaProductoService{
	
	@Autowired
	private OfertaProductoDao ofertaproductoDao;
	
	@Override
	public CrudRepository<OfertaProducto, Long> getDao(){
		return ofertaproductoDao;
	}

}
