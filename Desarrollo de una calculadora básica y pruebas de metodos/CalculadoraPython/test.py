import unittest
from Calculadora import suma
from Calculadora import resta
from Calculadora import multiplicacion
from Calculadora import division

class testSuma (unittest.TestCase):
    def test_suma(self):
        self.assertEqual(suma(2,3), 5)
        self.assertEqual(suma(a = None, b = None), 0)

class testResta (unittest.TestCase):
    def test_resta(self):
        self.assertEqual(resta(3,2), 1)
        self.assertEqual(resta(a = None, b = None), 0)

class testMult (unittest.TestCase):
    def test_mult(self):
        self.assertEqual(multiplicacion(3,2), 6)
        self.assertEqual(multiplicacion(a = None, b = None), 0)

class testDiv (unittest.TestCase):
    def test_div(self):
        self.assertEqual(division(3,2), 2)
        self.assertEqual(division(a = None, b = None), 0)

if __name__ == '__main__':
    unittest.main()