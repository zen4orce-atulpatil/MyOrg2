public class Toaster implements KitchenUtility
{
 private String modelNumber;
 private Integer numberInStock;   
    
    
    public void setModelNumber(String modelNo)
    {
    	modelNumber = modelNo;
    }
    public String getModelNumber()
    {
    	 return 'T'+modelNumber;
    }
    
    public void setNumberInStock(Integer stock)
    {
    	numberInStock = stock;
    }
    public Integer getNumberInStock()
    {
    	 return numberInStock;
    }
    
    public void show()
    {
        System.debug('Model:'+' '+modelNumber+'\t'+'Available stock '+numberInStock);
    }
}