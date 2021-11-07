package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DetallePedido {
   private int id  = 0;
   private String numeroPedido = "";
   private String codigoProducto = "";
   private String precioProducto = "";
   private String cantidadProducto = "";
   
   public void setId(int id) {
      this.id = id;
   }

   public void setNumeroPedido(String var1) {
      this.numeroPedido = var1;
   }

   public void setCodigoProducto(String var1) {
      this.codigoProducto = var1;
   }

   public void setPrecioProducto(String var1) {
      this.precioProducto = var1;
   }

   public void setCantidadProducto(String var1) {
      this.cantidadProducto = var1;
   }
   
   public int getId() {
      return this.id;
   }

   public String getNumeroPedido() {
      return this.numeroPedido;
   }

   public String getCodigoProducto() {
      return this.codigoProducto;
   }

   public String getPrecioProducto() {
      return this.precioProducto;
   }

   public String getCantidadProducto() {
      return this.cantidadProducto;
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
            String var7 = "insert into DetallePedido values (";
            var7 = var7 + "NULL" + ",";
            var7 = var7 + this.numeroPedido + ",";
            var7 = var7 + "'" + this.codigoProducto + "',";
            var7 = var7 + this.precioProducto + ",";
            var7 = var7 + this.cantidadProducto + ")";
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
            String var7 = "update detallepedido set ";
            var7 = var7 + "numeropedido = " + this.numeroPedido + ", ";
            var7 = var7 + "codigoProducto = '" + this.codigoProducto + "', ";
            var7 = var7 + "precioProducto = " + this.precioProducto + ", ";
            var7 = var7 + "cantidadProducto = " + this.cantidadProducto + " ";
            var7 = var7 + "where numeropedido = " + this.numeroPedido + " ";
            var7 = var7 + "and codigoproducto = '" + this.codigoProducto + "'";
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
            String var7 = "delete from detallepedido where ";
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
            String var7 = "select * from detallepedido where numeropedido = " + this.numeroPedido + "";
            System.out.println(var7);
            ResultSet var8 = var6.executeQuery(var7);
            if (var8.next()) {
               System.out.println("Lo encontro");
               this.id = var8.getInt(1);
               this.numeroPedido = var8.getString(2);
               this.codigoProducto = var8.getString(3);
               this.precioProducto = var8.getString(4);
               this.cantidadProducto = var8.getString(5);
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
