package logica;

import entidades.Mascota;
import entidades.Usuario;

import java.io.Serializable;
import java.util.ArrayList;

import datos.DatosUsuario;


public class ControladorDeUsuario implements Serializable{
	private DatosUsuario baseUsuario = new DatosUsuario();
	private ControladorDeMascota ctrlMasco = new ControladorDeMascota();
	
	//METODOS IMPLEMENTADOS
	
	//			GETUSUARIO
	//			AGREGARUSUARIO
	//			MODIFICARUSUARIO
	//			ELIMINARUSUARIO
	//			GETUSUARIOSLIKE (RECIBE UN STRING)
	//			COMPLETAR LOS DATOS DEL USUARIO
	//			BLANQUEAR USUARIO POR MAIL
	//			VERIFICAR SI EXISTE MAIL
	
	public Usuario obtenerUsuario(Usuario user) throws Exception
	{
		return baseUsuario.obtenerUsuario(user);
	}
	
	public Usuario obtenerUsuarioHabilitado(Usuario user) throws Exception
	{
		return baseUsuario.obtenerUsuarioHabilitado(user);
	}
	
	public Usuario agregarUsuario(Usuario user) throws Exception{
		return baseUsuario.agregarUsuario(user);
	}
	
	public Usuario modificarUsuario(Usuario user) throws Exception{
		return baseUsuario.modificarUsuario(user);
	}
	
	public boolean eliminarUsuario(Usuario user) throws Exception{
		return baseUsuario.eliminarUsuario(user);
	}
	
	public ArrayList<Usuario> getUsuariosLike(String inputUsuario) throws Exception{
		return baseUsuario.getUsuariosLike(inputUsuario);
	}
	public Usuario getUsuario(Usuario user) throws Exception
	{
		Usuario usu = new Usuario();
		usu = baseUsuario.getUsuario(user);
		usu.setMascotas(ctrlMasco.getMascotas(usu));
		return usu;
	}
	public boolean blanquearUsuario(String email,String nuevoUsuario, String nuevoPass) throws Exception{
		return baseUsuario.blanquearUsuario(email,nuevoUsuario,nuevoPass);
	}

	public ArrayList<Usuario> getTodosUsuariosLike(String inputCliente) throws Exception {
		return baseUsuario.getTodosUsuariosLike(inputCliente);
	}

	public Boolean validarEmail(String email) throws Exception {
		return baseUsuario.validarEmail(email);
		
	}
}
