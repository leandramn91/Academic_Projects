/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.Role;
import Business.Role.TrafficControlProcessorRole;
import java.util.ArrayList;

/**
 *
 * @author Leandra
 */
public class TrafficControlProcessorOrganization extends Organization {

    public TrafficControlProcessorOrganization() {
        super(Organization.Type.TrafficControlProcessor.getValue());
    }

    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList<>();
        roles.add(new TrafficControlProcessorRole());
        return roles;
    }

}
