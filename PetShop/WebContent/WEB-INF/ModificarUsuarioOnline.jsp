<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Usuario"%>
<%@page import="entidades.Mascota"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<meta charset="UTF-8">
		<jsp:include page="cssGeneral.jsp" />

		<title>SGPS - Modificar cliente</title>
	</head>
	<body>
		<jsp:include page="Navbar.jsp" />
		<div class="container panel panel-default colorPanel">
			<div class="panel-body">
				<br>
				<br>	
				<h4><strong>EDITAR TU PERFIL</strong></h4>
				<hr>
				
				<div class="container-fluid">
					<form class="form" action="#" method="post" enctype="multipart/form-data" id="form_modificar_cliente">
		            	
		     			
		            	<!-- Campo de modificacion / alta -->
		            	<input type="hidden"  name="alta" id="alta" value="alta">
		            	<% 
		            	Usuario cli = ((Usuario) session.getAttribute("user")); 
		            	ArrayList<Mascota> listadoMascota = cli.getMascotas();
		            	%>
						<div class="form-group row">
							<div class="container-fluid">
								<h4><strong class="text-muted">DATOS BASICOS</strong></h4>
							</div>
							<!-- Input de idUsuario -->
			            		
							    <input type="text" class="hidden" name="idUsuario" id="idUsuario" aria-describedby="usuarioHelp" value="<%= cli.getIdUsuario() %>">

							<!-- Input de usuario -->
			            		<label class="sr-only">Usuario</label>
							    <div class="col-lg-4 col-md-12" id="usuarioGroup">
							    	<small id="usuarioHelp" class="form-text text-muted"><strong>Usuario*</strong></small>
							    	<input type="text" class="form-control" name="usuario" id="usuario" aria-describedby="usuarioHelp"  placeholder="Ingres&aacute; un nombre de usuario" value="<%= cli.getUsuarioLogin() %>">
								</div>
								
							<!-- Input de contrase�a -->
								<label class="sr-only">Contrase�a</label>
							    <div class="col-lg-4 col-md-12" id="contraseniaGroup">
							    	<small id="contraseniaHelp" class="form-text text-muted"><strong>Contrase&ntilde;a*</strong></small>
							    	<input type="password" class="form-control" name="contrasenia" id="contrasenia" aria-describedby="contraseniaHelp" placeholder="Ingres&aacute; una contrase&ntilde;a" value="<%= cli.getPassword() %>">
								</div>
								
							<!-- Input de contrase�a -->
								<label class="sr-only">Contrase�a</label>
							    <div class="col-lg-4 col-md-12" id="contraseniaRepetirGroup">
							    	<small id="contraseniaRepetirHelp" class="form-text text-muted"><strong>Repet&iacute; la contrase&ntilde;a*</strong></small>
							    	<input type="password" class="form-control" name="contraseniaRepetir" id="contraseniaRepetir" aria-describedby="contraseniaRepetirHelp" placeholder="Repet&iacute; la contrase&ntilde;a" value="<%= cli.getPassword() %>">
								</div>
						</div>
						<hr>
		            	<div class="form-group row">
		            	
		            	  	<!-- Input de nombre -->
			            		<label class="sr-only">Nombre</label>
							    <div class="col-lg-6 col-md-12" id="nombreGroup">
							    	<small id="nombreHelp" class="form-text text-muted"><strong>Nombre*</strong></small>
							    	<input type="text" class="form-control" name="nombre" id="nombre" aria-describedby="nombreHelp" placeholder="Ingres&aacute; tu nombre" value="<%= cli.getNombre() %>">
								</div>
								
							<!-- Input de apellido -->
								<label class="sr-only">Apellido</label>
							    <div class="col-lg-6 col-md-12" id="apellidoGroup">
							    	<small id="apellidoHelp" class="form-text text-muted"><strong>Apellido*</strong></small>
							    	<input type="text" class="form-control" name="apellido" id="apellido" aria-describedby="apellidoHelp" placeholder="Ingres&aacute; tu apellido" value="<%= cli.getApellido() %>">
								</div>
						</div>
						<hr>
						
						<div class="form-group row">
			            	<!-- Input de dni-->
			            		<label class="sr-only">DNI</label>
							    <div class="col-lg-6 col-md-12" id="dniGroup">
							    	<small id="precioHelp" class="form-text text-muted"><strong>Dni</strong></small>
							    	<input type="text" class="form-control" name="dni" id="dni" aria-describedby="dniHelp" placeholder="Ingres&aacute; tu dni" value="<%= cli.getDni() %>">
								</div>
								
							<!-- Input de direccion -->
								<label class="sr-only">Direcci&oacute;n</label>
							    <div class="col-lg-6 col-md-12" id="direccionGroup">
							    	<small id="direccionHelp" class="form-text text-muted"><strong>Direcci&oacute;n</strong></small>
							    	<input type="text" min="0"class="form-control" name="direccion" id="direccion" aria-describedby="direccionHelp" placeholder="Ingres&aacute; tu direcci&oacute;n" value="<%= cli.getDireccion() %>">
								</div>
						</div>
						<hr>
						
						<div class="form-group row">
							<!-- Input de telefono -->
								<label class="sr-only">Tel&eacute;fono</label>
							    <div class="col-lg-6 col-md-12" id="telefonoGroup">
							    	<small id="direccionHelp" class="form-text text-muted"><strong>Tel&eacute;fono*</strong></small>
							    	<input type="text" class="form-control" name="telefono" id="telefono" aria-describedby="telefonoHelp" placeholder="Ingres&aacute; tu tel&eacute;fono, sin guiones" value="<%= cli.getTelefono() %>">
								</div>
						     
			            	<!-- Input de email-->
			            	<%String emailUsuario = "";
			            		if(cli.getEmail()!=null){emailUsuario = cli.getEmail();};%>
			            		<label class="sr-only">Email</label>
							    <div class="col-lg-6 col-md-12" id="emailGroup">
							    	<small id="emailHelp" class="form-text text-muted"><strong>Email</strong></small>
							    	<input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Ingres&aacute; tu email" value="<%=emailUsuario %>">
								</div>
						</div>
						<hr>
						
						<div class="form-group row ">
							<div class="container-fluid">
								<h4><strong class="text-muted">TUS MASCOTAS REGISTRADAS</strong></h4>
								<br>
							</div>
							<label class="sr-only">Mascota</label>
							<div class="col-lg-3 col-md-12">
								<a href="" class="btn btn-primary form-control" id="btnAgregarMascota" data-toggle="modal"> <span class="glyphicon glyphicon-plus"></span> Agregar Mascota</a>
							</div>
								<div class="col-lg-9 col-md-12" id="MascotaGroup">	
								<%	String hidden = " hidden";
									if(!(listadoMascota.isEmpty()) || listadoMascota.size() != 0){
										hidden="";
										}%>
								<div class="table-responsive <%=hidden%>" id="tablaMascota">
   								   <table class="table table-striped table-hover active tableMas" id="tableMas">
										<thead>
											<tr>
												<th class="hidden">ID</th>
											    <th>Nombre</th>
											    <th>Tama�o</th>
											    <th>Pelaje</th>
											    <th>Fecha de Nacimiento</th>
											    <th></th>
											    <th class='hidden'></th>
											</tr>
										</thead>
  										<tbody>	
  											<%if(!(listadoMascota.isEmpty()) || listadoMascota.size() != 0)
  											{
  												for(Mascota masco : listadoMascota)
  												{					
  											%>
  												<tr>
  													<td class="hidden" id='idMascota'><%=masco.getIdMascota() %></td>
	  												<td id='nombreMascota'><%=masco.getNombre()%></td> 
													<td id='tamanio'><%=masco.getTipoMascota().getTamanio()%></td>
													<td id='pelaje'><%=masco.getTipoMascota().getPelo()%></td>
													<td id='fechaNacimiento'><%=masco.getFechaNacimiento().toString()%></td>
													<td class='col-sm-3 col-lg-2'>
														<div class='input-group'>
															<a class='btn btn-info btnModificarMascota' title='Editar mascota' href='\'><span class='fa fa-pencil'></span> </a>
														
															<a class='btn btn-danger btnQuitarMascota' title='Quitar mascota' href='\'><span class='fa fa-times'></span> </a>
														</div>
													</td>
													<td id='observacion' class='hidden'><%=masco.getObservaciones()%></td>
												</tr>
											<%	}
  											}%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<hr>
									
						<div class="form-group row">	
							<div class="col-lg-12">
								<input type="submit" id="btnModificarUsuario" value="Guardar cambios" class="col-lg-2 col-xs-12 btn btn-primary btn-lg pull-right">
							</div>
						</div>
						
						<!-- PANEL MODAL AGREGAR MASCOTA -->
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="agregarMascotaModificar">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<strong>AGREGAR MASCOTA</strong>
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<div class="form-group row container-fluid">
										<!-- Input de idMascota -->
			            		
							   					 <input type="text" class="hidden" name="idMascotaHidden" id="idMascotaHidden" aria-describedby="idMascotaHelp">
										
										
											<!-- Input de Nombre Mascota -->
												<label class="sr-only">Nombre</label>
											    <div class="col-lg-12 col-md-12" id="nombreMascotaGroup">
											    	<small id="nombreMascotaHelp" class="form-text text-muted"><strong>Nombre *</strong></small>
											    	<input type="text" class="form-control nombreMascota" name="nombreMascota" id="nombreMascota" placeholder ="Ingres&aacute; el nombre de la mascota.">
												</div>
										</div>
										<hr class="hrModal">
										<div class="form-group row">
											<div class="col-lg-6 col-md-12">	
												<div class="container-fluid">
													<h4><strong>TAMA&Ntilde;O DEL PERRO *</strong></h4>
												</div>
												<div class="container-fluid" id="patitaGroup">
													<div class="col-sm-4 centrado">
														<label class="sr-only">Perro grande</label>
														<button class="icon-button" id="btnPatitaGrande">						
															<span class="fa fa-paw" style="font-size:90px"></span>
															<p><strong class="text-center"> GRANDE </strong></p>
														</button>								
													</div>
													<div class="col-sm-4 centrado">
														<label class="sr-only">Perro mediano</label>
														<button class="icon-button" id="btnPatitaMediana">						
															<span class="fa fa-paw" style="font-size:70px;margin-top:20px"></span>
															<p><strong class="text-center"> MEDIANO </strong></p>	
														</button>			
													</div>
													<div class="col-sm-4 centrado">
														<label class="sr-only">Perro chico</label>
														<button class="icon-button" id="btnPatitaChica">						
															<span class="fa fa-paw" style="font-size:50px;margin-top:40px"></span>
															<p><strong class="text-center"> CHICO </strong></p>		
														</button>					
													</div>
												</div>
											</div>
											
											<div class="col-lg-6 col-md-12">	
												<div class="container-fluid">
													<h4><strong>PELAJE *</strong></h4>
												</div>
												<div class="container-fluid" id="pelajeGroup">
													<div class="col-sm-4 centrado">
														<label class="sr-only">Tamano del pelaje</label>
														<button class="icon-button" id="btnTijeraGrande">						
															<span class="fa fa-scissors" style="font-size:90px"></span>
															<p><strong class="text-center"> LARGO </strong></p>
														</button>								
													</div>
													<div class="col-sm-4 centrado">
														<label class="sr-only">Tamano del pelaje</label>
														<button class="icon-button"id="btnTijeraChica">						
															<span class="fa fa-scissors" style="font-size:70px;margin-top:20px"></span>
															<p><strong class="text-center"> CORTO </strong></p>
														</button>								
													</div>
												</div>
											</div>
										</div>
										<hr class="hrModal">
										<div class="form-group row container-fluid">
											<!-- Input de Fecha de Nacimiento Mascota -->
												<label class="sr-only">Fecha de Nacimiento</label>
											    <div class="col-lg-4 col-md-12" id="fechaNacimientoMascotaGroup">
											    	<small id="fechaNacimientoMascotaHelp" class="form-text text-muted"><strong>Fecha de Nacimiento *</strong></small>
											    	<input type="date" class="form-control" name="fechaNacimientoMascota" id="fechaNacimientoMascota" aria-describedby="fechaNacimientoMascotaHelp">
												</div>
												
												<!-- Input de Observaciones Mascota -->
												<label class="sr-only">Observaciones</label>
											    <div class="col-lg-8 col-md-12" id="observacionesMascotaGroup">
											    	<small id="observacionesMascotaHelp" class="form-text text-muted"><strong>Observaciones</strong></small>
											    	<textarea class="form-control" rows="5" id="observacionesMascota" placeholder="Completa con datos adicionales de la mascota de ser necesarios"></textarea>
												</div>
										</div>
										<hr class="hrModal">
										<div class="form-group row container-fluid">
											<div class="col-lg-12 col-md-12">
												<button class="col-lg-3 col-md-12 btn btn-primary pull-right btnAgregarMascotaModal" id="btnAgregarMascotaModal"><h4 class="nombreBoton"><span class="fa fa-paw"></span> Confirmar</h4></button>
											</div>
										</div>
									</div>								
								</div>
							</div>
						</div>
						
						
		            </form> 
		        </div>
		   	</div>
		</div>
			<jsp:include page="jsGeneral.jsp" />
			<script type="text/javascript" src="js/clienteOnline.js"></script>
			<script type="text/javascript" src="js/ventaOnline.js"></script>
	</body>
</html>