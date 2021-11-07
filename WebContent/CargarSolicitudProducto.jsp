<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="unab.com.*" %>
<jsp:useBean id="arraySolicitudProducto" class="java.util.ArrayList" scope="session"/>
<%
String producto = request.getParameter("producto");
String cantidadproducto = request.getParameter("cantidadproducto");

	if (!cantidadproducto.equals("0"))
	  {
	  DetallePedido puntero = new DetallePedido();
	  puntero.setCodigoProducto(producto);
	  puntero.setCantidadProducto(cantidadproducto);	
		
	  /*Producto producto1 = new Producto();
	  producto1.setCodigoProducto(producto);
	  if (producto1.buscar())
		{
		String precioproducto = String.valueOf(Integer.parseInt(producto1.getValorVentaProducto())*Integer.parseInt(cantidadproducto));
		puntero.setPrecioProducto(precioproducto);
		}*/
	  arraySolicitudProducto.add(puntero);
      }		
%>

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
<!--td>
<%--=detallePedido.getPrecioProducto()--%>  
<%--preciototal = preciototal + Integer.parseInt(detallePedido.getPrecioProducto());--%> 
<input type="hidden" name=precioproducto<%--=i--%> value="<%--=detallePedido.getPrecioProducto()--%>"/>
</td-->
<td>
<input type="hidden" name=ultimafila<%=i%> value="<%=j-1%>"/>
</td>
</tr>
<%i++;%>
<%k++;%>
<%}%>
<tr>
<td>
<input type="checkbox" name="op" value="<%=k%>">
</td>
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
</select></td>
<td>
<input type="text" name="cantidadproducto" size="3"/></td>
<td>
<input type="hidden" name="insumo" value=""/>
</td>
</tr>
</table>
<input type="hidden" name="stock" value="<%=stock%>"/>
<input type="hidden" name="ingrediente" value="<%=j%>"/>
<input type="hidden" name="ultimafilaproducto" value="<%=i%>"/>
<input type="hidden" name="cantidadsolicitudproducto" value="<%=k%>"/>
<button type="button" onClick="recuperaSolicitudProducto()">Consultar Insumos</button>
<!--button type="button" onClick="sacaSolicitudProductoUltimo()">Sacar Ultimo Producto</button-->
