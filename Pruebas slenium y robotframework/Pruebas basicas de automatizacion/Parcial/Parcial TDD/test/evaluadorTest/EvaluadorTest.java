package evaluadorTest;

import LevaluadorBoleano.EvaluadorBoleano;
import org.junit.Test;


public class EvaluadorTest {
    EvaluadorBoleano evaluador = new EvaluadorBoleano();
    @Test
    public void testTrue() {
        assert evaluador.eval("verdadero") == true;
    }
    @Test
    public void testFalse() {
        assert evaluador.eval("falso") == false;
    }
    @Test
    public void testParentesis() {
        assert evaluador.eval("(verdadero)") == true;        
        assert evaluador.eval("(false)") == false;
    }
    @Test
    public void testEspacios() {
        assert evaluador.eval(" verdadero  ");
        assert !evaluador.eval(" falso    ");
        assert evaluador.eval( " ( verdadero   )     ");
        assert !evaluador.eval( " ( falso   )     ");
    }
    @Test
    public void testY() {
        assert evaluador.eval("verdadero y verdadero");
        assert !evaluador.eval("verdadero y falso");
    }
    @Test
    public void testYConParentesis() {
        assert evaluador.eval("(verdadero ) y verdadero");
        assert !evaluador.eval("( falso ) y verdadero");
        assert evaluador.eval("(verdadero ) y ( verdadero )");
        assert !evaluador.eval("(verdadero ) y ( falso )");
    }
    @Test
    public void testO(){
        assert evaluador.eval("verdadero o verdadero");
        assert evaluador.eval("falso o verdadero");
    }
}