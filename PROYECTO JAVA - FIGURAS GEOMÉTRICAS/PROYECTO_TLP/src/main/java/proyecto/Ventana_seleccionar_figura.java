package proyecto;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

public class Ventana_seleccionar_figura extends JFrame {

    private JLabel lblfigura, lblseleccion, lblresultado;
    private JButton btncolor, btnaceptar;
    private JComboBox combofigura;
    private JPanel pnlseleccion;
    private Color color;
    int x, y;

    public Ventana_seleccionar_figura() {
        //Pripiedades de la ventana
        this.setSize(700, 800);
        this.setTitle("SELECCIONA TU FIGURA: ");
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        //Propiedades de los labels de ventana.
        lblseleccion = new JLabel("Color y figura");
        lblseleccion.setBounds(135, 30, 400, 40);
        lblseleccion.setHorizontalAlignment(SwingConstants.CENTER);
        lblseleccion.setHorizontalTextPosition(SwingConstants.CENTER);
        lblseleccion.setFont(new Font("arial", 2, 20));
        lblseleccion.setOpaque(false);

        //Propiedades del label Figura
        lblfigura = new JLabel("Figura: ");
        lblfigura.setBounds(155, 100, 70, 30);

        //Propiedades del label Resultado
        lblresultado = new JLabel("Resultado: ");
        lblresultado.setBounds(70, 200, 70, 30);

        //Realizamos el combobox de las figuras...
        String[] figuras = {"Circulo", "Cuadrado", "Rectangulo", "Triangulo"};
        combofigura = new JComboBox(figuras);
        combofigura.setBounds(205, 100, 120, 30);

        //Propiedades del boton color
        btncolor = new JButton("Color");
        btncolor.setBounds(375, 100, 90, 30);
        ActionListener oyente_color = (ActionEvent ae) -> {

            //Paleta de colores
            color = JColorChooser.showDialog(null, "Selecciona uno", color);
            if (color == null) {

                color = (java.awt.Color.BLACK);

            }
        };

        btncolor.addActionListener(oyente_color);

        //Propiedades del botón aceptar
        btnaceptar = new JButton("Aceptar");
        btnaceptar.setBounds(285, 165, 90, 30);
        ActionListener oyente_aceptar = (ActionEvent ae) -> {

            // Aqui ira el resultado obtenido de la figura y el color
            // System.out.println(combofigura.getSelectedItem().toString()  +  color);
            // Aqui validamos que figura seleccionó el usuario para empezar a graficar.
            //Graphics g = null;
            x = Integer.parseInt(JOptionPane.showInputDialog("Ingrese el ancho x:"));
            y = Integer.parseInt(JOptionPane.showInputDialog("Ingrese el alto y:"));
            repaint();
        };

        btnaceptar.addActionListener(oyente_aceptar);

        //Instanciamos el panel para colocar todos estos elementos dentro de el
        pnlseleccion = new JPanel();
        pnlseleccion.setLayout(null);
        pnlseleccion.add(lblfigura);
        pnlseleccion.add(lblseleccion);
        pnlseleccion.add(lblresultado);
        pnlseleccion.add(combofigura);
        pnlseleccion.add(btncolor);
        pnlseleccion.add(btnaceptar);
        this.getContentPane().add(pnlseleccion);

    } // constructor 

    @Override
    public void paint(Graphics g) {

        super.paint(g);

        if (combofigura.getSelectedItem().toString().equals("Circulo")) {

            pintarComponenteCirculo(g, color, x, y);
        }
        if (combofigura.getSelectedItem().toString().equals("Cuadrado")) {

            pintarComponenteRectangulo(g, color, x, y);
        }
        if (combofigura.getSelectedItem().toString().equals("Rectangulo")) {

            pintarComponenteRectangulo(g, color, x, y);
        }
        if (combofigura.getSelectedItem().toString().equals("Triangulo")) {

            pintarComponenteTriangulo(g, color);
        }

        // Aqui ira el if del triangulo...
    }

    public void pintarComponenteRectangulo(Graphics g, Color c, int x, int y) {
        //super.paintComponents(g);
        g.setColor(c);
        g.fillRect(200, 280, x, y);
    }

    public void pintarComponenteCirculo(Graphics g, Color c, int x, int y) {
        //super.paintComponents(g);
        g.setColor(c);
        g.fillOval(200, 280, x, y);
    }

    public void pintarComponenteTriangulo(Graphics g, Color c) {
        int vecx[] = {320, 180, 250};
        int vecy[] = {300, 300, 200};

        g.setColor(c);
        g.fillPolygon(vecx, vecy, 3);

    }

}
