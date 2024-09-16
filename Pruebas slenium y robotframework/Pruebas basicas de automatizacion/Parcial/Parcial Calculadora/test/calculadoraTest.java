/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import LCalculadora.calculadora;
import junit.framework.TestCase;
import org.junit.Test;

public class calculadoraTest extends TestCase{
    private final calculadora calcular = new calculadora();

	@Test
	public void testSuma() {

		float resultado = calcular.sumar(7, 3);

		assertTrue(10 == resultado);
	}
        
        @Test
	public void testResta1() {

		float resultado = calcular.restar(8, 8);

		assertFalse(2 == resultado);
	}
        
        @Test
        public void testResta2() {

		float resultado = calcular.restar(8, 8);

		assertTrue(0 == resultado);
	}
        
        @Test
        public void testMultiplicacion() {

		float resultado = calcular.multiplicar(5, 3);

		assertEquals(15, resultado, 0);
	}
        
        public void testDivision1() {

		float resultado = calcular.dividir(1, 2);

		assertEquals(0.5, resultado, 0);
	}
        
        public void testDivision2() {

		float resultado = calcular.dividir(20, 2);

		assertEquals(10, resultado, 0);
	}
        
}

	