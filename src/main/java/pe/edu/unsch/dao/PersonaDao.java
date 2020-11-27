package pe.edu.unsch.dao;

import org.springframework.data.repository.CrudRepository;

import pe.edu.unsch.entities.Persona;

public interface PersonaDao extends CrudRepository<Persona, Integer>{

}
