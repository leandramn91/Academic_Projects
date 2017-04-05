/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Supplier;

import Business.Supplier.Products.ProductCatalog;
import Business.UserAccount.UserAccount;

/**
 *
 * @author Leandra
 */
public abstract class Supplier {

    private String supplyName;
    private ProductCatalog productCatalog;
    private UserAccount supplierUserAccount;

    public enum Type {

        RoadSupplier("Road Supplier"), SensorSupplier("Sensor Supplier");
        private String value;

        private Type(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

    public Supplier(String supplyName) {
        this.supplyName = supplyName;
        productCatalog = new ProductCatalog();
    }

    public UserAccount getSupplierUserAccount() {
        return supplierUserAccount;
    }

    public void setSupplierUserAccount(UserAccount supplierUserAccount) {
        this.supplierUserAccount = supplierUserAccount;
    }

    public String getSupplyName() {
        return supplyName;
    }

    public void setSupplyName(String supplyName) {
        this.supplyName = supplyName;
    }

    public ProductCatalog getProductCatalog() {
        return productCatalog;
    }

    public void setProductCatalog(ProductCatalog productCatalog) {
        this.productCatalog = productCatalog;
    }

    @Override
    public String toString() {
        return supplyName; //To change body of generated methods, choose Tools | Templates.
    }

}
