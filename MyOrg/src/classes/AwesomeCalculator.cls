public class AwesomeCalculator 
{
	public static double add(double x, double y)
    {
        calculatorServices.CalculatorImplPort cal = new calculatorServices.CalculatorImplPort();
        return cal.doAdd(x, y);
    }
}