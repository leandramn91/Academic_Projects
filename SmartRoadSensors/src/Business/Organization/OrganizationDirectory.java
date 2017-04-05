/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import static Business.Organization.Organization.Type.Customer;
import java.util.ArrayList;

/**
 *
 * @author Leandra
 */
public class OrganizationDirectory {

    private ArrayList<Organization> organizationList;

    public OrganizationDirectory() {
        organizationList = new ArrayList<>();
    }

    public ArrayList<Organization> getOrganizationList() {
        return organizationList;
    }

    public Organization createOrganization(Organization.Type type) {
        Organization organization = null;
        if (type.getValue().equals(Organization.Type.RoadMaintenance.getValue())) {
            organization = new RoadMaintenanceOrganization();
            organizationList.add(organization);
        } else if (type.getValue().equals(Organization.Type.RoadSupplier.getValue())) {
            organization = new RoadSupplierOrganization();
            organizationList.add(organization);
        } else if (type.getValue().equals(Organization.Type.SensorSupplier.getValue())) {
            organization = new SensorSupplierOrganization();
            organizationList.add(organization);
        } else if (type.getValue().equals(Organization.Type.TrafficControlProcessor.getValue())) {
            organization = new TrafficControlProcessorOrganization();
            organizationList.add(organization);
        } else if (type.getValue().equals(Organization.Type.Customer.getValue())) {
            organization = new CustomerOrganization();
            organizationList.add(organization);
        }

        return organization;
    }

}
