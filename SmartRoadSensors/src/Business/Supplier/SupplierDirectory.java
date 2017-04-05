/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Supplier;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Leandra
 */
public class SupplierDirectory {

    private List<Supplier> supplierList;

    public SupplierDirectory() {

        supplierList = new ArrayList<Supplier>();
    }

    public List<Supplier> getSupplierlist() {
        return supplierList;
    }

    public Supplier createSupplier(Supplier.Type type) {
        Supplier supplier = null;
        if (type.getValue().equals(Supplier.Type.RoadSupplier.getValue())) {
            supplier = new RoadSupplier();
            supplierList.add(supplier);
        } else if (type.getValue().equals(Supplier.Type.SensorSupplier.getValue())) {
            supplier = new SensorSupplier();
            supplierList.add(supplier);
        }

        return supplier;
    }

}
