package LevaluadorBoleano;

import static java.lang.System.err;

public class EvaluadorBoleano {
    public boolean eval(String expresion) {
        err.println("expresion = " + expresion);
        expresion = expresion.trim();
        if( expresion.startsWith("(")) {
            expresion = expresion.substring(1).trim();
        }
        if( expresion.endsWith((")"))) {
            expresion = expresion.substring(0, expresion.length()-1).trim();
        }
        int indexOfY = expresion.lastIndexOf(" y ");
        if( indexOfY > 0 ) {
            return eval( expresion.substring(0,indexOfY) ) && eval( expresion.substring(indexOfY+3));

        }
        int indexOfO = expresion.indexOf(" o ");
        if( indexOfO > 0 ) {
            return eval( expresion.substring(0,indexOfO) ) || eval( expresion.substring(indexOfO+3));

        }

        return "verdadero".equals(expresion);
    }
}
