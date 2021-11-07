package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import unab.com.CabezaPedido;
import unab.com.DetallePedido;
import unab.com.DespachoPedido;
import unab.com.ConfirmacionPedido;
import unab.com.Stock;


public class GrabaSolicitudPedido extends HttpServlet
{

    public GrabaSolicitudPedido()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
        {
            
            int query = 1;
            boolean rollback = false;
            String mensaje = "";
            String opcion = httpservletrequest.getParameter("enviar");
      		String enviara = "";
	      	if (opcion.equals("Enviar"))
	        { 
	          String numeropedido = "";
	          CabezaPedido cabezaPedido = new CabezaPedido();
	          DetallePedido detallePedido = new DetallePedido();
	          DespachoPedido despachoPedido = new DespachoPedido();
	          ConfirmacionPedido confirmacionPedido = new ConfirmacionPedido();
	                 	      
	          //CabezaPedido cabezaPedido = new CabezaPedido();
			  cabezaPedido.setNombreCliente(httpservletrequest.getParameter("nombre") + " " + httpservletrequest.getParameter("apellido"));
			  cabezaPedido.setFechaPedido(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
			  cabezaPedido.setHoraPedido(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
			  cabezaPedido.setPrecioTotalPedido("0");
			  cabezaPedido.setConfirmacionPedido("I");
			  cabezaPedido.setDedicatoriaPedido("");
			  cabezaPedido.setObservacionPedido("");
			  //cabezaPedido.grabar();
			  query = cabezaPedido.grabar();
			  if (query == 0){
			     rollback = true;				
			  }else{
			     numeropedido = cabezaPedido.buscarUltimo();
			  }
			  			   
			  int i = Integer.parseInt(httpservletrequest.getParameter("ultimafilaproducto"));
        		for(int j = 1; j < i; j++)
        		{
				  //DetallePedido detallePedido = new DetallePedido();
				  detallePedido.setNumeroPedido(numeropedido);
				  detallePedido.setCodigoProducto(httpservletrequest.getParameter("producto" + j));
				  detallePedido.setPrecioProducto("0");
				  detallePedido.setCantidadProducto(httpservletrequest.getParameter("cantidadproducto" + j));
				  //detallePedido.grabar();
				  if (rollback == false){
				     query = detallePedido.grabar();
	 			     if (query == 0){
	 			        rollback = true;
				     }
				   }  
				}
			
			//DespachoPedido despachoPedido = new DespachoPedido();
			despachoPedido.setNumeroPedido(numeropedido);
			despachoPedido.setNombreCliente("Pastelería La Palmera");
			despachoPedido.setDireccionDespacho("Venta");
			despachoPedido.setFechaEntregaDespacho(httpservletrequest.getParameter("fechaentrega"));
			despachoPedido.setHoraEntregaDespacho(httpservletrequest.getParameter("horaentrega"));
			//despachoPedido.grabar();
		    if (rollback == false){
		       query = despachoPedido.grabar();
	 		   if (query == 0){
	 		   	  rollback = true;	
			   }
			}
			    
			//ConfirmacionPedido confirmacionPedido = new ConfirmacionPedido();
			confirmacionPedido.setNumeroPedido(numeropedido);
			confirmacionPedido.setNombreCliente("Pastelera La Palmera");
			confirmacionPedido.setApellidoCliente("Pastelera La Palmera");
			confirmacionPedido.setDireccionCliente("Ventas");
			confirmacionPedido.setTelefonoCliente("268898");
			//confirmacionPedido.grabar();
	        if (rollback == false){
	           query = confirmacionPedido.grabar();
	 		   if (query == 0){
	 		      rollback = true;	
	           }
	        }   
	                		
            
            if ((rollback == true) && (!numeropedido.equals(""))) {
               cabezaPedido.setNumeroPedido(numeropedido);
               cabezaPedido.eliminar();
               detallePedido.setNumeroPedido(numeropedido);
               detallePedido.eliminar();
               despachoPedido.setNumeroPedido(numeropedido);
               despachoPedido.eliminar();
               confirmacionPedido.setNumeroPedido(numeropedido);
               confirmacionPedido.eliminar();
            }

	        enviara = "http://localhost:8080/pruebaWeb/home.jsp";             
	     }           
					      
		httpservletresponse.sendRedirect(enviara);	
        
    }
}