<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arraySolicitudProducto" class="java.util.ArrayList" scope="session"/>

<%
  int indice;    
  int largoeliminar = Integer.parseInt(request.getParameter("largoeliminar"));
  String mostrar = request.getParameter("eliminar");
  String eliminar = request.getParameter("eliminar");
  int largoarray = 	arraySolicitudProducto.size();
  
  
  for (int j=0;j<largoeliminar;j++){ 
  
  	indice = Integer.parseInt(eliminar.substring(eliminar.lastIndexOf(",")+1,eliminar.length()));
    eliminar = eliminar.substring(0,eliminar.lastIndexOf(","));
	
	//indice = Integer.parseInt(eliminar.substring(eliminar.lastIndexOf(","),eliminar.length()));
  	//eliminar = eliminar.substring(eliminar.indexOf(",")+1,eliminar.length());
	
	if (largoarray != indice){
  	   arraySolicitudProducto.remove(indice);
	}
  }
%>



<%/*
  int cantidadsolicitudproducto= Integer.parseInt(request.getParameter("cantidadsolicitudproducto"));
  String cantidadproducto = request.getParameter("cantidadproducto");
  if (cantidadproducto.equals("0"))
  {
	arraySolicitudProducto.remove(cantidadsolicitudproducto-2);
  }
*/%>

<table border="1">
<tr>
<th>
Selec
</th>
<th>
Producto
</th>
<th>
Cantidad
</th>
</tr>
<%
int i = 1;
int k = 0;
int j = 1;
int preciototal = 0;
String cantidadinsumo = "";
String stock= "S";
Iterator itSolicitudProducto= arraySolicitudProducto.iterator();
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
<input type="hidden" name=producto<%=i%> value="<%=detallePedido.getCodigoProducto()%>"/>
</td>
<td>
<%=detallePedido.getCantidadProducto()%>
<input type="hidden" name=cantidadproducto<%=i%> value="<%=detallePedido.getCantidadProducto()%>"/>
</td>
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
			<%k++;%>
		</td>
		<td>
			&nbsp;
		</td>
		<td>
			&nbsp;
		</td>
	</tr>
</table>

<input type="hidden" name="stock" value="<%=stock%>"/>
<input type="hidden" name="ingrediente" value="0"/>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidadsolicitudproducto" value="<%=k%>"/>
<button type="button" onClick="recuperaSolicitudProducto()">Agregar Producto</button>
<!--button type="button" onClick="recuperaOtraSolicitudProducto()">Agregar Otro Producto</button>
<button type="button" onClick="sacaSolicitudProductoUltimo()">Sacar Ultimo Producto</button-->
