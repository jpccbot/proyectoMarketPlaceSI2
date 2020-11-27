package pe.edu.unsch.entities;
// Generated 26/11/2020 11:03:24 PM by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Opcion generated by hbm2java
 */
@Entity
@Table(name = "opcion", catalog = "marketplacebd")
public class Opcion implements java.io.Serializable {

	private int idopcion;
	private SubModulo subModulo;
	private String nombre;
	private byte estado;
	private Set<RolOpcion> rolOpcions = new HashSet<RolOpcion>(0);

	public Opcion() {
	}

	public Opcion(int idopcion, SubModulo subModulo, String nombre, byte estado) {
		this.idopcion = idopcion;
		this.subModulo = subModulo;
		this.nombre = nombre;
		this.estado = estado;
	}

	public Opcion(int idopcion, SubModulo subModulo, String nombre, byte estado, Set<RolOpcion> rolOpcions) {
		this.idopcion = idopcion;
		this.subModulo = subModulo;
		this.nombre = nombre;
		this.estado = estado;
		this.rolOpcions = rolOpcions;
	}

	@Id

	@Column(name = "idopcion", unique = true, nullable = false)
	public int getIdopcion() {
		return this.idopcion;
	}

	public void setIdopcion(int idopcion) {
		this.idopcion = idopcion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idsubmodulo", nullable = false)
	public SubModulo getSubModulo() {
		return this.subModulo;
	}

	public void setSubModulo(SubModulo subModulo) {
		this.subModulo = subModulo;
	}

	@Column(name = "nombre", nullable = false, length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "estado", nullable = false)
	public byte getEstado() {
		return this.estado;
	}

	public void setEstado(byte estado) {
		this.estado = estado;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "opcion")
	public Set<RolOpcion> getRolOpcions() {
		return this.rolOpcions;
	}

	public void setRolOpcions(Set<RolOpcion> rolOpcions) {
		this.rolOpcions = rolOpcions;
	}

}
