/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.SensorSupplierRole;

import Business.Enterprise.Enterprise;
import Business.Road.Road;
import Business.UserAccount.UserAccount;
import Business.WorkQueue.MaintainenceWorkRequest;
import Business.WorkQueue.WorkRequest;
import java.awt.CardLayout;
import java.awt.Component;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author Leandra
 */
public class ProcessSensorRequestJPanel extends javax.swing.JPanel {

    JPanel userProcessContainer;
    Road r;
    UserAccount ua;
    Enterprise e;
    WorkRequest wr;

    /**
     * Creates new form SensorDetailsJPanel
     */
    public ProcessSensorRequestJPanel(JPanel userProcessContainer, Road r, UserAccount ua, Enterprise e, WorkRequest wr) {
        initComponents();
        this.userProcessContainer = userProcessContainer;
        this.r = r;
        this.ua = ua;
        this.e = e;
        this.wr = wr;

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        messagejTextField = new javax.swing.JTextField();
        backjButton = new javax.swing.JButton();
        processjButton = new javax.swing.JButton();
        sesnorRequestjLabel = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        messagejLabel = new javax.swing.JLabel();

        messagejTextField.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        backjButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        backjButton.setText("Back");
        backjButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        backjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backjButtonActionPerformed(evt);
            }
        });

        processjButton.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        processjButton.setText("Process");
        processjButton.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        processjButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                processjButtonActionPerformed(evt);
            }
        });

        sesnorRequestjLabel.setFont(new java.awt.Font("Segoe Print", 1, 36)); // NOI18N
        sesnorRequestjLabel.setText("Sensor Request");

        jLabel2.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N
        jLabel2.setText("Message");

        messagejLabel.setFont(new java.awt.Font("Segoe Print", 0, 14)); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(220, 220, 220)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(messagejTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 177, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(backjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(235, 235, 235)
                        .addComponent(processjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(59, 59, 59)
                        .addComponent(sesnorRequestjLabel)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 40, Short.MAX_VALUE)
                .addComponent(messagejLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 259, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(50, 50, 50)
                .addComponent(sesnorRequestjLabel)
                .addGap(119, 119, 119)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel2)
                        .addComponent(messagejTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(messagejLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(95, 95, 95)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(backjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(processjButton, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(60, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void backjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_backjButtonActionPerformed
        // TODO add your handling code here:
        userProcessContainer.remove(this);
        Component[] componentArray = userProcessContainer.getComponents();
        Component component = componentArray[componentArray.length - 1];
        SensorSupplierWorkAreaJPanel sswjp = (SensorSupplierWorkAreaJPanel) component;
        sswjp.populateSensorMaintanenceTable();
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        layout.previous(userProcessContainer);
    }//GEN-LAST:event_backjButtonActionPerformed

    private void processjButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_processjButtonActionPerformed
        // TODO add your handling code here:
        try {

            boolean problemTrue = validateMessage();

            if (problemTrue) {
                ((MaintainenceWorkRequest) wr).setTestResult("Processed");
                wr.setStatus(messagejTextField.getText());
                JOptionPane.showMessageDialog(null, "Your message has been sent");
                messagejTextField.setText("");
            }
        } catch (Exception e) {

            JOptionPane.showMessageDialog(null, " Please specify proper information", "Information", JOptionPane.INFORMATION_MESSAGE);
        }

    }//GEN-LAST:event_processjButtonActionPerformed

    public boolean validateMessage() {
        if (messagejTextField.getText().trim().equals("")) {
            messagejLabel.setText("Please enter the message");
            return false;
        } else if (!messagejTextField.getText().matches("^[a-zA-Z ]*$")) {
            messagejLabel.setText("only characters");
            return false;
        } else {
            messagejLabel.setText("");
            return true;
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton backjButton;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel messagejLabel;
    private javax.swing.JTextField messagejTextField;
    private javax.swing.JButton processjButton;
    private javax.swing.JLabel sesnorRequestjLabel;
    // End of variables declaration//GEN-END:variables
}