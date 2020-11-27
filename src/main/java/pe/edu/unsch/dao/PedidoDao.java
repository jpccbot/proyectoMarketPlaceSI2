package pe.edu.unsch.dao;

import org.springframework.data.repository.CrudRepository;

import pe.edu.unsch.entities.Pedido;

public interface PedidoDao extends CrudRepository<Pedido, Long>{

}
