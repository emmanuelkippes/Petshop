package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import entidades.Usuario;
import logica.ControladorDeMascota;
import logica.ControladorDeTipoMascota;
import logica.ControladorDeUsuario;


@WebServlet({"/ValidarMail","/validarMail","/Validarmail"})
public class ValidarMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ValidarMail() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ControladorDeUsuario ctrlUsuario = new ControladorDeUsuario();
		Usuario usu = new Usuario();
		Boolean resultado = false;
	
		String json = request.getParameter("jsonData");
		JsonObject emailCliente = (JsonObject) new JsonParser().parse(json);
		
		String email = (String) emailCliente.get("email").getAsString();
		
		try {
			resultado = ctrlUsuario.validarEmail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(resultado){
			response.getWriter().println(1);
		}else {
			response.getWriter().println(0);
		}
		
	}

}
