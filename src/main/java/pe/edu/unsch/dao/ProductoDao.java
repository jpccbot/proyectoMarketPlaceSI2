package pe.edu.unsch.dao;

import org.springframework.data.repository.CrudRepository;

import pe.edu.unsch.entities.Producto;

public interface ProductoDao extends CrudRepository<Producto, Long>{

}
