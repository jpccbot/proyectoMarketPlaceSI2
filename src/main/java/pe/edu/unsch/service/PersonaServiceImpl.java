package pe.edu.unsch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.PersonaDao;
import pe.edu.unsch.entities.Persona;
import pe.edu.unsch.service.common.GenericServiceImpl;

@Service
public class PersonaServiceImpl extends GenericServiceImpl<Persona, Integer> implements PersonaService{
	
	@Autowired
	private PersonaDao personaDao;
	
	@Override
	public CrudRepository<Persona, Integer> getDao() {
		return personaDao;
	}

}
