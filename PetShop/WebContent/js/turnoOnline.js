/**
 * 
 *//**
 * 
 */
function validarDatosTurno(){
	
	var resultado = false;
	
	
	var validaServicio=false;
	if($('#servicio').val()!="servicio"){
		validaServicio=true;
	}
	
	var validaFecha =false;
	if($('#fechaSeleccionada').val()!=""){
		validaFecha=true;
	}
	var validaHorario =false;
	if($('#horario').val()!="horario"){
		validaHorario=true;
	}
	
	var validaRepetir = false;
	if($('#repetir').is(':checked')){	
		var opcionElegida=$('input[name=opcion]:checked').val();
		if (opcionElegida == "Semanal" || opcionElegida == "Quincenal" || opcionElegida == "Mensual" ){
			validaRepetir=true;
		};
	}else{
		validaRepetir=true;
	}
		
	var validaMascota = false;
	if($('#mascota').val()!="mascota"){
		validaMascota = true;
	}
	
	
	if(validaMascota){
		if(validaServicio){
			if(validaFecha){
				if(validaHorario){
					if(validaRepetir){
						
								resultado = true;
											
						
				
					}else{alertError("Por favor revis\u00e1 los datos ingresados"");
						$("<small class='form-text text-danger' id='completarfrecuencia'>Debes seleccionar una frecuencia de repeticion</small>").insertAfter("#repetirRadioGroup");
						$('#repetirRadioGroup').addClass("con-error");}
			
				}else{alertError("Por favor revis\u00e1 los datos ingresados"");
					$("<small class='form-text text-danger' id='completarhorario'>Debes seleccionar un horario disponible</small>").insertAfter("#horario");
					$('#horarioGroup').addClass("has-error");}
				
			}else{alertError("Por favor revis\u00e1 los datos ingresados"");
				$("<small class='form-text text-danger' id='completarfecha'>Debes seleccionar una fecha para el turno</small>").insertAfter("#fechaSeleccionada");
				$('#fechaGroup').addClass("has-error");}
			
		}else{alertError("Por favor revis\u00e1 los datos ingresados"");
			$("<small class='form-text text-danger' id='completarservicio'>Debes seleccionar un tipo de servicio</small>").insertAfter("#servicio");
			$('#servicioGroup').addClass("has-error");}
		
	}else{alertError("Por favor revis\u00e1 los datos ingresados"");
		$("<small class='form-text text-danger' id='completarmascota'>Debes seleccionar una de tus mascotas</small>").insertAfter("#mascota");
		$('#mascotaGroup').addClass("has-error");}
		
return resultado;
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





$(document).ready(function() {
		
		
	$("#servicio").change(function(){
		$('#completarservicio').remove();
		$('#servicioGroup').removeClass("has-error");
	})
	
	$("#horario").change(function(){

		$('#completarhorario').remove();
		$('#horarioGroup').removeClass("has-error");
	})
	
	$("#repetir").click(function(){
		if($('#repetir').is(':checked')){
			$('#repetirRadioGroup').removeClass("hidden");
		}else{$('#repetirRadioGroup').addClass("hidden");}
	})
	
	$(".rbutton").click(function(){
		$('#completarfrecuencia').remove();
		$('#repetirRadioGroup').removeClass("con-error");		
	})
	
	$("#mascota").change(function(){
		$('#completarmascota').remove();
		$('#mascotaGroup').removeClass("has-error");
	})
	//CAPTURO el dia que se ingreso
	$("#fechaSeleccionada").change(function(){
		
		$('#fechaGroup').removeClass("has-error");
		$('#completarfecha').remove();
		var fechaSeleccionada = $('#fechaSeleccionada').val();
		if (fechaSeleccionada!=""){
			$('#horario').prop('disabled',false);
			var parametro = {fechaSeleccionada : fechaSeleccionada};
			$.post("ComboHorarios",$.param(parametro),function(responseJson){
				$('#horario').empty();
				$('#horario').append($('<option value="horario">Seleccion&aacute; un horario</option>'));
				$.each(responseJson,function(index,horarios){
					//recuperos los horarios
					$('#horario').append($('<option value="'+horarios+'">'+horarios+'</option>'));
				});
			});	
		}else{
			$('#horario').prop('disabled',true);
		}
	})	
	
	
	$('#btnContinuarAlta').click(function(e){
		e.preventDefault();
		var servicio="";
		var fecha="";
		var horario ="";
		var idUsuario=0;
		var idMascota=0;
		var conRetiro=false;
		var repeticion="No";
		var resultado = false;
		
		var validaServicio=false;
		if($('#servicio').val()!="servicio"){
			validaServicio=true;
			servicio=$('#servicio').val();
		}
		
		conRetiro = $('#conRetiro').is(':checked');
		
		var validaFecha =false;
		if($('#fechaSeleccionada').val()!=""){
			validaFecha=true;
			fecha = $('#fechaSeleccionada').val();
		}
		var validaHorario =false;
		if($('#horario').val()!="horario"){
			validaHorario=true;
			horario = $('#horario').val();
		}
		
		var validaRepetir = false;
		if($('#repetir').is(':checked')){	
			var opcionElegida=$('input[name=opcion]:checked').val();
			if (opcionElegida == "Semanal" || opcionElegida == "Quincenal" || opcionElegida == "Mensual" ){
				validaRepetir=true;
				repeticion = $('input[name=opcion]:checked').val();
			};
		}else{
			validaRepetir=true;
		}
		
		var validaMascota = false;
		if($('#mascota').val()!="mascota"){
			validaMascota = true;
			idMascota = $('#mascota').val();
		}
		var observaciones = $('#observaciones').val();
		
		var resultado = validarDatosTurno();
		if(resultado){
					//////////////////////PROCESAR TURNO///////////////////////////////
				
			var parametro = {
					servicio : servicio,
					fecha : fecha,
					horario : horario,
					repeticion : repeticion,
					idUsuario : idUsuario,
					idMascota : idMascota,
					conRetiro : conRetiro,
					observaciones : observaciones
					}
			var parametros = JSON.stringify(parametro);
			//alertError(parametros);
			$.ajax({
				type : "post",
				url : "CargarDatosTurnoOnline",
				data : {jsonData : parametros},
				success : function(respuesta){
					//alertError(respuesta);
					if (respuesta==1){
						$(location).attr('href',"TurnoOnlinePaso2");
					}
					if (respuesta == 2){
						$('#fechaGroup').addClass("has-error");
						$("<small class='form-text text-danger' id='completarfecha'>La fecha ingresada no es valida</small>").insertAfter("#fechaSeleccionada");
						alertError("La fecha ingresada debe ser igual o posterior al dia actual")
					}else{
						alertError("Error al cargar los datos, contacta a un administrador")
					}
					
					
				}
			}); 
		
		}
	})
	
	$('#btnConfirmarTurno').click(function(e){
		e.preventDefault();

		//alertError(parametros);
		$.ajax({
			type : "post",
			url : "ProcesarTurnoOnline",
			success : function(respuesta){
				//alertError(respuesta);		//NO DETIENE LA EJECUCION POR LO QUE NO SE MUESTRA
				if (respuesta == 1){
					swal ( {
						  title : "Bien hecho!", 
						  text : "Turno creado Exitosamente", 
						  icon : "success" , 
						  buttons: {
							    cancel: false,
							    confirm: true,
							  },
						} )
						
					 .then((willDelete) => {
						  if (willDelete) {
							  $(location).attr('href','TurnoOnline');
						  } else {
							  alertError("No se pudo mostrar el popUp");
						  }
						});
				
				}					
				else{
				
					alertError("Error al cargar el turno");
				}
			}
		}); 
	})
	
	
})