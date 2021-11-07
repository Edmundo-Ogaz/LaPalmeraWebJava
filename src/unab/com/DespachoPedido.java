package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DespachoPedido {
   private String numeroPedido = "";
   private String nombreCliente = "";
   private String direccionDespacho = "";
   private String fechaEntregaDespacho = "";
   private String horaEntregaDespacho = "";

   public void setNumeroPedido(String var1) {
      this.numeroPedido = var1;
   }
   
   public void setNombreCliente(String var1) {
      this.nombreCliente = var1;
   }

   public void setDireccionDespacho(String var1) {
      this.direccionDespacho = var1;
   }

   public void setFechaEntregaDespacho(String var1) {
      this.fechaEntregaDespacho = var1;
   }

   public void setHoraEntregaDespacho(String var1) {
      this.horaEntregaDespacho = var1;
   }

   public String getNumeroPedido() {
      return this.numeroPedido;
   }
   
   public String getNombreCliente() {
      return this.nombreCliente;
   }

   public String getDireccionDespacho() {
      return this.direccionDespacho;
   }

   public String getFechaEntregaDespacho() {
      return this.fechaEntregaDespacho;
   }

   public String getHoraEntregaDespacho() {
      return this.horaEntregaDespacho;
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
            String var7 = "insert into DespachoPedido values (";
            var7 = var7 + this.numeroPedido + ",";
            var7 = var7 + "'" + this.nombreCliente + "',";
            var7 = var7 + "'" + this.direccionDespacho + "',";
            var7 = var7 + "'" + this.fechaEntregaDespacho + "',";
            var7 = var7 + "'" + this.horaEntregaDespacho + "')";
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
            String var7 = "update despachopedido set ";
            var7 = var7 + "numeropedido = " + this.numeroPedido + ", ";
            var7 = var7 + "nombreCliente = " + "'" + this.nombreCliente + "', ";
            var7 = var7 + "direccionDespacho = " + "'" + this.direccionDespacho + "', ";
            var7 = var7 + "fechaentregadespacho = " + "'" + this.fechaEntregaDespacho + "', ";
            var7 = var7 + "horaentregadespacho = " + "'" + this.horaEntregaDespacho + "' where numeropedido = " + this.numeroPedido + "";
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
            String var7 = "delete from despachopedido where ";
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
            String var7 = "select * from despachopedido where numeropedido = " + this.numeroPedido + "";
            System.out.println(var7);
            ResultSet var8 = var6.executeQuery(var7);
            if (var8.next()) {
               System.out.println("Lo encontro");
               this.numeroPedido = var8.getString(1);
               this.nombreCliente = var8.getString(2);
               this.direccionDespacho = var8.getString(3);
               this.fechaEntregaDespacho = var8.getString(4);
               this.horaEntregaDespacho = var8.getString(5);
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
