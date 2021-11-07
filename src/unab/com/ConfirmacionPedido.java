package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConfirmacionPedido {
   private String numeroPedido = "";
   private String nombreCliente = "";
   private String apellidoCliente = "";
   private String direccionCliente = "";
   private String telefonoCliente = "";

   public void setNumeroPedido(String var1) {
      this.numeroPedido = var1;
   }

   public void setNombreCliente(String var1) {
      this.nombreCliente = var1;
   }

   public void setApellidoCliente(String var1) {
      this.apellidoCliente = var1;
   }

   public void setDireccionCliente(String var1) {
      this.direccionCliente = var1;
   }

   public void setTelefonoCliente(String var1) {
      this.telefonoCliente = var1;
   }

   public String getNumeroPedido() {
      return this.numeroPedido;
   }

   public String getNombreCliente() {
      return this.nombreCliente;
   }

   public String getApellidoCliente() {
      return this.apellidoCliente;
   }

   public String getDireccionCliente() {
      return this.direccionCliente;
   }

   public String getTelefonoCliente() {
      return this.telefonoCliente;
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
            String var7 = "insert into ConfirmacionPedido values (";
            var7 = var7 + this.numeroPedido + ",";
            var7 = var7 + "'" + this.nombreCliente + "',";
            var7 = var7 + "'" + this.apellidoCliente + "',";
            var7 = var7 + "'" + this.direccionCliente + "',";
            var7 = var7 + this.telefonoCliente + ")";
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
            String var7 = "update confirmacionpedido set ";
            var7 = var7 + "numeropedido = " + this.numeroPedido + ", ";
            var7 = var7 + "nombrecliente = " + "'" + this.nombreCliente + "', ";
            var7 = var7 + "apellidocliente = " + "'" + this.apellidoCliente + "', ";
            var7 = var7 + "direccioncliente = " + "'" + this.direccionCliente + "', ";
            var7 = var7 + "telefonocliente = " + this.telefonoCliente + " ";
            var7 = var7 + " where numeropedido = " + this.numeroPedido + "";
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
            String var7 = "delete from confirmacionpedido where ";
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
            String var7 = "select * from confirmacionpedido where numeropedido = " + this.numeroPedido + "";
            System.out.println(var7);
            ResultSet var8 = var6.executeQuery(var7);
            if (var8.next()) {
               System.out.println("Lo encontro");
               this.numeroPedido = var8.getString(1);
               this.nombreCliente = var8.getString(2);
               this.apellidoCliente = var8.getString(3);
               this.direccionCliente = var8.getString(4);
               this.telefonoCliente = var8.getString(5);
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
