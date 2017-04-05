/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Main;

import Business.Main.EcoSystem;

import Business.Employee.Employee;
import Business.Employee.EmployeeDirectory;
import Business.Enterprise.Enterprise;
import Business.Network.Network;
import Business.Role.AdminRole;
import Business.UserAccount.UserAccount;
import Business.Enterprise.EnterpriseDirectory;
import Business.Enterprise.SmartRoadEnterprise;
import Business.Organization.OrganizationDirectory;
import Business.Organization.Organization;
import Business.Role.SystemAdminRole;

/**
 *
 * @author Leandra
 */
public class ConfigureABuisness {

    public static EcoSystem configure() {
//        EcoSystem system = EcoSystem.getInstance();
//        system.setName("Smart Road Corporation");
//        Network network = null;
//        network = system.createAndAddNetwork();
//        network.setName("Boston Smart Road Corporation");
//        network.getEnterpriseDirectory().createAndAddEnterprise("Bolyston Enterprise", Enterprise.EnterpriseType.SmartRoad);
//        Employee employee = system.getEmployeeDirectory().createEmployee("RRH");
//        system.getUserAccountDirectory().createUserAccount("admin", "admin", employee, new AdminRole());
//        return system;

        EcoSystem system = EcoSystem.getInstance();

        //Create a network
        //create an enterprise
        //initialize some organizations
        //have some employees 
        //create user account
        Employee employee = system.getEmployeeDirectory().createEmployee("RRH");

        UserAccount ua = system.getUserAccountDirectory().createUserAccount("sysadmin", "sysadmin", employee, new SystemAdminRole());

        return system;
    }

}
