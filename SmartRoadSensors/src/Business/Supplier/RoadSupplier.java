/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Supplier;

import Business.Organization.Organization;
import Business.Supplier.Products.ProductCatalog;

/**
 *
 * @author Leandra
 */
public class RoadSupplier extends Supplier {

    public RoadSupplier() {
        super(Supplier.Type.RoadSupplier.getValue());
    }
}
