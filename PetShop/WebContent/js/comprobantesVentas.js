/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
	var lineas = d.lineasList;
	var html='<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
		'<tr>'+
			'<th> </th>'+
			'<th>ID</th>'+
			'<th>PRODUCTO</th>'+
			'<th>PRESENTACION</th>'+
			'<th>CANTIDAD</th>'+
			'<th>PRECIO</th>'+
			'<th>SUBTOTAL</th>'+
		'</tr>'
	
	lineas.forEach(function(obj) { 
		html+='<tr>'+
				'<td> </td>'+
        		'<td>'+obj.idLineaVenta+'</td>'+
        		'<td>'+obj.producto.nombre+'</td>'+
        		'<td>'+obj.producto.presentacion+'</td>'+
        		'<td>'+obj.cantidad+'</td>'+
        		'<td>'+obj.precioUnitario+'</td>'+
        		'<td>'+obj.cantidad*obj.precioUnitario+'</td>'+
        		'</tr>'
        		});
	html+='</table>';
    return html;
};
	

$(document).ready(function() {
		
	  var table = $('#dataTable').DataTable( {
	        "ajax":  {
	            "url": "VentasDatatable",
	            "method": "POST",
	            "contentType": "application/json",
	            "dataSrc": function ( json ) { return json; }
	          	},
	        searching : false,
	        dom: '<"top"l>rt<"bottom"Bp><"clear">',
	        buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ],
	        "columns" : [
	            { "data": "ventaList.idVenta" },
	            { "data": "ventaList.usuario.nombre" },
	            { "data": "ventaList.usuario.apellido" },
	            { "data": "ventaList.usuario.direccion" },
	            { "data": "ventaList.fecha" },
	            { "data": "ventaList.estado" },
	            { "data": "ventaList.medioPago.tipo" },
	            { "data": "ventaList.total" },
	            {
	                "className":      'details-control',
	                "orderable":      false,
	                "data":           null,
	                "defaultContent": '<span id="btnAmpliar" class="fa fa-plus"></span>'
	            }
	            ],
	        "order": [[0, 'asc']]
	    })
	
	
    // Add event listener for opening and closing details
    $('#dataTable tbody').on('click', 'td.details-control', function () {
        
    	var tr = $(this).closest('tr');
        var row = table.row( tr );
        
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    } );
});