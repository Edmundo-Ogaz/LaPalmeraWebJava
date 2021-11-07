package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Producto {
   private String codigoProducto = "";
   private String nombreProducto = "";
   private String codigoFamilia = "";
   private String codigoSubfamilia = "";
   private String codigoOtraCaracteristica = "";
   private String stockCriticoProducto = "";
   private String codigoUnidadMedida = "";
   private String tipoProducto = "";
   private String valorCostoProducto = "";
   private String valorVentaProducto = "";
   private String preparacionProducto = "";
   private String fotoProducto = "";
   private String observacionProducto = "";

   public void setCodigoProducto(String var1) {
      this.codigoProducto = var1;
   }

   public void setNombreProducto(String var1) {
      this.nombreProducto = var1;
   }

   public void setCodigoFamilia(String var1) {
      this.codigoFamilia = var1;
   }

   public void setCodigoSubfamilia(String var1) {
      this.codigoSubfamilia = var1;
   }

   public void setCodigoOtraCaracteristica(String var1) {
      this.codigoOtraCaracteristica = var1;
   }

   public void setStockCriticoProducto(String var1) {
      this.stockCriticoProducto = var1;
   }

   public void setCodigoUnidadMedida(String var1) {
      this.codigoUnidadMedida = var1;
   }

   public void setTipoProducto(String var1) {
      this.tipoProducto = var1;
   }

   public void setValorCostoProducto(String var1) {
      this.valorCostoProducto = var1;
   }

   public void setValorVentaProducto(String var1) {
      this.valorVentaProducto = var1;
   }

   public void setPreparacionProducto(String var1) {
      this.preparacionProducto = var1;
   }

   public void setFotoProducto(String var1) {
      this.fotoProducto = var1;
   }

   public void setObservacionProducto(String var1) {
      this.observacionProducto = var1;
   }

   public String getCodigoProducto() {
      return this.codigoProducto;
   }

   public String getNombreProducto() {
      return this.nombreProducto;
   }

   public String getCodigoFamilia() {
      return this.codigoFamilia;
   }

   public String getCodigoSubfamilia() {
      return this.codigoSubfamilia;
   }

   public String getCodigoOtraCaracteristica() {
      return this.codigoOtraCaracteristica;
   }

   public String getStockCriticoProducto() {
      return this.stockCriticoProducto;
   }

   public String getCodigoUnidadMedida() {
      return this.codigoUnidadMedida;
   }

   public String getTipoProducto() {
      return this.tipoProducto;
   }

   public String getValorCostoProducto() {
      return this.valorCostoProducto;
   }

   public String getValorVentaProducto() {
      return this.valorVentaProducto;
   }

   public String getPreparacionProducto() {
      return this.preparacionProducto;
   }

   public String getFotoProducto() {
      return this.fotoProducto;
   }

   public String getObservacionProducto() {
      return this.observacionProducto;
   }

   public void grabar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "insert into producto values (";
            var6 = var6 + "'" + this.codigoProducto + "',";
            var6 = var6 + "'" + this.nombreProducto + "',";
            var6 = var6 + "'" + this.codigoFamilia + "',";
            var6 = var6 + "'" + this.codigoSubfamilia + "',";
            var6 = var6 + "'" + this.codigoOtraCaracteristica + "',";
            var6 = var6 + "'" + this.codigoUnidadMedida + "',";
            var6 = var6 + this.stockCriticoProducto + ",";
            var6 = var6 + this.valorCostoProducto + ",";
            var6 = var6 + this.valorVentaProducto + ",";
            var6 = var6 + "'" + this.preparacionProducto + "',";
            var6 = var6 + "'" + this.tipoProducto + "',";
            var6 = var6 + "'" + this.fotoProducto + "',";
            var6 = var6 + "'" + this.observacionProducto + "')";
            int var7 = var5.executeUpdate(var6);
            if (var7 == 1) {
               var5.close();
            }

            var4.close();
         }
      } catch (Exception var8) {
         System.out.println(var8);
      }

   }

   public void modificar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "update producto set ";
            var6 = var6 + "codigoproducto = " + "'" + this.codigoProducto + "', ";
            var6 = var6 + "nombreproducto = " + "'" + this.nombreProducto + "', ";
            var6 = var6 + "codigofamilia = " + "'" + this.codigoFamilia + "', ";
            var6 = var6 + "codigosubfamilia = " + "'" + this.codigoSubfamilia + "', ";
            var6 = var6 + "codigootracaracteristica = " + "'" + this.codigoOtraCaracteristica + "', ";
            var6 = var6 + "codigounidadmedida = " + "'" + this.codigoUnidadMedida + "', ";
            var6 = var6 + "stockcriticoproducto = " + this.stockCriticoProducto + ", ";
            var6 = var6 + "valorcosto = " + this.valorCostoProducto + ", ";
            var6 = var6 + "valorventa = " + this.valorVentaProducto + ", ";
            var6 = var6 + "preparacion = " + "'" + this.preparacionProducto + "', ";
            var6 = var6 + "tipoproducto = " + "'" + this.tipoProducto + "', ";
            var6 = var6 + "fotoproducto = " + "'" + this.fotoProducto + "', ";
            var6 = var6 + "observacion = " + "'" + this.observacionProducto + "' where codigoproducto = '" + this.codigoProducto + "'";
            System.out.println(var6);
            int var7 = var5.executeUpdate(var6);
            if (var7 == 1) {
               System.out.println("OK");
            }

            var5.close();
            var4.close();
         }
      } catch (Exception var8) {
         System.out.println(var8);
      }

   }

   public void eliminar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var5 = var4.createStatement();
            String var6 = "delete from producto where ";
            var6 = var6 + "codigoproducto = " + "'" + this.codigoProducto + "'";
            System.out.println(var6);
            int var7 = var5.executeUpdate(var6);
            if (var7 == 1) {
               System.out.println("OK");
            }

            var5.close();
            var4.close();
         }
      } catch (Exception var8) {
         System.out.println(var8);
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
            String var7 = "select * from producto where codigoproducto = '" + this.codigoProducto + "'";
            System.out.println(var7);
            ResultSet var8 = var6.executeQuery(var7);
            if (var8.next()) {
               System.out.println("Lo encontro");
               this.codigoProducto = var8.getString(1);
               this.nombreProducto = var8.getString(2);
               this.codigoFamilia = var8.getString(3);
               this.codigoSubfamilia = var8.getString(4);
               this.codigoOtraCaracteristica = var8.getString(5);
               this.codigoUnidadMedida = var8.getString(6);
               this.stockCriticoProducto = var8.getString(7);
               this.valorCostoProducto = var8.getString(8);
               this.valorVentaProducto = var8.getString(9);
               this.preparacionProducto = var8.getString(10);
               this.tipoProducto = var8.getString(11);
               this.fotoProducto = var8.getString(12);
               this.observacionProducto = var8.getString(13);
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
