package pe.edu.unsch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.PedidoDao;
import pe.edu.unsch.entities.Pedido;
import pe.edu.unsch.service.common.GenericServiceImpl;

@Service
public class PedidoServiceImpl extends GenericServiceImpl<Pedido, Long> implements PedidoService{
	

	@Autowired
	private PedidoDao pedidoDao;
	
	@Override
	public CrudRepository<Pedido, Long> getDao(){
		return pedidoDao;
	}

}
