<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<HTML lang=fr xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link href="css/en/main.css" rel="stylesheet" type="text/css">
<TITLE>AnimeCoversFan</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="alternate" type="application/rss+xml" title="RSS News" href="www.animecoversfan.com/fluxrss.xml.htm" />

<!-Hoja de estilos del calendario -->
<link rel="stylesheet" type="text/css" media="all" href="calendar-system.css" title="win2k-cold-1" />
<!-- librería principal del calendario -->
<script type="text/javascript" src="calendar.js"></script>
<!-- librería para cargar el lenguaje deseado -->
<script type="text/javascript" src="lang/calendar-es.js"></script>
<!-- librería que declara la función Calendar.setup, que ayuda a generar un calendario en unas pocas líneas de código -->
<script type="text/javascript" src="calendar-setup.js"></script>
<!-- script que define y configura el calendario-->

<script>
	  
	  function seleccionar_todo(){
	     for (i=0;i<document.formulario.elements.length;i++)
	        if(document.formulario.elements[i].type == "checkbox")
	           document.formulario.elements[i].checked=1
	  }
	
	  function deseleccionar_todo(){
	     for (i=0;i<document.formulario.elements.length;i++)
	        if(document.formulario.elements[i].type == "checkbox")
	           document.formulario.elements[i].checked=0
	  } 
	
	</script>
<script language="JavaScript">

	var ajax;
	function funcionCallback()
	{
		// Comprobamos si la peticion se ha completado (estado 4)
		if( ajax.readyState == 4 )
		{
			// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
			if( ajax.status == 200 )
			{
				// Escribimos el resultado en la pagina HTML mediante DHTML
				document.all.salidaSolicitudProducto.innerHTML = ajax.responseText;
			}
		}
	}
	function recuperaSolicitudProducto() {
		  //alert ("hola");
		  if (document.formulario.producto.value == -1) {
		    alert("Ingrese el Producto.");
		    document.formulario.producto.focus();
		    return (false);
		  }
		  if (document.formulario.cantidadproducto.value.length < 1) {
		    alert("Escriba la Cantidad del Producto.");
		    document.formulario.cantidadproducto.focus();
		    return (false);
		  }
		  
		  var checkOK = "0123456789";
		  var checkStr = document.formulario.cantidadproducto.value;
		  var allValid = true;
		  var decPoints = 0;
		  var allNum = "";
		  for (i = 0; i < checkStr.length; i++) {
		    ch = checkStr.charAt(i);
		    for (j = 0; j < checkOK.length; j++)
		      if (ch == checkOK.charAt(j))
		        break;
		    if (j == checkOK.length) {
		      allValid = false;
		      break;
		    }
		    allNum += ch;
		  }
		  if (!allValid) {
		    alert("Escriba sólo números en el campo \"Cantidad\".");
		    document.formulario.cantidadproducto.focus();
		    return (false);
		  }   
		  
		    // Creamos el control XMLHttpRequest segun el navegador en el que estemos 
			if( window.XMLHttpRequest )
				ajax = new XMLHttpRequest(); // No Internet Explorer
			else
				ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
			// Almacenamos en el control al funcion que se invocara cuando la peticion
			// cambie de estado	
			ajax.onreadystatechange = funcionCallback;
				// Enviamos la peticion
			var valor1 = document.formulario.producto.value;
		    var valor2 = document.formulario.cantidadproducto.value;
			ajax.open( "GET", "/pruebaWeb/CargarSolicitudPedido.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
			ajax.send( "" );
		
		return (true);
		}
	
function sacaSolicitudProducto() {
	    
		var aux = 0;    
		//alert ("**"+document.formulario.op.length);	
		if (document.formulario.op.length == 1){
		   alert("No hay Registros para eliminar.");
	       return (false);
	  	}
		
		if (typeof(document.formulario.op.length) != "undefined"){
			for (j=0;j<document.formulario.op.length;j++){
	       		if (document.formulario.op[j].checked){
		   	  		aux = 1;	
	          		break;
	    		}
			}
		}else{
			if (document.formulario.op.checked){
			    aux = 1;
			}
		}
		if (aux == 0 ){ 
	    	alert("Seleccione un Registro.");
	    	return (false);
	  	}
		
		
		
		arrayproducto = new Array();
		var i = 0;
		//alert (document.formulario.op.length);
		if (typeof(document.formulario.op.length) != "undefined"){
			//alert (document.formulario.op.length);
			for (j=0;j<document.formulario.op.length;j++){
			     if (document.formulario.op[j].checked == true ){
	        		//alert ("mas");
	                arrayproducto[i] = document.formulario.op[j].value;
				    i++;
				 } 
			}
		}else{
		    //alert (document.formulario.op.value);
	        //alert ("uno");
			arrayproducto[0] = document.formulario.op.value; 
		}
		
		// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
		if( window.XMLHttpRequest )
			ajax = new XMLHttpRequest(); // No Internet Explorer
		else
			ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
		// Almacenamos en el control al funcion que se invocara cuando la peticion
		// cambie de estado	
		ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
		
		var valor1 = arrayproducto.toString();
		var valor1 = "-1,"+valor1;
		var valor2 = arrayproducto.length;
		//alert (valor1);
		//alert (valor2);
		//alert ("hola2");
		//alert (valor3);
		
		//alert (array.length);
		//var valor1 = document.formulario.cantidaddetallepedido.value;
		//var valor2 = document.formulario.cantidadproducto.value;
		
		//ajax.open( "GET", "/prueba/jsp/SacarDetallePedido.jsp?cantidaddetallepedido="+valor1+"&cantidadproducto="+valor2, true );
		ajax.open( "GET", "/pruebaWeb/SacarSolicitudPedido.jsp?eliminar="+valor1+"&largoeliminar="+valor2, true );
		ajax.send( "" );
	
	return (true)
	}
	</script>
	
	<script>
	
	function ValidaEntrada() {
	  
	  /*if (document.formulario.producto.value == -1) {
	    alert("Ingrese el Producto.");
	    document.formulario.producto.focus();
		return (false);
	  }
	  
	  if (document.formulario.cantidadproducto.value.length < 1) {
	    alert("Ingrese la cantidad del Producto.");
	    document.formulario.cantidadproducto.focus();
		return (false);
	  }*/
	  
		if (document.formulario.nombreConfirmacion.value == "") {
		    alert("Escriba nombre del cliente para la confirmación.");
		    document.formulario.nombreConfirmacion.focus();
			return (false);
		}
	  
	  	if (document.formulario.apellidoConfirmacion.value == "") {
		    alert("Escriba apellido del cliente para la confirmación.");
		    document.formulario.apellidoConfirmacion.focus();
			return (false);
		}
	  	
	  	if (document.formulario.telefonoConfirmacion.value == "") {
		    alert("Escriba teléfono del cliente para la confirmación.");
		    document.formulario.telefonoConfirmacion.focus();
			return (false);
		}
	  
	  if (document.formulario.ultimafilaproducto.value == 1) {
	    alert("No tiene productos Asociados.");
	    document.formulario.ultimafilaproducto.focus();
		return (false);
	  }
	  
	  if (document.formulario.nombreDespacho.value == "") {
		    alert("Escriba nombre del cliente para el despacho.");
		    document.formulario.nombreDespacho.focus();
			return (false);
		}
	  
	  if (document.formulario.apellidoDespacho.value == "") {
		    alert("Escriba nombre del cliente para el despacho.");
		    document.formulario.apellidoDespacho.focus();
			return (false);
		}
	  
	  if (document.formulario.direccionDespacho.value == "") {
		    alert("Escriba dirección para el despacho.");
		    document.formulario.direccionDespacho.focus();
			return (false);
		}
	  
	  if (document.formulario.fechaDespacho.value.length < 1) {
	    alert("Escriba la fecha de Entrega.");
	    document.formulario.fechaentrega.focus();
	    return (false);
	  }
	  
	  var hoy=new Date();
	  var anohoy=hoy.getYear()+1900; 
	  var meshoy=hoy.getMonth()+1;
	  var diahoy=hoy.getDate();
	  var fechahoy=anohoy+""+meshoy+""+diahoy;
	  var varano=formulario.fechaDespacho.value.substr(0, 4); 
	  var varmes=formulario.fechaDespacho.value.substr(5, 2);  
	  if(varmes<10) {
	    var varmes= formulario.fechaDespacho.value.substr(6, 1); 
	  } 
	  var vardia=formulario.fechaDespacho.value.substr(8, 2);
	  if(vardia<10) {
	    var vardia= formulario.fechaDespacho.value.substr(9, 1); 
	  } 
	  var varfecha=varano+varmes+vardia;
	  
	  if (parseInt(varfecha) <= parseInt(fechahoy)) {
	    //alert(varfecha+" <= "+fechahoy);
		alert("Fecha de Entrega no Permitida..");
	    formulario.fechaDespacho.focus();
	    return (false);
	  }
	    
	  if (document.formulario.horaDespacho.value.length < 1) {
	    alert("Escriba la Hora de Entrega.");
	    document.formulario.horaDespacho.focus();
	    return (false);
	  }
	    var entrar = confirm("¿Desea Continuar?")
		if ( !entrar )
	      return (false);
		else
		  return (true);
	}
	</script>
</HEAD>
<BODY>
<DIV id=conteneur>
  <DIV id=header></DIV>
  <DIV id=haut>
    <UL class=menuhaut>
      <LI><a id="menu1" title="HOME" href="home.jsp" name="menu1">HOME</a></li>
      <LI><a id="menu2" title="Pastelería la Palmera" href="lapalmera.jsp" name="menu2">LA PALMERA</a></li>
      <LI><a id="menu3" title="Locales de la Pastelería" href="locales.jsp" name="menu3">LOCALES</a></li>
      <LI><a id="menu4" title="Productosde la Pastelería" href="productos.jsp" name="menu4">PRODUCTOS</a></li>
      <LI><a id="menu5" title="Pedidos de los Productos" href="pedido.jsp" name="menu5">PEDIDOS</a></li>
      <LI><a id="menu6" title="Contacto con la Pastelería" href="contactos.jsp" name="menu6">CONTACTOS</a></li>
    </UL>
    <!--UL class=drapeau-fr><a href="Wc6eeca2de71f7.htm"><img src="interface/drapeaux-fr.gif"/></a></UL-->
    <!--UL class=drapeau-uk><a href="Wc6be97dd72d0.htm"><img src="interface/drapeaux-uk.gif"/></a></UL-->
  </DIV>
  <DIV id=fondo>
    <DIV id=gauche>
    <!--UL class=module-header>Usuario</UL>
    <UL class=menugauche>
      <P>
        <form name="entrar" method="post" action="listem.php" style="MARGIN: 4px;" >
        Usuario:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="username" type="text" size="10" ><br>
		Contraseña:<input name="password" type="text" size="10" ><br>
		<input class="button_rechercher" type="submit" name="Submit" value="Entrar" >
        <input name="type" type="hidden" value="covers">
        <input name="recherche" type="hidden" value="1">
        <input name="langue" type="hidden" value="en"></form>
      </P>
    </UL>
    <UL class=piedmodule></UL-->
    <!--UL class=module-header>Eventos</UL>
    <UL class=menugauche>
      <a href="Wc550a469e6ffa.htm"><img src="covers/petit/1784.jpg" title="Kodomo no Omocha" /></a>
      <P>Cumpleaños para Niños</P>
    </UL>
    <UL class=piedmodule></UL-->
    <UL class=module-header>Promociones</UL>
    <UL class=menugauche>
          <a href="Wc847023715368.htm"><img src="interface/torta/africana.png" width="125" height="125" title="Love Hina" /></a>
      <P>Torta de Yogurth
</P>
    </UL>
    <UL class=piedmodule></UL>
    <UL class=module-header>Estadisticas</UL>
    <UL class=menugauche>
          <P>1610 5 Sabores</P>
      <P>161 Africana</P>
      <P>571 3 Leches</P>
      <P>907 La Palmera</P>
      <P>731 Piña</P>
      <P>811 Manjar</P>
    </UL>
    <UL class=piedmodule></UL>
  </DIV>
  <form name="formulario" action="/pruebaWeb/servlet/GrabaSolicitudPedido" onSubmit="return ValidaEntrada()">
  <DIV id=centre>
     <UL class=titre-centre>Formulario de Pedido</UL>
	 <UL class=menucentre>
	     <UL class=centeredimage>
		   <p>La Pastelería llamara a nombre de "Pastelería La Palmera&quot; Para confirmar el pedido, el numero de telefono que se pide para confirmar el pedido es obligarorio ya que acá se confirmara este.</p>
		 </UL>
     </UL>
     <UL class=piedcentre></UL>
	 
     <UL class=titre-centre>Datos de Cliente</UL>
	 <UL class=menucentre>
	     <UL class=centeredimage>
		  <table>
		  <tr>
		  <td>Nombre: *1 </td><td> <input name="nombreConfirmacion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Apellido: *1 </td><td> <input name="apellidoConfirmacion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Dirección: </td><td> <input name="direccionConfirmacion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>telefono:*1*2 </td><td> <input name="telefonoConfirmacion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>E-mail: </td><td> <input name="emailConfirmacion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td colspan="2">*1 Datos Obligatorios</td>
		  </tr>
		  <tr>
		  <td colspan="2">*2 A este número se confirmará el pedido. Se llamará de parte de "Pastelería La Palmera"</td>
		  </tr>
		  </table>
		 </UL>
     </UL>
     <UL class=piedcentre></UL>
     <UL class=titre-centre>Datos del Producto</UL>
   	  <UL class=menucentre>
	      <UL class=centeredimage>
		  <jsp:useBean id="arraySolicitudProducto" class="java.util.ArrayList" scope="session"/>
			
			<a href="javascript:seleccionar_todo()">Marcar todos</a> 
			|
			<a href="javascript:deseleccionar_todo()">Marcar ninguno</a> 
			<button type="button" onClick="return sacaSolicitudProducto()">Eliminar</button>
			<span id="salidaSolicitudProducto">
				<table border="1">
			   		<tr>
					   <th>Selec</th>
					   <th>Producto</th>
					   <th>Cantidad</th>
					   <th>Precio</th>
			   		</tr>
			   		<%
					Iterator itSolicitudProducto= arraySolicitudProducto.iterator();
					int i = 1;
					int k = 0;
					int j = 1;
					int total = 0;
					String cantidadinsumo = "";
					String stock = "S";
					while (itSolicitudProducto.hasNext())
					{
						DetallePedido detallePedido = (DetallePedido) itSolicitudProducto.next();%>
					<tr>
						<td>
							<input type="checkbox" name="op" value="<%=k%>">
							<!--input type="checkbox" name="NomCheck[]" value="1"/-->
						</td>
						<td>
							<% 
							Producto producto2 = new Producto();
							producto2.setCodigoProducto(detallePedido.getCodigoProducto());
							if (producto2.buscar())
							{
								out.print(producto2.getNombreProducto());
							}
							%>
							<%--=detallePedido.getCodigoProducto()--%>
							<input type="hidden" name=producto<%=i%> value="<%=detallePedido.getCodigoProducto()%>"/>
						</td>
						<td>
							<%=detallePedido.getCantidadProducto()%>
							<input type="hidden" name=cantidadproducto<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/>
						</td>
						<td>
							<%=detallePedido.getPrecioProducto()%>
							<input type="hidden" name=precioproducto<%=i%> value="<%=detallePedido.getPrecioProducto()%>"/>
							<%total = total + Integer.parseInt(detallePedido.getPrecioProducto());%>
						</td>
						<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
					</tr>
						<%i++;%>
						<%k++;%>
					<%}%>
					<tr>
						<td colspan="3">
							Total
						</td>
						<td>
							<%=total%>
							<input type="hidden" name=total value="<%=total%>"/>
						</td>
					</tr>
				</table>
				<table>
			   		<tr>
					   <td>
					   		<select size=1 name="producto">
								<option value=-1>SELECCIONE PRODUCTO</option>
								<% 
								ArrayList<Producto> arrayProducto= new ArrayList<Producto>();
								ManejadorProducto manProducto= new ManejadorProducto();
								//manProducto.setTipoProducto("T");
								arrayProducto=manProducto.consultar();
								Iterator itProducto= arrayProducto.iterator();
								while (itProducto.hasNext())
								{
								Producto producto2= (Producto) itProducto.next();
								%>
								<option value=<%=producto2.getCodigoProducto()%>> <%=producto2.getNombreProducto()%></option>
								<%}%>
							</select>
					   </td>
					   <td>
					   		<input type="text" name="cantidadproducto" size="3"/>
					   </td>
					   <td>
					   		<button type="button" onClick="recuperaSolicitudProducto()">Agregar Producto</button>
					   </td>
				   </tr>
			   </table>
			   
			   <!--input type="hidden" name="producto" value="0"/-->
				<!--input type="hidden" name="cantidadproducto" value="0"/-->
				<%k++;%>
				<input type="hidden" name="stock" value="<%=stock%>"/>
				<input type="hidden" name="ingrediente" value="<%=j%>"/>
				<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
				<input type="hidden" name="cantidadsolicitudproducto" value="<%=k%>"/>
			</span>
	    </UL>
    </UL>
    <UL class=piedcentre></UL>
    
	<UL class=titre-centre>Datos para el Despacho</UL>
   	  <UL class=menucentre>
	      <UL class=centeredimage>
		  <table>
		  <tr>
		  <td>A Nombre de : *1 </td>
		  <td> <input name="nombreDespacho" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Apellido: *1 </td><td> <input name="apellidoDespacho" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Dirección: </td><td> <input name="direccionDespacho" type="text" size="40"></td>
		  </tr>
		  <tr>
				<td>
					Fecha de Entrega:*1
				</td>
				<td>
					<input type="text" name="fechaDespacho" id="campo_fecha"/>
					<input type="button" id="lanzador" value="..."/>
					<!-- script que define y configura el calendario-->
					<script type="text/javascript">
					Calendar.setup({
					inputField     :    "campo_fecha",     // id del campo de texto
					ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto
					button     :    "lanzador"     // el id del botón que lanzará el calendario
					});
					</script>
				</td>
			</tr>
			<tr>
				<td>
					Hora de Entrega:*1
				</td>
				<td>
					<select name="horaDespacho">
					<option></option>
					<option>10:00-12:00</option>
					<option>12:00-14:00</option>
					<option>14:00-16:00</option>
					<option>16:00-18:00</option>
					<option>18:00-20:00</option>
					</select>
				</td>
			</tr>
			<tr>
		  <td colspan="2">*1 Datos Obligatorios</td>
		  </tr>
		   </table>
		  </UL>
    	</UL>
      	<UL class=piedcentre></UL>
      	
      	<UL class=titre-centre>Comentario</UL>
      	<UL class=menucentre>
	      <UL class=centeredimage>
			<table>
			<tr>
			<td>
			<textarea name="comentario" rows="5" cols="55" ></textarea>
			</td>
			</tr>
			</table>
		</UL>
    	</UL>
      	<UL class=piedcentre></UL>
   
	   <p><input name="enviar" value="Enviar" type="submit">
		  <input name="cancelar" value="cancelar" type="reset"></p>
	   </form> 
   
  	</DIV>
  </DIV>	
  
  <DIV id=pied>
  </DIV>
</DIV>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-95179-4";
urchinTracker();
</script>
</BODY>
</HTML>
