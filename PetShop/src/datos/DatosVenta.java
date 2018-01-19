package datos;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Categoria;
import entidades.MedioPago;
import entidades.Producto;
import entidades.Subcategoria;
import entidades.Tarjeta;
import entidades.Venta;
import logica.ControladorDeVenta;
import utilidades.ExcepcionEspecial;

public class DatosVenta implements Serializable{
	
	//METODOS IMPLEMENTADOS:
	//						AGREGAR VENTA
	//						MODIFICAR VENTA
	//						GET TARJETA
	//						GET MEDIO DE PAGO (COMPLETAR DATOS)
	//						GET MEDIOS DE PAGO
	
	public void agregarVenta (Venta venta) throws Exception
	{
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			pstm = FactoryConnection.getinstancia().getConn().prepareStatement(
					"INSERT INTO venta(idVenta,idUsuario,idMedioPago,total,estado,fecha,datosOpcionales,envioDom,domicilio) VALUES (?,?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			pstm.setInt(1, venta.getIdVenta());
			pstm.setInt(2, venta.getUsuario().getIdUsuario());
			pstm.setInt(3, venta.getMedioPago().getIdMedioPago());
			pstm.setDouble(4, venta.getTotal());
			pstm.setString(5, venta.getEstado());
			pstm.setDate(6, venta.getFecha());
			pstm.setString(7, venta.getDatosOpcionales());
			pstm.setBoolean(8, venta.getEnvioDom());
			pstm.setString(9, venta.getDomicilio());
			pstm.executeUpdate();
			rs=pstm.getGeneratedKeys();
			if(rs!=null && rs.next()){
				venta.setIdVenta(rs.getInt(1));
			}
		} catch (Exception e) {
			
			throw e;
		}
		
		try {
			if(rs!=null)rs.close();
			if(pstm!=null)pstm.close();
			FactoryConnection.getinstancia().releaseConn();
		} catch (Exception e) {
			throw e;
		}
		
	}
	public void modificarVenta(Venta venta) throws Exception
	{
		PreparedStatement pstm = null;
				
		try {
			pstm = FactoryConnection.getinstancia().getConn().prepareStatement(
					"UPDATE usuario SET idUsuario=?,idMedioPago=?,total=?,estado=?,fecha=?,datosOpcionales=?,envioDom=?,domicilio=? WHERE idVenta=?");	
			pstm.setInt(1, venta.getUsuario().getIdUsuario());
			pstm.setInt(2, venta.getMedioPago().getIdMedioPago());
			pstm.setDouble(3, venta.getTotal());
			pstm.setString(4, venta.getEstado());
			pstm.setDate(5, venta.getFecha());
			pstm.setString(6, venta.getDatosOpcionales());
			pstm.setBoolean(7, venta.getEnvioDom());
			pstm.setString(8, venta.getDomicilio());
			pstm.setInt(9, venta.getIdVenta());
			pstm.executeUpdate();
		} 
		catch (Exception e) 
		{
			throw e;
		}
		
		finally
		{
			try {
				if(pstm!=null)pstm.close();
				FactoryConnection.getinstancia().releaseConn();
			} catch (Exception e) {
				throw e;
			}	
		}
		
	}
	public Tarjeta getTarjeta(Tarjeta tarjeta)throws Exception{
			
			PreparedStatement pstm = null;
			ResultSet rs = null;
			Tarjeta tarjetaActual = new Tarjeta();
			ControladorDeVenta ctrlVenta = new ControladorDeVenta();
			
			try {
				pstm = FactoryConnection.getinstancia().getConn().prepareStatement(
						"SELECT * FROM Tarjeta where idTarjeta =?");
				pstm.setInt(1, tarjeta.getIdTarjeta());
				rs=pstm.executeQuery();
				
				if(rs!=null)
				{
					while(rs.next())
					{
						tarjetaActual.setIdTarjeta(rs.getInt("idTarjeta"));				//SETEO ID TARJETA
						tarjetaActual.setNombre(rs.getString("nombre"));				//SETEO NOMBRE DE LA TARJETA
						MedioPago medioPago = new MedioPago();
						medioPago.setIdMedioPago(rs.getInt("idMedioPago"));
						medioPago = ctrlVenta.getMedioPago(medioPago);
					}
				}
			} catch (Exception e) {
				throw e;
			}
			
			try {
				if(rs!=null)rs.close();
				if(pstm!=null)pstm.close();
				FactoryConnection.getinstancia().releaseConn();
			} 
			catch (Exception e) {
				throw e;
			}
			return tarjetaActual;
		
	}
	
	public MedioPago getMedioPago(MedioPago medioPago)throws Exception{
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MedioPago medioPagoActual = new MedioPago();
		
		try {
			pstm = FactoryConnection.getinstancia().getConn().prepareStatement(
					"SELECT * FROM medio_pago where idMedioPago =?");
			pstm.setInt(1, medioPago.getIdMedioPago());
			rs=pstm.executeQuery();
			
			if(rs!=null)
			{
				while(rs.next())
				{
					medioPagoActual.setIdMedioPago(rs.getInt("idMedioPago"));
					medioPagoActual.setTipo(rs.getString("tipo"));
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
		try {
			if(rs!=null)rs.close();
			if(pstm!=null)pstm.close();
			FactoryConnection.getinstancia().releaseConn();
		} 
		catch (Exception e) {
			throw e;
		}
		return medioPagoActual;
	
}
	
	public ArrayList<MedioPago> getMediosPago() throws ExcepcionEspecial, Exception{
		
		Statement stm=null;
		ResultSet rs=null;
		ArrayList<MedioPago> mediosPago = new ArrayList<MedioPago>();
		
		try {
			stm = FactoryConnection.getinstancia().getConn().createStatement();
			rs = stm.executeQuery("SELECT * FROM medio_pago");
					
			if(rs!=null)
			{
				while(rs.next())
				{
					MedioPago medioPagoActual=new MedioPago();
					medioPagoActual.setIdMedioPago(rs.getInt("idMedioPago"));
					medioPagoActual.setTipo(rs.getString("tipo"));
					
					mediosPago.add(medioPagoActual);
				}
			}
		}
		catch (SQLException e) {
			throw e;
		} 
		
		try {
			if(rs!=null)rs.close();
			if(stm!=null)stm.close();
			FactoryConnection.getinstancia().releaseConn();
		} catch (SQLException e) {
			throw e;
		}
		
		return mediosPago;
	}

}
