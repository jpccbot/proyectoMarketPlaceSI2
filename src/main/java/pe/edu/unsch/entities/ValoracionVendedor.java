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
 * ValoracionVendedor generated by hbm2java
 */
@Entity
@Table(name = "valoracion_vendedor", catalog = "marketplacebd")
public class ValoracionVendedor implements java.io.Serializable {

	private int idvaloracion;
	private Persona personaByIdvendedor;
	private Persona personaByIdcomprador;
	private byte puntaje;

	public ValoracionVendedor() {
	}

	public ValoracionVendedor(int idvaloracion, Persona personaByIdvendedor, Persona personaByIdcomprador,
			byte puntaje) {
		this.idvaloracion = idvaloracion;
		this.personaByIdvendedor = personaByIdvendedor;
		this.personaByIdcomprador = personaByIdcomprador;
		this.puntaje = puntaje;
	}

	@Id

	@Column(name = "idvaloracion", unique = true, nullable = false)
	public int getIdvaloracion() {
		return this.idvaloracion;
	}

	public void setIdvaloracion(int idvaloracion) {
		this.idvaloracion = idvaloracion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idvendedor", nullable = false)
	public Persona getPersonaByIdvendedor() {
		return this.personaByIdvendedor;
	}

	public void setPersonaByIdvendedor(Persona personaByIdvendedor) {
		this.personaByIdvendedor = personaByIdvendedor;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idcomprador", nullable = false)
	public Persona getPersonaByIdcomprador() {
		return this.personaByIdcomprador;
	}

	public void setPersonaByIdcomprador(Persona personaByIdcomprador) {
		this.personaByIdcomprador = personaByIdcomprador;
	}

	@Column(name = "puntaje", nullable = false)
	public byte getPuntaje() {
		return this.puntaje;
	}

	public void setPuntaje(byte puntaje) {
		this.puntaje = puntaje;
	}

}
