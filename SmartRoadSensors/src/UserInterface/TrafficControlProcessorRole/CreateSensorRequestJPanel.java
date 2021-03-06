/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.TrafficControlProcessorRole;

import Business.Enterprise.Enterprise;
import Business.Organization.Organization;
import Business.Organization.SensorSupplierOrganization;
import Business.Road.Road;
import Business.Sensor.Sensor;
import Business.Supplier.Products.Product;
import Business.UserAccount.UserAccount;
import Business.WorkQueue.MaintainenceWorkRequest;
import java.awt.CardLayout;
import java.awt.Component;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author Leandra
 */
public class CreateSensorRequestJPanel extends javax.swing.JPanel {

    JPanel userProcessContainer;
    Enterprise e;
    UserAccount ua;
    Road r;
    String sensorLocationId;

    /**
     * Creates new form CreateSensorRequestJPanel
     */
    public CreateSensorRequestJPanel(JPanel userProcessContainer, Enterprise e, UserAccount ua, Road r, String sensorLocationId) {
        initComponents();
        this.userProcessContainer = userProcessContainer;
        this.e = e;
        this.ua = ua;
        this.r = r;
        this.sensorLocationId = sensorLocationId;
        for (Product p : r.getSensorSupplier().getProductCatalog().getProductcatalog()) {
            if (p.getProdName().equalsIgnoreCase(r.getSensorType().getProdName())) {
                sensorIdjTextField.setText(String.valueOf(p.getProdId()));
            }
        }

        roadIdjTextField.setText(String.valueOf(r.getRoadid()));
        roadNamejTextField.setText(r.getRoadName());
        sesnorSupplierjTextField.setText(r.getSensorSupplier().getSupplyName());
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
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        backjButton = new javax.swing.JButton();
        createjButton = new javax.swing.JButton();
        sensorIdjTextField = new javax.swing.JTextField();
        roadIdjTextField = new javax.swing.JTextField();
        roadNamejTextField = new javax.swing.JTextField();
        probelmjTextField = new javax.swing.JTextField();
        sesnorSupplierjTextField = new javax.swing.JTextField();
        problemjLabel = new javax.swing.JLabel();

        jLabel1.setFont(new java.awt.Font("Segoe Print", 1, 36)); // NOI18N
        jLabel1.setText("Sensor Request");

        jLabel2.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        jLabel2.setText("Sensor ID");

        jLabel3.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        jLabel3.setText("Road ID");

        jLabel4.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        jLabel4.setText("Road Name");

        jLabel5.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        jLabel5.setText("Problem");

        jLabel6.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        jLabel6.setText("Sensor Supplier");

        backjButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        backjButton.setText("Back");
        backjButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        backjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backjButtonActionPerformed(evt);
            }
        });

        createjButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        createjButton.setText("Create");
        createjButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        createjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                createjButtonActionPerformed(evt);
            }
        });

        sensorIdjTextField.setEditable(false);
        sensorIdjTextField.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        roadIdjTextField.setEditable(false);
        roadIdjTextField.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        roadNamejTextField.setEditable(false);
        roadNamejTextField.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        probelmjTextField.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        probelmjTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                probelmjTextFieldActionPerformed(evt);
            }
        });

        sesnorSupplierjTextField.setEditable(false);
        sesnorSupplierjTextField.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        problemjLabel.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(185, 185, 185)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(52, 52, 52)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)
                            .addComponent(jLabel2)
                            .addComponent(jLabel6)
                            .addComponent(backjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(176, 176, 176)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(createjButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(sesnorSupplierjTextField)
                            .addComponent(probelmjTextField)
                            .addComponent(roadNamejTextField)
                            .addComponent(roadIdjTextField)
                            .addComponent(sensorIdjTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 149, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(52, 52, 52)
                        .addComponent(problemjLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 259, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(130, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(47, 47, 47)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(31, 31, 31)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel2)
                    .addComponent(sensorIdjTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(40, 40, 40)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel3)
                    .addComponent(roadIdjTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(40, 40, 40)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel4)
                    .addComponent(roadNamejTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(43, 43, 43)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel5)
                        .addComponent(probelmjTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(problemjLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(37, 37, 37)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(sesnorSupplierjTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(46, 46, 46)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(backjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(createjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(299, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void probelmjTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_probelmjTextFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_probelmjTextFieldActionPerformed

    private void backjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_backjButtonActionPerformed
        userProcessContainer.remove(this);
        Component[] componentArray = userProcessContainer.getComponents();
        Component component = componentArray[componentArray.length - 1];
        TrafficControlProcessorWorkAreaJPanel tcpwjp = (TrafficControlProcessorWorkAreaJPanel) component;
        tcpwjp.populateRequestTable();
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        layout.previous(userProcessContainer);
    }//GEN-LAST:event_backjButtonActionPerformed

    private void createjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_createjButtonActionPerformed
        // TODO add your handling code here:

        try {

            boolean problemTrue = validateProblem();

            if (problemTrue) {
                String message = probelmjTextField.getText();

                MaintainenceWorkRequest request = new MaintainenceWorkRequest();
                for (Sensor data : e.getSensorDataDirectory().getSensorDataList()) {
                    if (data.getSensorLocation().equalsIgnoreCase(sensorLocationId)) {
                        request.setSensorData(data);
                        break;
                    }
                }
                request.setMessage(message);
                request.setSender(ua);
                request.setReceiver(r.getSensorSupplier().getSupplierUserAccount());
                request.setRoad(r);
                request.setStatus("Sent");
                JOptionPane.showMessageDialog(null, "Your request has been sent");
                probelmjTextField.setText("");

                Organization org = null;
                for (Organization organization : e.getOrganizationDirectory().getOrganizationList()) {
                    if (organization instanceof SensorSupplierOrganization) {
                        org = organization;
                        break;
                    }
                }
                if (org != null) {
                    org.getWorkQueue().getWorkRequestList().add(request);
                    r.getSensorSupplier().getSupplierUserAccount().getWorkQueue().getWorkRequestList().add(request);
                    ua.getWorkQueue().getWorkRequestList().add(request);
                }
            }
        } catch (Exception e) {

            JOptionPane.showMessageDialog(null, " Please specify proper information", "Information", JOptionPane.INFORMATION_MESSAGE);
        }


    }//GEN-LAST:event_createjButtonActionPerformed

    public boolean validateProblem() {
        if (probelmjTextField.getText().trim().equals("")) {
            problemjLabel.setText("Please enter the problem");
            return false;
        } else if (!probelmjTextField.getText().matches("^[a-zA-Z ]*$")) {
            problemjLabel.setText("only characters");
            return false;
        } else {
            problemjLabel.setText("");
            return true;
        }
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton backjButton;
    private javax.swing.JButton createjButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JTextField probelmjTextField;
    private javax.swing.JLabel problemjLabel;
    private javax.swing.JTextField roadIdjTextField;
    private javax.swing.JTextField roadNamejTextField;
    private javax.swing.JTextField sensorIdjTextField;
    private javax.swing.JTextField sesnorSupplierjTextField;
    // End of variables declaration//GEN-END:variables
}
