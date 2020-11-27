package pe.edu.unsch.entities;
// Generated 26/11/2020 11:03:24 PM by Hibernate Tools 5.1.10.Final

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Producto generated by hbm2java
 */
@Entity
@Table(name = "producto", catalog = "marketplacebd", uniqueConstraints = @UniqueConstraint(columnNames = "codigo"))
public class Producto implements java.io.Serializable {

	private Long idproducto;
	private GarantiaProducto garantiaProducto;
	private Persona persona;
	private ProductoDestacado productoDestacado;
	private String codigo;
	private String nombre;
	private String descripcion;
	private BigDecimal precioUnitario;
	private byte cantidad;
	private boolean estadoseleccionoferta;
	private String url;
	private Set<CarritoProducto> carritoProductos = new HashSet<CarritoProducto>(0);
	private Set<ProductoDeseado> productoDeseados = new HashSet<ProductoDeseado>(0);
	private Set<ProductoFavorito> productoFavoritos = new HashSet<ProductoFavorito>(0);
	private Set<ImagenProducto> imagenProductos = new HashSet<ImagenProducto>(0);
	private Set<CategoriaProducto> categoriaProductos = new HashSet<CategoriaProducto>(0);
	private Set<Pedido> pedidos = new HashSet<Pedido>(0);
	private Set<OfertaProducto> ofertaProductos = new HashSet<OfertaProducto>(0);

	public Producto() {
	}

	public Producto(String codigo, String nombre, String descripcion, BigDecimal precioUnitario, byte cantidad,
			boolean estadoseleccionoferta) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precioUnitario = precioUnitario;
		this.cantidad = cantidad;
		this.estadoseleccionoferta = estadoseleccionoferta;
	}

	public Producto(GarantiaProducto garantiaProducto, Persona persona, ProductoDestacado productoDestacado,
			String codigo, String nombre, String descripcion, BigDecimal precioUnitario, byte cantidad,
			boolean estadoseleccionoferta, String url, Set<CarritoProducto> carritoProductos,
			Set<ProductoDeseado> productoDeseados, Set<ProductoFavorito> productoFavoritos,
			Set<ImagenProducto> imagenProductos, Set<CategoriaProducto> categoriaProductos, Set<Pedido> pedidos,
			Set<OfertaProducto> ofertaProductos) {
		this.garantiaProducto = garantiaProducto;
		this.persona = persona;
		this.productoDestacado = productoDestacado;
		this.codigo = codigo;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precioUnitario = precioUnitario;
		this.cantidad = cantidad;
		this.estadoseleccionoferta = estadoseleccionoferta;
		this.url = url;
		this.carritoProductos = carritoProductos;
		this.productoDeseados = productoDeseados;
		this.productoFavoritos = productoFavoritos;
		this.imagenProductos = imagenProductos;
		this.categoriaProductos = categoriaProductos;
		this.pedidos = pedidos;
		this.ofertaProductos = ofertaProductos;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idproducto", unique = true, nullable = false)
	public Long getIdproducto() {
		return this.idproducto;
	}

	public void setIdproducto(Long idproducto) {
		this.idproducto = idproducto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idgarantiaproducto")
	public GarantiaProducto getGarantiaProducto() {
		return this.garantiaProducto;
	}

	public void setGarantiaProducto(GarantiaProducto garantiaProducto) {
		this.garantiaProducto = garantiaProducto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idpersona")
	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idproductodestacado")
	public ProductoDestacado getProductoDestacado() {
		return this.productoDestacado;
	}

	public void setProductoDestacado(ProductoDestacado productoDestacado) {
		this.productoDestacado = productoDestacado;
	}

	@Column(name = "codigo", unique = true, nullable = false, length = 20)
	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	@Column(name = "nombre", nullable = false, length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "descripcion", nullable = false, length = 65535)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "precio_unitario", nullable = false, precision = 10)
	public BigDecimal getPrecioUnitario() {
		return this.precioUnitario;
	}

	public void setPrecioUnitario(BigDecimal precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	@Column(name = "cantidad", nullable = false)
	public byte getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(byte cantidad) {
		this.cantidad = cantidad;
	}

	@Column(name = "estadoseleccionoferta", nullable = false)
	public boolean isEstadoseleccionoferta() {
		return this.estadoseleccionoferta;
	}

	public void setEstadoseleccionoferta(boolean estadoseleccionoferta) {
		this.estadoseleccionoferta = estadoseleccionoferta;
	}

	@Column(name = "url", length = 300)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<CarritoProducto> getCarritoProductos() {
		return this.carritoProductos;
	}

	public void setCarritoProductos(Set<CarritoProducto> carritoProductos) {
		this.carritoProductos = carritoProductos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<ProductoDeseado> getProductoDeseados() {
		return this.productoDeseados;
	}

	public void setProductoDeseados(Set<ProductoDeseado> productoDeseados) {
		this.productoDeseados = productoDeseados;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<ProductoFavorito> getProductoFavoritos() {
		return this.productoFavoritos;
	}

	public void setProductoFavoritos(Set<ProductoFavorito> productoFavoritos) {
		this.productoFavoritos = productoFavoritos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<ImagenProducto> getImagenProductos() {
		return this.imagenProductos;
	}

	public void setImagenProductos(Set<ImagenProducto> imagenProductos) {
		this.imagenProductos = imagenProductos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<CategoriaProducto> getCategoriaProductos() {
		return this.categoriaProductos;
	}

	public void setCategoriaProductos(Set<CategoriaProducto> categoriaProductos) {
		this.categoriaProductos = categoriaProductos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<Pedido> getPedidos() {
		return this.pedidos;
	}

	public void setPedidos(Set<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	public Set<OfertaProducto> getOfertaProductos() {
		return this.ofertaProductos;
	}

	public void setOfertaProductos(Set<OfertaProducto> ofertaProductos) {
		this.ofertaProductos = ofertaProductos;
	}

}
