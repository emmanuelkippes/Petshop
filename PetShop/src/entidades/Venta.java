package entidades;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Venta implements Serializable{
	private int idVenta;
	private Double total;
	private String estado;
	private Date fecha;
	private String datosOpcionales;
	private Boolean envioDom;
	private String domicilio;
	private Usuario usuario;
	private MedioPago medioPago;
	private Tarjeta tarjeta;
	private Cuotas cuotas;
	private ArrayList<LineaVenta> lineas;
	
	
	public int getIdVenta() {
		return idVenta;
	}
	public void setIdVenta(int idVenta) {
		this.idVenta = idVenta;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getDatosOpcionales() {
		return datosOpcionales;
	}
	public void setDatosOpcionales(String datosOpcionales) {
		this.datosOpcionales = datosOpcionales;
	}
	public Boolean getEnvioDom() {
		return envioDom;
	}
	public void setEnvioDom(Boolean envioDom) {
		this.envioDom = envioDom;
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public MedioPago getMedioPago() {
		return medioPago;
	}
	public void setMedioPago(MedioPago medioPago) {
		this.medioPago = medioPago;
	}
	public Tarjeta getTarjeta() {
		return tarjeta;
	}
	public void setTarjeta(Tarjeta tarjeta) {
		this.tarjeta = tarjeta;
	}
	public Cuotas getCuotas() {
		return cuotas;
	}
	public void setCuotas(Cuotas cuotas) {
		this.cuotas = cuotas;
	}
	public ArrayList<LineaVenta> getLineas() {
		return lineas;
	}
	public void setLineas(ArrayList<LineaVenta> lineas) {
		this.lineas = lineas;
	}
}
