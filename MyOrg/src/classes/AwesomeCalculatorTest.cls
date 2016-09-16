@IsTest
public class AwesomeCalculatorTest 
{
@IsTest
    static void callOut()
    {
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        double x=1.0;
        double y=2.0;
        double result=AwesomeCalculator.add(x, y);
        System.assertEquals(3.0, result);
    }
}