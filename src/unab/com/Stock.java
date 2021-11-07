package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Stock {
   int i = 0;
   private String codigoProducto = "";
   private String stockDisponible = "";
   private String stockComprometido = "";
   private String codigoUnidadMedida = "";

   public void setCodigoProducto(String var1) {
      this.codigoProducto = var1;
   }

   public void setStockDisponible(String var1) {
      this.stockDisponible = var1;
   }

   public void setStockComprometido(String var1) {
      this.stockComprometido = var1;
   }

   public void setCodigoUnidadMedida(String var1) {
      this.codigoUnidadMedida = var1;
   }

   public String getCodigoProducto() {
      return this.codigoProducto;
   }

   public String getStockDisponible() {
      return this.stockDisponible;
   }

   public String getStockComprometido() {
      return this.stockComprometido;
   }

   public String getCodigoUnidadMedida() {
      return this.codigoUnidadMedida;
   }

   public int grabar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "insert into Stock values (";
            var6 = var6 + "'" + this.codigoProducto + "',";
            var6 = var6 + this.stockDisponible + ",";
            var6 = var6 + this.stockComprometido + ",";
            var6 = var6 + "'" + this.codigoUnidadMedida + "')";
            System.out.println(var6);
            this.i = var5.executeUpdate(var6);
            if (this.i == 1) {
               System.out.println("OK");
            }

            var5.close();
            var4.close();
         }
      } catch (Exception var7) {
         System.out.println(var7);
         return this.i;
      }

      return this.i;
   }

   public int modificar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "update stock set ";
            var6 = var6 + "codigoproducto = '" + this.codigoProducto + "', ";
            var6 = var6 + "stockdisponible = " + this.stockDisponible + ", ";
            var6 = var6 + "stockComprometido = " + this.stockComprometido + ", ";
            var6 = var6 + "codigoUnidadMedida = " + "'" + this.codigoUnidadMedida + "' ";
            var6 = var6 + "where codigoproducto = '" + this.codigoProducto + "'";
            System.out.println(var6);
            this.i = var5.executeUpdate(var6);
            if (this.i == 1) {
               System.out.println("OK");
            }

            var5.close();
            var4.close();
         }
      } catch (Exception var7) {
         System.out.println(var7);
         return this.i;
      }

      return this.i;
   }

   public int eliminar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "delete from stock where ";
            var6 = var6 + "codigoproducto = '" + this.codigoProducto + "'";
            System.out.println(var6);
            this.i = var5.executeUpdate(var6);
            if (this.i == 1) {
               System.out.println("OK");
            }

            var5.close();
            var4.close();
         }
      } catch (Exception var7) {
         System.out.println(var7);
         return this.i;
      }

      return this.i;
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
            String var7 = "select * from stock where codigoproducto = '" + this.codigoProducto + "'";
            System.out.println(var7);
            ResultSet var8 = var6.executeQuery(var7);
            if (var8.next()) {
               System.out.println("Lo encontro");
               this.codigoProducto = var8.getString(1);
               this.stockDisponible = var8.getString(2);
               this.stockComprometido = var8.getString(3);
               this.codigoUnidadMedida = var8.getString(4);
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
