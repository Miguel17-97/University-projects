using CalculadoraTests;

namespace CalculadoraTests;

    [TestClass]
    public abstract class UnitTest1
    {
        [TestInitialize]
        public void Init()
        {
            Arrange();
            Act();
        }

        protected virtual void Arrange()
        {
        }

        protected abstract void Act();

        [TestCleanup]
        public void Cleanup()
        {
            Environment.Exit(0);
            //System.Windows.Threading.Dispatcher.CurrentDispatcher.InvokeShutdown();
        }
    }


[TestClass]
public abstract class WhenUsingTheCalculator : UnitTest1
{
    protected Calculadora? Calculator;

    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }
}

[TestClass]
public abstract class WhenAddingTwoNumbers : WhenUsingTheCalculator
{
    protected abstract int X { get; }
    protected abstract int Y { get; }
    protected int result;

    protected override void Act()
    {
        result = Calculator.Suma(X, Y);
    }
}

[TestClass]
public class WhenAddingTwoPositiveNumbers : WhenAddingTwoNumbers
{
    protected override int X { get { return 13; } }
    protected override int Y { get { return 45; } }

    [TestMethod]
    public void ItShouldReturnTheCorrectResult()
    {
        Assert.AreEqual(58, result);
    }
}

[TestClass]
public class WhenTheFirstNumberIsLessThanZero : UnitTest1
{
    // ARRANGE:
    protected int X { get { return -1; } }
    protected int Y { get { return 1; } }
    protected int result;
    protected Calculadora Calculator;

    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }

    // ACT:
    // No queremos actuar aquí porque queremos recuperar una excepción:
    protected override void Act() { }

    [TestMethod]
    [ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void ItShouldThrowAnOutOfRangeException()
    {
        // Actuamos dentro del Test
        result = Calculator.Suma(X, Y);
    }
}

public class WhenTheSecondNumberIsLessThanZero : UnitTest1
{
    // ARRANGE:
    protected int X { get { return 1; } }
    protected int Y { get { return -1; } }
    protected int result;
    protected Calculadora Calculator;
    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }

    // ACT:
    // No queremos actuar aquí porque queremos recuperar una excepción:
    protected override void Act() { }

    [TestMethod]
    [ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void ItShouldThrowAnOutOfRangeException()
    {
        result = Calculator.Suma(X, Y);
    }
}

[TestClass]
public class WhenTheFirstNumberIsOutOfRange : UnitTest1
{
    // ARRANGE:
    protected int X { get { return int.MaxValue; } }
    protected int Y { get { return 1; } }
    protected int result;
    protected Calculadora Calculator;

    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }

    // ACT:
    protected override void Act() { }

    [TestMethod]
    [ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void ItShouldThrowAnOutOfRangeException()
    {
        result = Calculator.Suma(X, Y);
    }
}

[TestClass]
public class WhenTheSecondNumberIsOutOfRange : UnitTest1
{
    // ARRANGE:
    protected int X { get { return 1; } }
    protected int Y { get { return int.MaxValue; } }
    protected int result;
    protected Calculadora Calculator;

    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }

    // ACT:
    protected override void Act() { }

    [TestMethod]
    [ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void ItShouldThrowAnOutOfRangeException()
    {
        result = Calculator.Suma(X, Y);
    }
}

[TestClass]
public class WhenTheTheSumIsOutOfRange : UnitTest1
{
    // ARRANGE:
    protected int X { get { return 2; } }
    protected int Y { get { return int.MaxValue - 1; } }
    protected int result;
    protected Calculadora Calculator;
    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }

    // ACT:
    protected override void Act() { }

    [TestMethod]
    [ExpectedException(typeof(ArithmeticException))]
    public void ItShouldThrowAnArithmeticException()
    {
        result = Calculator.Suma(X, Y);
    }
}

[TestClass]
public class WhenTheTheSumIsExactlyMaxValue : UnitTest1
{
    // ARRANGE:
    protected int X { get { return 1; } }
    protected int Y { get { return int.MaxValue - 1; } }
    protected int result;
    protected Calculadora Calculator;

    protected override void Arrange()
    {
        base.Arrange();
        Calculator = new Calculadora();
    }

    // ACT:
    protected override void Act() { }

    [TestMethod]
    public void ItShouldReturnMaxValue()
    {
        result = Calculator.Suma(X, Y);
        Assert.AreEqual(int.MaxValue, result);
    }
}

