/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.AdministrativeRole;

import Business.Enterprise.Enterprise;
import java.awt.CardLayout;
import static java.lang.System.console;
import javax.swing.JPanel;

/**
 *
 * @author Leandra
 */
public class AdminWorkAreaJPanel extends javax.swing.JPanel {

    JPanel userProcessContainer;
    Enterprise e;

    /**
     * Creates new form AdminWorkAreaJPanel
     */
    public AdminWorkAreaJPanel(JPanel userProcessContainer, Enterprise e) {
        initComponents();
        this.userProcessContainer = userProcessContainer;
        this.e = e;
        valueLabel.setText(e.getName());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        manageOrganizationjButton = new javax.swing.JButton();
        manageUserjButton = new javax.swing.JButton();
        manageEmployeejButton = new javax.swing.JButton();
        enterpriseLabel = new javax.swing.JLabel();
        valueLabel = new javax.swing.JLabel();

        jLabel1.setFont(new java.awt.Font("Segoe Print", 1, 24)); // NOI18N
        jLabel1.setText("Administrative Role");

        manageOrganizationjButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        manageOrganizationjButton.setText("Manage Organization");
        manageOrganizationjButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        manageOrganizationjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                manageOrganizationjButtonActionPerformed(evt);
            }
        });

        manageUserjButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        manageUserjButton.setText("Manage User");
        manageUserjButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        manageUserjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                manageUserjButtonActionPerformed(evt);
            }
        });

        manageEmployeejButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        manageEmployeejButton.setText("Manage Employee");
        manageEmployeejButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        manageEmployeejButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                manageEmployeejButtonActionPerformed(evt);
            }
        });

        enterpriseLabel.setFont(new java.awt.Font("Segoe Print", 1, 18)); // NOI18N
        enterpriseLabel.setText("EnterPrise :");

        valueLabel.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        valueLabel.setText("<value>");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(196, 196, 196)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 262, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(187, 187, 187)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(enterpriseLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(29, 29, 29)
                                .addComponent(valueLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(64, 64, 64)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(manageUserjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(manageOrganizationjButton)
                                    .addComponent(manageEmployeejButton, javax.swing.GroupLayout.PREFERRED_SIZE, 153, javax.swing.GroupLayout.PREFERRED_SIZE))))))
                .addContainerGap(408, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(39, 39, 39)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(enterpriseLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(valueLabel))
                .addGap(34, 34, 34)
                .addComponent(manageOrganizationjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(64, 64, 64)
                .addComponent(manageEmployeejButton, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(70, 70, 70)
                .addComponent(manageUserjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(207, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void manageOrganizationjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_manageOrganizationjButtonActionPerformed

        // TODO add your handling code here:
        ManageOrganizationJPanel manageOrganizationJPanel = new ManageOrganizationJPanel(userProcessContainer, e.getOrganizationDirectory());
        userProcessContainer.add("manageOrganizationJPanel", manageOrganizationJPanel);
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        layout.next(userProcessContainer);
    }//GEN-LAST:event_manageOrganizationjButtonActionPerformed

    private void manageUserjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_manageUserjButtonActionPerformed
        // TODO add your handling code here:
        ManageUserJPanel mujp = new ManageUserJPanel(userProcessContainer, e);
        userProcessContainer.add("ManageUserJPanel", mujp);
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        layout.next(userProcessContainer);
    }//GEN-LAST:event_manageUserjButtonActionPerformed

    private void manageEmployeejButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_manageEmployeejButtonActionPerformed
        // TODO add your handling code here:
        ManageEmployeeJPanel mejp = new ManageEmployeeJPanel(userProcessContainer, e);
        userProcessContainer.add("ManageEmployeeJPanel", mejp);
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        layout.next(userProcessContainer);
    }//GEN-LAST:event_manageEmployeejButtonActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel enterpriseLabel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JButton manageEmployeejButton;
    private javax.swing.JButton manageOrganizationjButton;
    private javax.swing.JButton manageUserjButton;
    private javax.swing.JLabel valueLabel;
    // End of variables declaration//GEN-END:variables
}
