/**
 * 
 */

function agregarProductoVenta(idProducto,nombre,presentacion,precio,cantidad){
	
		var filas = $(".tablaVentaActual tr"); //OBTENGO UN ARREGLO DE LAS FILAS DE LA TABLA
		var bandera = false;
		//RECORRO LA TABLA 	VERIFICANDO QUE NO ESTE AGREGADO EL PRODUCTO
		$.each(filas,function(i,fila){
			if (i>0){
				if (fila.cells[0].innerHTML==idProducto){
					bandera=true;
					alert("Este elemento ya esta en la venta");
				}
			}			
		})
		
		if (!bandera){
			//AGREGA EL PRODUCTO A LA TABLA DE VENTA SI SE INGRESO UNA CANTIDAD
			if (cantidad.length != 0){
				$('<tr>',{
					'html' : "<td id='idProducto'>"+idProducto+"</td>" +
					"			<td id='nombreProducto'>"+nombre+"</td>" +
					"			<td id='presentacionProducto'>"+presentacion+"</td>" +
					"			<td id='precioProducto'>"+precio+"</td>" +
					"			<td id='cantidadProducto'>"+cantidad+"</td>" +
					"			<td class='col-sm-3 col-lg-2'>" +
					"				<div class='input-group'>" +
					"					<a class='btn btn-danger btnEliminarProductoVenta' href='\'>Quitar</a>" +
					"				</div>" +
					"			</td>"
					}).appendTo(".tablaVentaActual > tbody");
				
				
				var subtotal = parseFloat($("#subtotal").val());
				
				subtotal += ((cantidad*1)*(precio*1));
				
				$("#subtotal").val(subtotal);

			}else{
				alert("Para agregar un producto debes ingresar la cantidad");
			}
		}
	}

function buscarProductosVenta(inputProducto){

	var parametro = {
					inputProducto : inputProducto,		
					};
	$('#tabla > tbody').html("");//ELIMINO LAS FILAS DE LA TABLA QUE EXISTE EN ESTE MOMENTO
	
	$.post("buscaProductosVenta",$.param(parametro),function(responseJson){
		$.each(responseJson,function(index, productos){
			$('<tr>',{
				'html' : "<td id='idProducto'>"+productos.idProducto+"</td>" +
				"			<td id='nombreProducto'>"+productos.nombre+"</td>" +
				"			<td id='presentacionProducto'>"+productos.presentacion+"</td>" +
				"			<td id='precioProducto'>"+productos.precio+"</td>" +
				"			<td>" +
				"				<input id='cantidad' type='number' class='form-control' min='0' max="+productos.stock+"></input>" +
				"			</td>" +
				"			<td class='col-sm-3 col-lg-2'>" +
				"				<div class='input-group'>" +
				"					<a class='btn btn-info btnAgregarProductoVenta' href='\'>Agregar</a>" +
				"				</div>" +
				"			</td>"
				}).appendTo("#tabla > tbody");
			
			})
		})
	}

////////////////
$(document).ready(function() {

	//DETECTO LOS CAMBIOS EN INPUT DE FILTRAR POR NOMBRE
	$('#buscarProductosVenta').click(function(e){
		e.preventDefault();
		buscarProductosVenta($('#inputProducto').val());
	});
	
	//DETECTO EL CLICK EN BUSCAR PRODUCTOS
	$(document).on('click','.btnAgregarProductoVenta',function(e){
		e.preventDefault();
		
		var fila =$(this).parent().parent().parent()
		
		var idAgregar = fila.find('#idProducto').text();
		var nombreAgregar = fila.find('#nombreProducto').text();
		var presentacionAgregar = fila.find('#presentacionProducto').text();
		var cantidadAgregar = fila.find('#cantidad').val();
		var precioAgregar = fila.find('#precioProducto').text();
		
		var cantidadMaxima = fila.find('#cantidad').attr('max');
		
		if (parseInt(cantidadAgregar) <= parseInt(cantidadMaxima)){ //VALIDO QUE NO SE EXCEDA DEL STOCK DISPONIBLE
			if(cantidadAgregar>0){		//VALIDO QUE LA CANTIDAD A AGREGAR NO SEA 0
				agregarProductoVenta(idAgregar,nombreAgregar,presentacionAgregar,precioAgregar,cantidadAgregar);
			}else{
				alert("La cantidad ingresada debe ser mayor a 0 unidades")
			}
			
		}else{
			alert("El stock disponible de "+nombreAgregar+", "+presentacionAgregar+" es: "+cantidadMaxima+" unidades. Seleccion\u00e1 una cantidad menor.");
		}
		
		// Mostrar todos los campos
		//alert("id: "+idAgregar+" \n nombre: "+nombreAgregar+" \n presentacion: "+presentacionAgregar+" \n cantidad: "+cantidadAgregar+" \n precio: "+precioAgregar)
	});
	
	//CAPTURO EL CLICK EN QUITAR PRODUCTO DE LA VENTA
	$(document).on('click','.btnEliminarProductoVenta',function(e){
		e.preventDefault();
		
		//OBTENGO LA FILA DE LA CUAL ESTA EL BOTON QUITAR
		var fila =$(this).parent().parent().parent()
		//OBTENGO EL SUBTOTAL ACTUAL
		var subtotal = parseFloat($("#subtotal").val());
		
		//OBTENGO PRECIO Y CANTIDAD DEL PRODUCTO A BORRAR
		var precio = fila.find("#precioProducto").text();
		var cantidad = fila.find("#cantidadProducto").text();
		
		//RESTO AL SUBTOTAL EL IMPORTE CALCULADO
		subtotal -= ((precio*1)*(cantidad*1));
		
		$("#subtotal").val(subtotal);
		
		fila.remove();
		});
	
	//CAPTURO EL CLICK EN CONTINUAR (VENTA PASO 1)
	$(document).on('click','#btnContinuar',function(e){
		e.preventDefault();
		
	
		var filas = $(".tablaVentaActual tr"); //OBTENGO UN ARREGLO DE LAS FILAS DE LA TABLA
		if (filas.length == 1){
			alert("No seleccionaste ningun producto");
		}else{
			var arregloProductos = [];
			$.each(filas,function(i,fila){
				if(i>0){
					//OBTENGO DE CADA ARTICULO EL ID Y LA CANTIDAD A COMPRAR
					var idProducto = fila.cells[0].innerHTML;
					var cantidad = fila.cells[4].innerHTML;
					var elemento = {idProducto,cantidad};
					arregloProductos.push(elemento); //AGREGO EL ELEMENTO Y SU CANTIDAD AL ARREGLO DE ELEMENTOS
					}
				})
			var parametro = JSON.stringify(arregloProductos);
			
				alert(parametro);
			$.ajax({
				type : "post",
				url : "CargarProductosVenta",
				data : {jsonData : parametro},
				success : function(respuesta){
					//alert(respuesta);
					$(location).attr('href',"VentasPaso2");
					
				}
					
				})
			}
		 })
		 
	//CAPTURO EL CAMBIO DEL COMBO DE MEDIO DE PAGO
		 
	$("select[name=medioPago]").change(function(){
		
		var idMedioPago = $('#medioPago').val();
		
		switch(idMedioPago){
		
		case "seleccione un medio":
			$('#tarjeta').prop('disabled',true);
			$('#cuotasGroup').hide();
			$('#tarjetaGroup').hide();
			break;
		case "1":
			//Codigo 1 es efectivo
			$('#tarjeta').prop('disabled',true);
			$('#tarjetaGroup').hide();
			$('#cuotasGroup').hide();
			break;
		case "2":
			//Codigo 2 es Debito
			$('#tarjetaGroup').removeClass("hidden");
			$('#tarjetaGroup').show();
			$('#cuotasGroup').hide();
			$('#tarjeta').prop('disabled',false);
			
			var parametro = {idMedioPago : idMedioPago};
			$.post("ComboTarjetas",$.param(parametro),function(responseJson){
				$('#tarjeta').empty();
				$('#tarjeta').append($('<option value="tarjeta">Seleccion&aacute; una tarjeta</option>'));
				$.each(responseJson,function(index, tarjeta){
					$('#tarjeta').append($('<option value="'+tarjeta.idTarjeta+'">'+tarjeta.nombre+'</option>'));
				});
			});	
			break;
		case "3":
			//Codigo 3 es Credito
			$('#tarjetaGroup').removeClass("hidden");
			$('#cuotasGroup').removeClass("hidden");
			$('#tarjetaGroup').show();
			$('#cuotasGroup').show();
			$('#tarjeta').prop('disabled',false);
			var parametro = {idMedioPago : idMedioPago};
			$.post("ComboTarjetas",$.param(parametro),function(responseJson){
				$('#tarjeta').empty();
				$('#tarjeta').append($('<option value="tarjeta">Seleccion&aacute; una tarjeta</option>'));
				$.each(responseJson,function(index, tarjeta){
					$('#tarjeta').append($('<option value="'+tarjeta.idTarjeta+'">'+tarjeta.nombre+'</option>'));
				});
			});	
			break;		
		}
	});
	//CAPTURO LA TARJETA DE CREDITO QUE SE SELECCIONO
	$("select[name=tarjeta]").change(function(){
		
		var idMedioPago = $('#medioPago').val();
		var idTarjeta = $('#tarjeta').val();
		if (idMedioPago == 3){
			if(idTarjeta!="tarjeta"){
				$('#cuotas').prop('disabled',false);
				var parametro = {idTarjeta : idTarjeta};
				$.post("ComboCuotas",$.param(parametro),function(responseJson){
					$('#cuotas').empty();
					$('#cuotas').append($('<option value="cuotas">Cantidad de cuotas</option>'));
					$.each(responseJson,function(index, cuotas){
						var interes = parseFloat(cuotas.recargo) *100;
						$('#cuotas').append($('<option value="'+cuotas.idCuota+'">'+cuotas.cantCuotas+' - Interes: '+interes+'%</option>'));
					});
				});	
			}else{
				$('#cuotas').prop('disabled',true);
			}
			
		}
	})	
	
	
	
	//CAPTURO EL CLICK DEL BOTON BUSCAR EN EL PANEL MODAL
	$(this).on("click", "#btnBuscarCliente", function(e){
	    e.preventDefault();
		
		var inputCliente = $('#inputCliente').val();
		var parametro = {inputCliente : inputCliente};
		$.post("ComboClientes",$.param(parametro),function(responseJson){
			$('#cliente').empty();
			$('#cliente').append($('<option value="cliente">Seleccion&aacute; un cliente</option>'));
			$.each(responseJson,function(index, usuarios){
				$('#cliente').append($('<option value="'+usuarios.idUsuario+'">'+usuarios.apellido+', '+usuarios.nombre+'</option>'));
			});
		});
	}); 
	
	
	$(this).on("click", "#btnAgregarClienteSeleccionado", function(e){
	    e.preventDefault();
	    if($('#cliente').val() == "seleccione un cliente"){
			alert("no seleccionaste nada");
		}else{
			$('#buscarCliente').modal('toggle');
	        $('#btnQuitarClienteVenta').removeClass("hidden");
	        $('#btnAgregarClienteVenta').addClass("hidden");
	        $('#btnQuitarClienteVenta').show();
	        $('#btnAgregarClienteVenta').hide();
	        $('#btnQuitarClienteVenta').add();
	        $('#tablaClienteSeleccionado').removeClass("hidden");
	        
	        var idCliente = $('#cliente').val();
	        
	        parametro = {idCliente : idCliente};
	        $.post("ObtenerCliente",$.param(parametro),function(responseJson){
				$.each(responseJson,function(index, cliente){
					$('#idUsuario').val(cliente.idUsuario); 			
			        $('#nombreApellidoCliente').text(cliente.nombre+", "+cliente.apellido);
			        $('#telefonoCliente').text(cliente.telefono);
			        $('#direccionCliente').text(cliente.direccion);
				});
			});	   
		}
	}); 
	
	$(this).on("click", "#btnQuitarClienteVenta", function(e){
	    e.preventDefault();
	    
	    $('#btnQuitarClienteVenta').addClass("hidden");
	    $('#btnQuitarClienteVenta').hide();
	    $('#btnAgregarClienteVenta').removeClass("hidden");
	    $('#btnAgregarClienteVenta').show();
	    $('#tablaClienteSeleccionado').addClass("hidden");
	    $('#idUsuario').val("");								//borro el id del usuario
	    $('#nombreApellidoCliente').text("");
	    $('#telefonoCliente').text("");
	    $('#direccionCliente').text("");
		
	}); 
	
	//COMBO CATEGORIA DE PANEL MODAL DE LISTADO DE PRODUCTOS
	$(this).on("change", "#categoria", function(e){
	    e.preventDefault();
	    var idCategoria = $('#categoria').val();
		var parametro = {idCategoria : idCategoria };
		if(idCategoria!="categoria"){
			
			$.post("ComboSubcategoria",$.param(parametro),function(responseJson){
				$('#subcategoria').empty();
				$('#subcategoria').append($('<option value="subcategoria">Seleccion&aacute; una subcategor&iacute;a</option>'));
				$('#subcategoria').prop("disabled",false);
				$.each(responseJson,function(index, subcat){
					$('#subcategoria').append($('<option value="'+subcat.idSubcategoria+'">'+subcat.nombre+'</option>'));
				});
			});	
		}else{
			$('#subcategoria').attr('disabled',true);
			$('#subcategoria').empty();
			$('#subcategoria').append($('<option value="subcategoria">Seleccion&aacute; una subcategor&iacute;a</option>'));
		}    	
	}); 
	
	$(this).on("change", "#subcategoria", function(e){
	    e.preventDefault();
	    var idSubcategoria = $('#subcategoria').val();
	    if ($('#soloStock').is(":checked")){
	    	var soloStock = true;
	    }else{
	    	var soloStock = false;
	    }
		var parametro = {idSubcategoria : idSubcategoria,
						soloStock : soloStock
						};
		$.post("ProductosSubcategoria",$.param(parametro),function(responseJson){
			$('#tablaAgregarProducto > tbody').html("");
			$.each(responseJson,function(index, productos){
				$('<tr>',{
					'html' : "<td id='idProducto'>"+productos.idProducto+"</td>" +
					"			<td id='nombreProducto'>"+productos.nombre+"</td>" +
					"			<td id='presentacionProducto'>"+productos.presentacion+"</td>" +
					"			<td id='precioProducto'>"+productos.precio+"</td>" +
					"			<td>" +
					"				<input id='cantidad' type='number' class='form-control' min='0' max="+productos.stock+"></input>" +
					"			</td>" +
					"			<td class='col-sm-3 col-lg-2'>" +
					"				<div class='input-group'>" +
					"					<a class='btn btn-info btnAgregarProductoVenta' href='\'><span class='glyphicon glyphicon-plus'></span> Agregar</a>" +
					"				</div>" +
					"			</td>"
					}).appendTo('#tablaAgregarProducto > tbody');
				
			})
		})
	})
	$(this).on("change", "#soloStock", function(e){
	    e.preventDefault();
	    
	    var idSubcategoria = $('#subcategoria').val();
	    if(idSubcategoria!="subcategoria"){
	    	 if ($('#soloStock').is(":checked")){
	 	    	var soloStock = true;
	 	    }else{
	 	    	var soloStock = false;
	 	    }
	 		var parametro = {idSubcategoria : idSubcategoria,
	 						soloStock : soloStock
	 						};
	 		$.post("ProductosSubcategoria",$.param(parametro),function(responseJson){
	 			$('#tablaAgregarProducto > tbody').html("");
	 			$.each(responseJson,function(index, productos){
	 				$('<tr>',{
	 					'html' : "<td id='idProducto'>"+productos.idProducto+"</td>" +
	 					"			<td id='nombreProducto'>"+productos.nombre+"</td>" +
	 					"			<td id='presentacionProducto'>"+productos.presentacion+"</td>" +
	 					"			<td id='precioProducto'>"+productos.precio+"</td>" +
	 					"			<td>" +
	 					"				<input id='cantidad' type='number' class='form-control' min='0' max="+productos.stock+"></input>" +
	 					"			</td>" +
	 					"			<td class='col-sm-3 col-lg-2'>" +
	 					"				<div class='input-group'>" +
	 					"					<a class='btn btn-info btnAgregarProductoVenta' href='\'><span class='glyphicon glyphicon-plus'></span> Agregar</a>" +
	 					"				</div>" +
	 					"			</td>"
	 					}).appendTo('#tablaAgregarProducto > tbody');
	 			})
	 		})
	    }
	})

	
	$(document).on("click", "#confirmarVenta", function(e){
	    e.preventDefault();
	    /*
	    var filas = $(".tablaVentaActual tr"); //OBTENGO UN ARREGLO DE LAS FILAS DE LA TABLA
		var arregloProductos = [];
		$.each(filas,function(i,fila){
			if(i>0){
				//OBTENGO DE CADA ARTICULO EL ID Y LA CANTIDAD A COMPRAR
				var idProducto = fila.cells[0].innerHTML;
				var cantidad = fila.cells[4].innerHTML;
				var elemento = {idProducto,cantidad};
				arregloProductos.push(elemento); //AGREGO EL ELEMENTO Y SU CANTIDAD AL ARREGLO DE ELEMENTOS
				}
			})*/

		var tarjeta ="0";
		var cuotas ="0";
		var medioPago ="0";
		
		//VALIDACION DE MEDIO DE PAGO
		if(!($('#medioPago').val()=="seleccione un medio")){		
			medioPago = $('#medioPago').val();				//GUARDO EL MEDIO DE PAGO
			switch (medioPago){
			
			case "1":
				
				break;
			case "2":
			case "3":
				if($('#tarjeta').val()=="tarjeta"){
					alert("Debes seleccionar una tarjeta");
				}else{
					tarjeta = $('#tarjeta').val();
					if ($('#cuotas').val() == "cuotas"){
						alert("Debes seleccionar un plan de cuotas")
					}else{
						cuotas = $('#cuotas').val();
					}
				}
				break;
			}
		}else{alert("Debes seleccionar un medio de pago para continuar");}
		if (cuotas == null){
			cuotas="0";
		}
		
		//VALIDACION DE USUARIO
		var idUsuario ="0";
		if (!($('#idUsuario').val()=="")){
			idUsuario = $('#idUsuario').val();
		};
		
		//RECUPERO OBSERVACIONES
		
		var observaciones = $('#observaciones').val();
		var parametro = {
						medioPago : medioPago,
						tarjeta : tarjeta,
						cuotas : cuotas,
						idUsuario : idUsuario,
						observaciones : observaciones
						}
		var parametros = JSON.stringify(parametro);
		alert(parametros);
		$.ajax({
			type : "post",
			url : "ProcesarVenta",
			data : {jsonData : parametros},
			success : function(respuesta){
				//alert(respuesta);
				$(location).attr('href',"#");
				
			}
		}); 
	})
})
