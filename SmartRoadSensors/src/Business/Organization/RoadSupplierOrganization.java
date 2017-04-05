/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.RoadSupplierRole;
import Business.Role.Role;
import java.util.ArrayList;

/**
 *
 * @author Leandra
 */
public class RoadSupplierOrganization extends Organization {

    public RoadSupplierOrganization() {
        super(Organization.Type.RoadSupplier.getValue());
    }

    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList<>();
        roles.add(new RoadSupplierRole());
        return roles;
    }

}
