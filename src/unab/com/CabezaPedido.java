package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class CabezaPedido {
   private String numeroPedido = "";
   private String nombreCliente = "";
   private String fechaPedido = "";
   private String horaPedido = "";
   private String precioTotalPedido = "";
   private String confirmacionPedido = "";
   private String dedicatoriaPedido = "";
   private String observacionPedido = "";

   public void setNumeroPedido(String var1) {
      this.numeroPedido = var1;
   }

   public void setNombreCliente(String var1) {
      this.nombreCliente = var1;
   }

   public void setFechaPedido(String var1) {
      this.fechaPedido = var1;
   }

   public void setHoraPedido(String var1) {
      this.horaPedido = var1;
   }

   public void setPrecioTotalPedido(String var1) {
      this.precioTotalPedido = var1;
   }

   public void setConfirmacionPedido(String var1) {
      this.confirmacionPedido = var1;
   }

   public void setDedicatoriaPedido(String var1) {
      this.dedicatoriaPedido = var1;
   }

   public void setObservacionPedido(String var1) {
      this.observacionPedido = var1;
   }

   public String getNumeroPedido() {
      return this.numeroPedido;
   }

   public String getNombreCliente() {
      return this.nombreCliente;
   }

   public String getFechaPedido() {
      return this.fechaPedido;
   }

   public String getHoraPedido() {
      return this.horaPedido;
   }

   public String getPrecioTotalPedido() {
      return this.precioTotalPedido;
   }

   public String getConfirmacionPedido() {
      return this.confirmacionPedido;
   }

   public String getDedicatoriaPedido() {
      return this.dedicatoriaPedido;
   }

   public String getObservacionPedido() {
      return this.observacionPedido;
   }

   public int grabar() {
      int var1 = 0;
      String var2 = "root";
      String var3 = "";
      String var4 = "jdbc:mysql://localhost/lapalmera2";
      Connection var5 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var5 = DriverManager.getConnection(var4, var2, var3);
         if (var5 != null) {
            Statement var6 = var5.createStatement();
            String var7 = "insert into CabezaPedido(nombrecliente,fechapedido,horapedido,preciototalpedido,confirmacionpedido,dedicatoriapedido,observacionpedido) values (";
            var7 = var7 + "'" + this.nombreCliente + "',";
            var7 = var7 + "'" + this.fechaPedido + "',";
            var7 = var7 + "'" + this.horaPedido + "',";
            var7 = var7 + this.precioTotalPedido + ",";
            var7 = var7 + "'" + this.confirmacionPedido + "',";
            var7 = var7 + "'" + this.dedicatoriaPedido + "',";
            var7 = var7 + "'" + this.observacionPedido + "')";
            System.out.println(var7);
            var1 = var6.executeUpdate(var7);
            if (var1 == 1) {
               System.out.println("OK");
            }

            var6.close();
            var5.close();
         }

         return var1;
      } catch (Exception var8) {
         System.out.println(var8);
         return var1;
      }
   }

   public int modificar() {
      int var1 = 0;
      String var2 = "root";
      String var3 = "";
      String var4 = "jdbc:mysql://localhost/lapalmera2";
      Connection var5 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var5 = DriverManager.getConnection(var4, var2, var3);
         if (var5 != null) {
            Statement var6 = var5.createStatement();
            String var7 = "update cabezapedido set ";
            var7 = var7 + "numeropedido = " + this.numeroPedido + ", ";
            var7 = var7 + "nombrecliente = " + "'" + this.nombreCliente + "', ";
            var7 = var7 + "fechapedido = " + "'" + this.fechaPedido + "', ";
            var7 = var7 + "horapedido = " + "'" + this.horaPedido + "', ";
            var7 = var7 + "preciototalpedido = " + this.precioTotalPedido + ", ";
            var7 = var7 + "confirmacionPedido = " + "'" + this.confirmacionPedido + "', ";
            var7 = var7 + "dedicatoriaPedido = " + "'" + this.dedicatoriaPedido + "', ";
            var7 = var7 + "observacionPedido = " + "'" + this.observacionPedido + "' where numeropedido = " + this.numeroPedido + "";
            System.out.println(var7);
            var1 = var6.executeUpdate(var7);
            if (var1 == 1) {
               System.out.println("OK");
            }

            var6.close();
            var5.close();
         }

         return var1;
      } catch (Exception var8) {
         System.out.println(var8);
         return var1;
      }
   }

   public int eliminar() {
      int var1 = 0;
      String var2 = "root";
      String var3 = "";
      String var4 = "jdbc:mysql://localhost/lapalmera2";
      Connection var5 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var5 = DriverManager.getConnection(var4, var2, var3);
         if (var5 != null) {
            Statement var6 = var5.createStatement();
            String var7 = "delete from cabezapedido where ";
            var7 = var7 + "numeropedido = " + this.numeroPedido + "";
            System.out.println(var7);
            var1 = var6.executeUpdate(var7);
            if (var1 == 1) {
               System.out.println("OK");
            }

            var6.close();
            var5.close();
         }

         return var1;
      } catch (Exception var8) {
         System.out.println(var8);
         return var1;
      }
   }

   public String buscarUltimo() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "select * from cabezapedido";
            System.out.println(var6);
            ResultSet var7 = var5.executeQuery(var6);

            while(var7.next()) {
               System.out.println("Lo encontro");
               this.numeroPedido = var7.getString(1);
               System.out.println(this.numeroPedido);
            }

            var7.close();
            var5.close();
            var4.close();
         }
      } catch (Exception var8) {
         System.out.println(var8);
      }

      return this.numeroPedido;
   }

   public boolean buscar() {
      boolean var1 = false;
      String var2 = "root";
      String var3 = "";
      String var4 = "jdbc:mysql://localhost/lapalmera2";
      Connection var5 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var5 = DriverManager.getConnection(var4, var2, var3);
         if (var5 != null) {
            Statement var6 = var5.createStatement();
            String var7 = "select * from cabezapedido where numeropedido = " + this.numeroPedido + "";
            System.out.println(var7);
            ResultSet var8 = var6.executeQuery(var7);
            if (var8.next()) {
               System.out.println("Lo encontro");
               this.numeroPedido = var8.getString(1);
               this.nombreCliente = var8.getString(2);
               this.fechaPedido = var8.getString(3);
               this.horaPedido = var8.getString(4);
               this.precioTotalPedido = var8.getString(5);
               this.confirmacionPedido = var8.getString(6);
               this.dedicatoriaPedido = var8.getString(7);
               this.observacionPedido = var8.getString(8);
               var1 = true;
            }

            var8.close();
            var6.close();
            var5.close();
         }
      } catch (Exception var9) {
         System.out.println(var9);
      }

      return var1;
   }
}
