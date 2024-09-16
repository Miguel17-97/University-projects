package proyecto;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

public class Ventana_bienvenida extends JFrame {

    //Defino atributos gráficos que contendrá la ventana
    private JLabel lblbienvenido;
    private JButton btncontinuar, btnsalir;
    private JPanel pnlbienvenida;

    public Ventana_bienvenida() {

        //Propiedades de la ventana
        this.setSize(600, 500);
        this.setTitle("BIENVENIDA");
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        //Propiedades del label "Bienvenido"
        lblbienvenido = new JLabel("Bienvenido a figuras geométricas");
        lblbienvenido.setBounds(50, 30, 500, 40);
        lblbienvenido.setHorizontalAlignment(SwingConstants.CENTER);
        lblbienvenido.setHorizontalTextPosition(SwingConstants.CENTER);
        lblbienvenido.setFont(new Font("arial", 2, 30));
        lblbienvenido.setOpaque(false);

        //Propiedades de los botones
        btncontinuar = new JButton("Continuar");
        btncontinuar.setBounds(120, 300, 90, 30);

        ActionListener oyente_continuar = (ActionEvent ae) -> {

            this.setVisible(false);
            Ventana_seleccionar_figura nueva = new Ventana_seleccionar_figura();
            nueva.setVisible(true);
        };

        btncontinuar.addActionListener(oyente_continuar);
        //Creamos el botón salir

        btnsalir = new JButton("Salir");
        btnsalir.setBounds(340, 300, 90, 30);

        ActionListener oyente_salir = (ActionEvent ae) -> {

            int respuesta;

            respuesta = JOptionPane.showConfirmDialog(this, "¿Esta seguro de que quiere salir?", "Confirmacion",
                    JOptionPane.YES_NO_OPTION);

            if (respuesta == JOptionPane.YES_OPTION) {
                System.exit(0);
            }
        };
        btnsalir.addActionListener(oyente_salir);

        pnlbienvenida = new JPanel();
        pnlbienvenida.setLayout(null);
        pnlbienvenida.add(lblbienvenido);
        pnlbienvenida.add(btncontinuar);
        pnlbienvenida.add(btnsalir);
        this.getContentPane().add(pnlbienvenida);

    }

}
