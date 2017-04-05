/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Supplier.Products;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Leandra
 */
public class ProductCatalog {

    private List<Product> productCatalog;

    public ProductCatalog() {
        productCatalog = new ArrayList<Product>();
    }

    public List<Product> getProductcatalog() {
        return productCatalog;
    }

    public void addProduct(Product p) {
        productCatalog.add(p);
    }

    public void removeProduct(Product p) {
        productCatalog.remove(p);
    }

}
