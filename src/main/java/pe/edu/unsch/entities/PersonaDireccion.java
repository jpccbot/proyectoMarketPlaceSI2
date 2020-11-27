package pe.edu.unsch.entities;
// Generated 26/11/2020 11:03:24 PM by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PersonaDireccion generated by hbm2java
 */
@Entity
@Table(name = "persona_direccion", catalog = "marketplacebd")
public class PersonaDireccion implements java.io.Serializable {

	private int idpersonadireccion;
	private Direccion direccion;
	private Persona persona;

	public PersonaDireccion() {
	}

	public PersonaDireccion(int idpersonadireccion, Direccion direccion, Persona persona) {
		this.idpersonadireccion = idpersonadireccion;
		this.direccion = direccion;
		this.persona = persona;
	}

	@Id

	@Column(name = "idpersonadireccion", unique = true, nullable = false)
	public int getIdpersonadireccion() {
		return this.idpersonadireccion;
	}

	public void setIdpersonadireccion(int idpersonadireccion) {
		this.idpersonadireccion = idpersonadireccion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "iddireccion", nullable = false)
	public Direccion getDireccion() {
		return this.direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idpersona", nullable = false)
	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

}