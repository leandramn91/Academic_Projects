/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.RoadMaintenanceRole;
import Business.Role.Role;
import java.util.ArrayList;

/**
 *
 * @author Leandra
 */
public class RoadMaintenanceOrganization extends Organization {

    public RoadMaintenanceOrganization() {
        super(Organization.Type.RoadMaintenance.getValue());
    }

    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList<>();
        roles.add(new RoadMaintenanceRole());
        return roles;
    }

}
