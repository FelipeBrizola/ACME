/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import java.awt.BorderLayout;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author Júlio
 */
public class LoginView implements Observer{
    private JTextField emailText, passText;
    private JButton loginButton;
    private JFrame window;
    private JLabel emailLabel, passLabel;
    
    public void inicializar() {
        window = new JFrame("ACME - Login");
        emailLabel = new JLabel("Informe seu email");
        passLabel =  new JLabel("Informe sua senha");
        emailText = new JTextField(20);
        passText = new JTextField(20);
        loginButton = new JButton("Login");
        JPanel panel = new JPanel();
        panel.add(emailLabel);
        panel.add(emailText);
        panel.add(passLabel);
        panel.add(passText);
        panel.add(loginButton);
        window.getContentPane().add(panel);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.setLocationRelativeTo(null);
        window.pack();
    }
    
    public void mostrar() {
        window.setVisible(true);
    }
    
    public void associaController(LoginController c){
        loginButton.addActionListener(c);
    }

    public void setEmailText(String email) {
        emailText.setText(email);
    }
    
    public void setPasswordText(String pass) {
        passText.setText(pass);
    }
    
    @Override
    public void update(Observable o, Object arg) {
        String email = ((LoginModel)o).getEmail();
        setEmailText(email);
        String pass = ((LoginModel)o).getPass();
        setPasswordText(pass);
    }
}
