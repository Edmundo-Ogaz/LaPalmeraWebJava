<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<HTML lang=fr xml:lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link href="css/en/main.css" rel="stylesheet" type="text/css">
<TITLE>AnimeCoversFan</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="alternate" type="application/rss+xml" title="RSS News" href="www.animecoversfan.com/fluxrss.xml.htm" />
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
	
	function recuperaOtraSolicitudProducto() {
		
		  /*if (document.formulario.ingrediente.value == 1) {
		    alert("No tiene Ingredientes asociados el Producto.");
		    //document.formulario.ingrediente.focus();
		    return (false);
		  }
		  
		  if (document.formulario.stock.value == "N") {
		    alert("Hay productos que no tienen stock sufuciente.");
		    //document.formulario.ingrediente.focus();
		    return (false);
		  }*/
		  
		  /*if (document.formulario.producto.value == -1) {
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
		  } */  
		  
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
			ajax.open( "GET", "/pruebaWeb/CargarSolicitudProducto.jsp?producto="+valor1+"&cantidadproducto="+valor2, true );
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
  <form name="formulario" action="/pruebaWeb/servlet/GrabaSolicitudProducto" onSubmit="return ValidaEntrada()">
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
		  <td>Nombre: *1 </td><td> <input name="nombre" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Apellido: *1 </td><td> <input name="apellido" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Dirección: </td><td> <input name="direccion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Comuna:*1 </td><td> <input name="comuna" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>telefono:*1*2 </td><td> <input name="telefono" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>E-mail: </td><td> <input name="email" type="text" size="40"></td>
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
					   <th>cantidad</th>
			   		</tr>
			   		<%
					Iterator itSolicitudProducto= arraySolicitudProducto.iterator();
					int i = 1;
					int k = 0;
					int j = 1;
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
								<!--td>
								<%--=detallePedido.getPrecioProducto()--%>
								<input type="hidden" name=precioproducto<%--=i--%> value="<%--=detallePedido.getPrecioProducto()--%>"/>
								</td-->
						<td>
							<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
						</td>
					</tr>
						<%i++;%>
						<%k++;%>
					<%}%>
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
				   </tr>
			   </table>
			   
			   <!--input type="hidden" name="producto" value="0"/-->
				<!--input type="hidden" name="cantidadproducto" value="0"/-->
				<%k++;%>
				<input type="hidden" name="stock" value="<%=stock%>"/>
				<input type="hidden" name="ingrediente" value="<%=j%>"/>
				<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
				<input type="hidden" name="cantidadsolicitudproducto" value="<%=k%>"/>
				<button type="button" onClick="recuperaSolicitudProducto()">Agregar Producto</button>
				<!--button type="button" onClick="sacaSolicitudProductoUltimo()">Sacar Ultimo Producto</button-->
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
		  <td> <input name="nobre" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Apellido: *1 </td><td> <input name="apellido" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Dirección: </td><td> <input name="direccion" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>Comuna:*1 </td><td> <input name="comuna" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>telefono:*1 </td><td> <input name="telefono" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td>E-mail: </td><td> <input name="email" type="text" size="40"></td>
		  </tr>
		  <tr>
		  <td colspan="2">*1 Datos Obligatorios</td>
		  </tr>
		  <tr>
		  <td colspan="2">Fecha de Entrega:Día<select name="dia">
		   <option>
		   <option>1
		   <option>2
		   <option>3
		   </select>
		   Mes<select name="dia">
		   <option>
		   <option>1
		   <option>2
		   <option>3
		   </select></td>
		   </tr>
		   </table>
		  </UL>
    	</UL>
      	<UL class=piedcentre></UL>
    
		<UL class=titre-centre>Datos para la Confirmar</UL>
   	  	<UL class=menucentre>
	      <UL class=centeredimage>
		  <table>
		  <tr>
		  <td>telefono:*1*2 </td><td> <input name="telefono" type="text" size="20"></td>
		  </tr>
		  <tr>
		   <td colspan="2">Hora para la confirmación del Pedido:<select name="hora confirmacion">
		   <option>
		   <option>10:00-11:00
		   <option>12:00-13:00
		   <option>14:00-15:00
		   </select></td>
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
