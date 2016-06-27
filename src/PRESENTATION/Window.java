/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import java.awt.Toolkit;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import BUSINESS.ValidatorHelper;

/**
 *
 * @author felipebrizola
 */
public class Window extends javax.swing.JFrame {

    /**
     * Creates new form Window
     */
    public Window() {
        initComponents();
        Toolkit tk = Toolkit.getDefaultToolkit();
        int xSize = (int) tk.getScreenSize().getWidth();
        int ySize = (int) tk.getScreenSize().getHeight();
        this.setSize(xSize, ySize);
        jiBuyTicket.setVisible(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jiSearch = new javax.swing.JInternalFrame();
        jButton1 = new javax.swing.JButton();
        ticketIdField = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        fromTextField = new javax.swing.JTextField();
        toTextField = new javax.swing.JTextField();
        seatTextField = new javax.swing.JTextField();
        statusTextField = new javax.swing.JTextField();
        dateLabel = new javax.swing.JLabel();
        dateTextField = new javax.swing.JTextField();
        jiFlights = new javax.swing.JInternalFrame();
        jLabel5 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        confirmFlightButton = new javax.swing.JButton();
        departureTextField = new javax.swing.JTextField();
        searchFlightsButton = new javax.swing.JButton();
        jLabel16 = new javax.swing.JLabel();
        jiCheckin = new javax.swing.JInternalFrame();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jLabel3 = new javax.swing.JLabel();
        ticketIdTextField = new javax.swing.JTextField();
        SearchTicketsButton = new javax.swing.JButton();
        confirmCheckinButton = new javax.swing.JButton();
        jLabel10 = new javax.swing.JLabel();
        jiBuyTicket = new javax.swing.JInternalFrame();
        jLabel4 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        nameTextField = new javax.swing.JTextField();
        docTextField = new javax.swing.JTextField();
        buyTicketButton = new javax.swing.JButton();
        descriptionTextField = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        priceWithDiscTextField = new javax.swing.JTextField();
        jLabel15 = new javax.swing.JLabel();
        priceTextField = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("ACME");

        jiSearch.setMaximizable(true);
        jiSearch.setResizable(true);
        jiSearch.setVisible(true);

        jButton1.setText("Pesquisar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Lucida Grande", 1, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("PESQUISA PASSAGEM");

        jLabel2.setText("Numero localizador");

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel6.setText("Origem:");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 35, -1, -1));

        jLabel7.setText("Destino:");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 79, -1, -1));

        jLabel8.setText("Assento");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 123, -1, -1));

        jLabel9.setText("Status:");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 167, -1, -1));

        fromTextField.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));
        fromTextField.setEnabled(false);
        jPanel1.add(fromTextField, new org.netbeans.lib.awtextra.AbsoluteConstraints(77, 30, 90, -1));

        toTextField.setEnabled(false);
        jPanel1.add(toTextField, new org.netbeans.lib.awtextra.AbsoluteConstraints(77, 74, 90, -1));

        seatTextField.setEnabled(false);
        jPanel1.add(seatTextField, new org.netbeans.lib.awtextra.AbsoluteConstraints(77, 118, 90, -1));

        statusTextField.setEnabled(false);
        jPanel1.add(statusTextField, new org.netbeans.lib.awtextra.AbsoluteConstraints(77, 162, 90, -1));

        dateLabel.setText("Data:");
        jPanel1.add(dateLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 211, -1, -1));

        dateTextField.setEnabled(false);
        jPanel1.add(dateTextField, new org.netbeans.lib.awtextra.AbsoluteConstraints(77, 206, 90, -1));

        javax.swing.GroupLayout jiSearchLayout = new javax.swing.GroupLayout(jiSearch.getContentPane());
        jiSearch.getContentPane().setLayout(jiSearchLayout);
        jiSearchLayout.setHorizontalGroup(
            jiSearchLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jiSearchLayout.createSequentialGroup()
                .addGroup(jiSearchLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jiSearchLayout.createSequentialGroup()
                        .addGap(61, 61, 61)
                        .addComponent(jButton1))
                    .addGroup(jiSearchLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 272, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jiSearchLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(ticketIdField, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jiSearchLayout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 189, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jiSearchLayout.setVerticalGroup(
            jiSearchLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jiSearchLayout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jiSearchLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(ticketIdField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 252, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(15, Short.MAX_VALUE))
        );

        jiFlights.setMaximizable(true);
        jiFlights.setResizable(true);
        jiFlights.setVisible(true);

        jLabel5.setFont(new java.awt.Font("Lucida Grande", 1, 24)); // NOI18N
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("VOOS");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Voo", "Origem", "Destino", "Valor"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        confirmFlightButton.setText("Confirmar");
        confirmFlightButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                confirmFlightButtonActionPerformed(evt);
            }
        });

        departureTextField.setText("dd/mm/aaaa");
        departureTextField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                departureTextFieldActionPerformed(evt);
            }
        });

        searchFlightsButton.setText("Pesquisar voos");
        searchFlightsButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchFlightsButtonActionPerformed(evt);
            }
        });

        jLabel16.setText("Data do voo:");

        javax.swing.GroupLayout jiFlightsLayout = new javax.swing.GroupLayout(jiFlights.getContentPane());
        jiFlights.getContentPane().setLayout(jiFlightsLayout);
        jiFlightsLayout.setHorizontalGroup(
            jiFlightsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jiFlightsLayout.createSequentialGroup()
                .addGroup(jiFlightsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jiFlightsLayout.createSequentialGroup()
                        .addGap(43, 43, 43)
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jiFlightsLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 257, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jiFlightsLayout.createSequentialGroup()
                        .addGap(77, 77, 77)
                        .addComponent(confirmFlightButton))
                    .addGroup(jiFlightsLayout.createSequentialGroup()
                        .addGap(58, 58, 58)
                        .addComponent(searchFlightsButton, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jiFlightsLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel16)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(departureTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(15, Short.MAX_VALUE))
        );
        jiFlightsLayout.setVerticalGroup(
            jiFlightsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jiFlightsLayout.createSequentialGroup()
                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jiFlightsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(departureTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel16))
                .addGap(4, 4, 4)
                .addComponent(searchFlightsButton)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 152, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(confirmFlightButton)
                .addContainerGap(20, Short.MAX_VALUE))
        );

        jiCheckin.setVisible(true);

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                { new Boolean(false),  new Boolean(false), null, null, null, null, null, null, null, null, null, null},
                { new Boolean(false),  new Boolean(false), null, null, null, null, null, null, null, null, null, null},
                { new Boolean(false),  new Boolean(false), null, null, null, null, null, null, null, null, null, null},
                { new Boolean(false),  new Boolean(false), null, null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Boolean.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTable2.getTableHeader().setReorderingAllowed(false);
        jScrollPane2.setViewportView(jTable2);

        jLabel3.setText("Numero localizador");

        SearchTicketsButton.setText("Pesquisar");
        SearchTicketsButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchTicketsButtonActionPerformed(evt);
            }
        });

        confirmCheckinButton.setText("Confirma checkin");
        confirmCheckinButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                confirmCheckinButtonActionPerformed(evt);
            }
        });

        jLabel10.setFont(new java.awt.Font("Lucida Grande", 1, 24)); // NOI18N
        jLabel10.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel10.setText("CHECKIN");

        javax.swing.GroupLayout jiCheckinLayout = new javax.swing.GroupLayout(jiCheckin.getContentPane());
        jiCheckin.getContentPane().setLayout(jiCheckinLayout);
        jiCheckinLayout.setHorizontalGroup(
            jiCheckinLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jiCheckinLayout.createSequentialGroup()
                .addGroup(jiCheckinLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jiCheckinLayout.createSequentialGroup()
                        .addGap(94, 94, 94)
                        .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jiCheckinLayout.createSequentialGroup()
                        .addGap(117, 117, 117)
                        .addComponent(confirmCheckinButton))
                    .addGroup(jiCheckinLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(ticketIdTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchTicketsButton))
                    .addGroup(jiCheckinLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 336, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jiCheckinLayout.setVerticalGroup(
            jiCheckinLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jiCheckinLayout.createSequentialGroup()
                .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jiCheckinLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(ticketIdTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(SearchTicketsButton))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 93, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(confirmCheckinButton)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jiBuyTicket.setVisible(true);

        jLabel4.setText("Nome:");

        jLabel11.setFont(new java.awt.Font("Lucida Grande", 1, 24)); // NOI18N
        jLabel11.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel11.setText("IDENTIFICACAO PASSAGEIRO");

        jLabel12.setText("Documento");

        buyTicketButton.setText("Confirmar");
        buyTicketButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buyTicketButtonActionPerformed(evt);
            }
        });

        descriptionTextField.setEditable(false);

        jLabel13.setText("Promoção");

        jLabel14.setText("Valor com desconto");

        priceWithDiscTextField.setEditable(false);

        jLabel15.setText("Valor original");

        priceTextField.setEditable(false);

        javax.swing.GroupLayout jiBuyTicketLayout = new javax.swing.GroupLayout(jiBuyTicket.getContentPane());
        jiBuyTicket.getContentPane().setLayout(jiBuyTicketLayout);
        jiBuyTicketLayout.setHorizontalGroup(
            jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jiBuyTicketLayout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jiBuyTicketLayout.createSequentialGroup()
                        .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel14)
                            .addComponent(jLabel15))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(priceTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 82, Short.MAX_VALUE)
                            .addComponent(priceWithDiscTextField))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jiBuyTicketLayout.createSequentialGroup()
                        .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jiBuyTicketLayout.createSequentialGroup()
                                .addComponent(jLabel13)
                                .addGap(18, 18, 18)
                                .addComponent(descriptionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 263, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jiBuyTicketLayout.createSequentialGroup()
                                .addComponent(jLabel12)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(nameTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 241, Short.MAX_VALUE)
                                    .addComponent(docTextField))))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
            .addGroup(jiBuyTicketLayout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel11)
                    .addComponent(jLabel4))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jiBuyTicketLayout.createSequentialGroup()
                .addGap(108, 108, 108)
                .addComponent(buyTicketButton)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jiBuyTicketLayout.setVerticalGroup(
            jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jiBuyTicketLayout.createSequentialGroup()
                .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(7, 7, 7)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(nameTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel12)
                    .addComponent(docTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel13)
                    .addComponent(descriptionTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel15, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(priceTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(7, 7, 7)
                .addGroup(jiBuyTicketLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel14)
                    .addComponent(priceWithDiscTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(11, 11, 11)
                .addComponent(buyTicketButton)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jiBuyTicket, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jiCheckin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 8, Short.MAX_VALUE)
                .addComponent(jiFlights, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jiSearch, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 133, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jiSearch, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jiCheckin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(26, 26, 26)
                        .addComponent(jiBuyTicket, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jiFlights, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(247, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            ctrl.getTickets(ticketIdField.getText(), fromTextField, toTextField, seatTextField, statusTextField, dateTextField);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void searchFlightsButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchFlightsButtonActionPerformed
        try {
            ctrl.buildGridFlights(jTable1, departureTextField.getText());
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }//GEN-LAST:event_searchFlightsButtonActionPerformed

    private void SearchTicketsButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchTicketsButtonActionPerformed
        if (ValidatorHelper.getInstance().validateConfirmCheckin(ticketIdTextField.getText())){
           JOptionPane.showMessageDialog(null, "O campo de pesquisa de passagem deve conter entre 1 e 3 caracteres");
        }
        else {
            try {
                ctrl.buildGridCheckin(jTable2,ticketIdTextField.getText());
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e.getMessage());
            }
        }
    }//GEN-LAST:event_SearchTicketsButtonActionPerformed

    private void departureTextFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_departureTextFieldActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_departureTextFieldActionPerformed

    private void confirmCheckinButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_confirmCheckinButtonActionPerformed
        if (ValidatorHelper.getInstance().validateConfirmCheckin(ticketIdTextField.getText())){
           JOptionPane.showMessageDialog(null, "O campo de pesquisa de passagem deve conter entre 1 e 3 caracteres");
        }
        else {
        String row = Integer.toString(jTable2.getSelectedRow());
        String column = Integer.toString(jTable2.getSelectedColumn());
        try {
            ctrl.confirmCheckin(ticketIdTextField.getText(), row+column);
            JOptionPane.showMessageDialog(null, "Checkin realizado com sucesso");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }
        
    }//GEN-LAST:event_confirmCheckinButtonActionPerformed

    private void confirmFlightButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_confirmFlightButtonActionPerformed

        int row = jTable1.getSelectedRow();
        String flightId = jTable1.getValueAt(row, 0).toString();
        String price = jTable1.getValueAt(row, 3).toString();
        try {
            jiBuyTicket(flightId, price, priceWithDiscTextField, descriptionTextField);
            jiBuyTicket.setVisible(true);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }      
        
    }//GEN-LAST:event_confirmFlightButtonActionPerformed

    private void buyTicketButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buyTicketButtonActionPerformed
        int row = jTable1.getSelectedRow();
        String flightId = jTable1.getValueAt(row, 0).toString();
        if (ValidatorHelper.getInstance().validateName(nameTextField.getText())){
            JOptionPane.showMessageDialog(null, "O campo nome deve conter entre 5 e 70 caracteres");
        }
        else if (ValidatorHelper.getInstance().validateDocument(docTextField.getText())){
            JOptionPane.showMessageDialog(null, "O campo documento deve conter 11 caracteres");
        }
        else {
        try {
            ctrl.buyTicket(nameTextField.getText(), docTextField.getText(), flightId);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        JOptionPane.showMessageDialog(null, "compra realizada com sucesso");
        jiBuyTicket.setVisible(false);
        }
    }//GEN-LAST:event_buyTicketButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Window.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Window.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Window.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Window.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Window().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton SearchTicketsButton;
    private javax.swing.JButton buyTicketButton;
    private javax.swing.JButton confirmCheckinButton;
    private javax.swing.JButton confirmFlightButton;
    private javax.swing.JLabel dateLabel;
    private javax.swing.JTextField dateTextField;
    private javax.swing.JTextField departureTextField;
    private javax.swing.JTextField descriptionTextField;
    private javax.swing.JTextField docTextField;
    private javax.swing.JTextField fromTextField;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    private javax.swing.JInternalFrame jiBuyTicket;
    private javax.swing.JInternalFrame jiCheckin;
    private javax.swing.JInternalFrame jiFlights;
    private javax.swing.JInternalFrame jiSearch;
    private javax.swing.JTextField nameTextField;
    private javax.swing.JTextField priceTextField;
    private javax.swing.JTextField priceWithDiscTextField;
    private javax.swing.JButton searchFlightsButton;
    private javax.swing.JTextField seatTextField;
    private javax.swing.JTextField statusTextField;
    private javax.swing.JTextField ticketIdField;
    private javax.swing.JTextField ticketIdTextField;
    private javax.swing.JTextField toTextField;
    // End of variables declaration//GEN-END:variables
    private MainController ctrl;
    
    public void setPrincipal(MainController mc) {
        this.ctrl = mc;
    }

    private void jiBuyTicket(String flightId, String price, JTextField discountValueTextField, JTextField descriptionTextField) throws Exception {
        try {
            priceTextField.setText(price);
            ctrl.getPromotion(flightId, price, discountValueTextField, descriptionTextField);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
        
    }
}

