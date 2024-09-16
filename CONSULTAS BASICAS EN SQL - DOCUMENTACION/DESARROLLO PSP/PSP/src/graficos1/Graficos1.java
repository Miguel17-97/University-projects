/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package graficos1;

import java.text.DecimalFormat;
import javax.swing.JOptionPane;


public class Graficos1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        DecimalFormat df = new DecimalFormat("#.00");
        int datos [] = new int [50];
        double media = 0, desviacion = 0, sumatoria = 0, varianza = 0;
        String info = "";
        
        JOptionPane.showMessageDialog(null, "------------------------------Tiempo empleado para llegar desde casa a la Universidad------------------------------");
        
        for (int i = 0; i < datos.length; i++) {
            
            datos [i] = (int) (Math.random() * 60 + 5);
        }
        
        for (int j = 0; j < datos.length; j++) {
            
            info += datos[j];
            info += "  ";
            
            if (j % 10 == 0)
            {
                info += "\n";
            }
            
        }
        
        JOptionPane.showMessageDialog(null, info);
        
        // Calculamos la media
        
        for (int k = 0; k < datos.length; k++) {
            
            media += (double) datos[k]; 
        }
        
        media /= (datos.length - 1);
        
        // Calculamos la desviación
        
        for (int l = 0; l < datos.length; l++) {
            
            sumatoria = Math.pow(datos[l] - media, 2);
            varianza += sumatoria;
        }
        varianza /= (datos.length - 2);
        desviacion = Math.sqrt(varianza);
        
        JOptionPane.showMessageDialog(null, "Datos estadísticos: \n \n Desviacion Estandar: "  + df.format(desviacion) + " \n Media Aritmetica: " + df.format(media));
    }
    
    
    
}
