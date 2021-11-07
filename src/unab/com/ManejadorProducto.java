package unab.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ManejadorProducto {
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

   public ArrayList consultar() {
      String var1 = "root";
      String var2 = "";
      String var3 = "jdbc:mysql://localhost/lapalmera2";
      Connection var4 = null;
      ArrayList var5 = new ArrayList();

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         var4 = DriverManager.getConnection(var3, var1, var2);
         if (var4 != null) {
            Statement var6 = var4.createStatement();
            String var7 = "select * from Producto where 1 = 1 ";
            if (!this.codigoProducto.equals("")) {
               var7 = var7 + "     and codigoProducto = '" + this.codigoProducto + "'";
            }

            if (!this.nombreProducto.equals("")) {
               var7 = var7 + "     and nombreProducto = '" + this.nombreProducto + "'";
            }

            if (!this.codigoFamilia.equals("")) {
               var7 = var7 + "     and codigoFamilia = '" + this.codigoFamilia + "'";
            }

            if (!this.codigoSubfamilia.equals("")) {
               var7 = var7 + "     and codigoSubfamilia = '" + this.codigoSubfamilia + "'";
            }

            if (!this.codigoOtraCaracteristica.equals("")) {
               var7 = var7 + "     and codigoOtraCaracteristica = '" + this.codigoOtraCaracteristica + "'";
            }

            if (!this.stockCriticoProducto.equals("")) {
               var7 = var7 + "     and stockCriticoProducto = " + this.stockCriticoProducto;
            }

            if (!this.codigoUnidadMedida.equals("")) {
               var7 = var7 + "     and codigoUnidadMedida = '" + this.codigoUnidadMedida + "'";
            }

            if (!this.tipoProducto.equals("")) {
               var7 = var7 + "     and tipoproducto = '" + this.tipoProducto + "'";
            }

            if (!this.valorCostoProducto.equals("")) {
               var7 = var7 + "     and valorCostoProducto = " + this.valorCostoProducto;
            }

            if (!this.valorVentaProducto.equals("")) {
               var7 = var7 + "     and valorVentaProducto = " + this.valorVentaProducto;
            }

            if (!this.preparacionProducto.equals("")) {
               var7 = var7 + "     and preparacionProducto = '" + this.preparacionProducto + "'";
            }

            if (!this.fotoProducto.equals("")) {
               var7 = var7 + "     and fotoProducto = '" + this.fotoProducto + "'";
            }

            if (!this.observacionProducto.equals("")) {
               var7 = var7 + "     and observacionProducto = '" + this.observacionProducto + "'";
            }

            ResultSet var8 = var6.executeQuery(var7);

            while(var8.next()) {
               Producto var9 = new Producto();
               var9.setCodigoProducto(var8.getString(1));
               var9.setNombreProducto(var8.getString(2));
               var9.setCodigoFamilia(var8.getString(3));
               var9.setCodigoSubfamilia(var8.getString(4));
               var9.setCodigoOtraCaracteristica(var8.getString(5));
               var9.setCodigoUnidadMedida(var8.getString(6));
               var9.setStockCriticoProducto(var8.getString(7));
               var9.setValorCostoProducto(var8.getString(8));
               var9.setValorVentaProducto(var8.getString(9));
               var9.setPreparacionProducto(var8.getString(10));
               var9.setTipoProducto(var8.getString(11));
               var9.setFotoProducto(var8.getString(12));
               var9.setObservacionProducto(var8.getString(13));
               var5.add(var9);
            }

            var6.close();
            var4.close();
         }
      } catch (Exception var10) {
         System.out.println(var10);
      }

      return var5;
   }
}
