@isTest
public class ConverterTemperature 
{
// Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) 
    {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
     @isTest static void testWarmTemp() {
        Decimal celsius = ConverterTemperature.FahrenheitToCelsius(70);
        System.assertEquals(21.11,celsius);
    }
    
    @isTest static void testFreezingPoint() {
        Decimal celsius = ConverterTemperature.FahrenheitToCelsius(32);
        System.assertEquals(0,celsius);
    }

    @isTest static void testBoilingPoint() {
        Decimal celsius = ConverterTemperature.FahrenheitToCelsius(212);        
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    } 
    
    @isTest static void testNegativeTemp() {
        Decimal celsius = ConverterTemperature.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33,celsius);
    }
}