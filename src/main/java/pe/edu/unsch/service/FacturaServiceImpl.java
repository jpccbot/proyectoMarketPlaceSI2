package pe.edu.unsch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.FacturaDao;
import pe.edu.unsch.entities.Factura;
import pe.edu.unsch.service.common.GenericServiceImpl;

@Service
public class FacturaServiceImpl extends GenericServiceImpl<Factura, Integer> implements FacturaService{

	@Autowired
	private FacturaDao facturaDao;
	
	@Override
	public CrudRepository<Factura, Integer> getDao() {
		return facturaDao;
	}

}
