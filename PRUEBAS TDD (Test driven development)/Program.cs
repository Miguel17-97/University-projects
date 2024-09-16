
public interface ICalculadora
{
    int Suma(int num1, int num2);
}
public class Calculadora : ICalculadora
{
    public int Suma(int num1, int num2)
    {
        if (num1 < 0)
            throw new ArgumentOutOfRangeException("num1");
        if (num2 < 0)
            throw new ArgumentOutOfRangeException("num2");
        if (num1 >= int.MaxValue)
            throw new ArgumentOutOfRangeException("num1");
        if (num2 >= int.MaxValue)
            throw new ArgumentOutOfRangeException("num2");
        try
        {
            var result = num1 + num2;
            if (result < 0)
                throw new ArithmeticException("La suma se sale del máximo!");
            else
            return result;
        }
        catch(ArithmeticException ex)
        {
            throw new ArithmeticException("La suma se sale del máximo!",ex);
        }
    }
}

//Console.WriteLine("Ha funcionado todo el código primo!");

