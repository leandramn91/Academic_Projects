/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Role;

import Business.Enterprise.Enterprise;
import Business.Main.EcoSystem;
import Business.Organization.Organization;
import Business.UserAccount.UserAccount;
import UserInterface.TrafficControlProcessorRole.TrafficControlProcessorWorkAreaJPanel;
import javax.swing.JPanel;

/**
 *
 * @author Leandra
 */
public class TrafficControlProcessorRole extends Role {

    @Override
    public JPanel createWorkArea(JPanel upc, UserAccount ua, Organization o, Enterprise e, EcoSystem system) {
        return new TrafficControlProcessorWorkAreaJPanel(upc, e, o, ua); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String toString() {
        return "TrafficControlProcessorRole";
    }

}
