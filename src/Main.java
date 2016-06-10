/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import javax.swing.SwingUtilities;
import PRESENTATION.*;

/**
 *
 * @author Júlio
 */
public class Main {
    private static void createGui() {
        LoginModel m = new LoginModel();
        LoginView v = new LoginView();
        LoginController c = new LoginController();
        c.associaModel(m);
        c.associaView(v);
        v.inicializar();
        v.associaController(c);
        c.initModel(null, null);
        v.mostrar();
    }
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                 createGui();
            }
        });
    }
}
