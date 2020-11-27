package pe.edu.unsch.entities;
// Generated 26/11/2020 11:03:24 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Pedido generated by hbm2java
 */
@Entity
@Table(name = "pedido", catalog = "marketplacebd", uniqueConstraints = @UniqueConstraint(columnNames = "codigo"))
public class Pedido implements java.io.Serializable {

	private Long idpedido;
	private Factura factura;
	private Pago pago;
	private Persona persona;
	private Producto producto;
	private Seguimiento seguimiento;
	private String codigo;
	private Date fecha;
	private String direccionEntrega;
	private int cantidadProducto;
	private byte estadoPedido;
	private float precioProducto;
	private Float precioOfertado;
	private float descuentoProducto;
	private Set<Comentario> comentarios = new HashSet<Comentario>(0);

	public Pedido() {
	}

	public Pedido(String codigo, Date fecha, String direccionEntrega, int cantidadProducto, byte estadoPedido,
			float precioProducto, float descuentoProducto) {
		this.codigo = codigo;
		this.fecha = fecha;
		this.direccionEntrega = direccionEntrega;
		this.cantidadProducto = cantidadProducto;
		this.estadoPedido = estadoPedido;
		this.precioProducto = precioProducto;
		this.descuentoProducto = descuentoProducto;
	}

	public Pedido(Factura factura, Pago pago, Persona persona, Producto producto, Seguimiento seguimiento,
			String codigo, Date fecha, String direccionEntrega, int cantidadProducto, byte estadoPedido,
			float precioProducto, Float precioOfertado, float descuentoProducto, Set<Comentario> comentarios) {
		this.factura = factura;
		this.pago = pago;
		this.persona = persona;
		this.producto = producto;
		this.seguimiento = seguimiento;
		this.codigo = codigo;
		this.fecha = fecha;
		this.direccionEntrega = direccionEntrega;
		this.cantidadProducto = cantidadProducto;
		this.estadoPedido = estadoPedido;
		this.precioProducto = precioProducto;
		this.precioOfertado = precioOfertado;
		this.descuentoProducto = descuentoProducto;
		this.comentarios = comentarios;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idpedido", unique = true, nullable = false)
	public Long getIdpedido() {
		return this.idpedido;
	}

	public void setIdpedido(Long idpedido) {
		this.idpedido = idpedido;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idfactura")
	public Factura getFactura() {
		return this.factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idpago")
	public Pago getPago() {
		return this.pago;
	}

	public void setPago(Pago pago) {
		this.pago = pago;
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
	@JoinColumn(name = "idproducto")
	public Producto getProducto() {
		return this.producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idseguimiento")
	public Seguimiento getSeguimiento() {
		return this.seguimiento;
	}

	public void setSeguimiento(Seguimiento seguimiento) {
		this.seguimiento = seguimiento;
	}

	@Column(name = "codigo", unique = true, nullable = false, length = 20)
	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha", nullable = false, length = 19)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "direccion_entrega", nullable = false, length = 50)
	public String getDireccionEntrega() {
		return this.direccionEntrega;
	}

	public void setDireccionEntrega(String direccionEntrega) {
		this.direccionEntrega = direccionEntrega;
	}

	@Column(name = "cantidad_producto", nullable = false)
	public int getCantidadProducto() {
		return this.cantidadProducto;
	}

	public void setCantidadProducto(int cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}

	@Column(name = "estado_pedido", nullable = false)
	public byte getEstadoPedido() {
		return this.estadoPedido;
	}

	public void setEstadoPedido(byte estadoPedido) {
		this.estadoPedido = estadoPedido;
	}

	@Column(name = "precio_producto", nullable = false, precision = 12, scale = 0)
	public float getPrecioProducto() {
		return this.precioProducto;
	}

	public void setPrecioProducto(float precioProducto) {
		this.precioProducto = precioProducto;
	}

	@Column(name = "precio_ofertado", precision = 12, scale = 0)
	public Float getPrecioOfertado() {
		return this.precioOfertado;
	}

	public void setPrecioOfertado(Float precioOfertado) {
		this.precioOfertado = precioOfertado;
	}

	@Column(name = "descuento_producto", nullable = false, precision = 12, scale = 0)
	public float getDescuentoProducto() {
		return this.descuentoProducto;
	}

	public void setDescuentoProducto(float descuentoProducto) {
		this.descuentoProducto = descuentoProducto;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pedido")
	public Set<Comentario> getComentarios() {
		return this.comentarios;
	}

	public void setComentarios(Set<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

}
