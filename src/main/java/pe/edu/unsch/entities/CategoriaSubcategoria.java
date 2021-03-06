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
 * CategoriaSubcategoria generated by hbm2java
 */
@Entity
@Table(name = "categoria_subcategoria", catalog = "marketplacebd")
public class CategoriaSubcategoria implements java.io.Serializable {

	private int idcategoriasubcategoria;
	private Categoria categoriaByIdsubcategoria;
	private Categoria categoriaByIdcategoria;

	public CategoriaSubcategoria() {
	}

	public CategoriaSubcategoria(int idcategoriasubcategoria, Categoria categoriaByIdsubcategoria,
			Categoria categoriaByIdcategoria) {
		this.idcategoriasubcategoria = idcategoriasubcategoria;
		this.categoriaByIdsubcategoria = categoriaByIdsubcategoria;
		this.categoriaByIdcategoria = categoriaByIdcategoria;
	}

	@Id

	@Column(name = "idcategoriasubcategoria", unique = true, nullable = false)
	public int getIdcategoriasubcategoria() {
		return this.idcategoriasubcategoria;
	}

	public void setIdcategoriasubcategoria(int idcategoriasubcategoria) {
		this.idcategoriasubcategoria = idcategoriasubcategoria;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idsubcategoria", nullable = false)
	public Categoria getCategoriaByIdsubcategoria() {
		return this.categoriaByIdsubcategoria;
	}

	public void setCategoriaByIdsubcategoria(Categoria categoriaByIdsubcategoria) {
		this.categoriaByIdsubcategoria = categoriaByIdsubcategoria;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idcategoria", nullable = false)
	public Categoria getCategoriaByIdcategoria() {
		return this.categoriaByIdcategoria;
	}

	public void setCategoriaByIdcategoria(Categoria categoriaByIdcategoria) {
		this.categoriaByIdcategoria = categoriaByIdcategoria;
	}

}
