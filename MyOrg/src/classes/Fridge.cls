public class Fridge 
{
   private String modelNumber;
   private Integer numberInStock;
   
    public void setModelNumber(String modelNo)
    {
    	modelNumber = modelNo;
    }
    public String getModelNumber()
    {
    	 return 'F'+modelNumber;
    }
    
    public void setNumberInStock(Integer stock)
    {
    	numberInStock = stock;
    }
    public Integer getNumberInStock()
    {
    	 return numberInStock;
    }
    
   /* public Fridge()
    {
        modelNumber = 'xx-xx';
        numberInStock= 0;
    }
    
    public Fridge(String mn, Integer ns)
    {
        modelNumber = mn;
        numberInStock= ns;
    }*/
    public void show()
    {
        System.debug('Model:'+' '+modelNumber+'\t'+'Available stock '+numberInStock);
    }
    /*public void updateStock(Integer justSold)
    {
    	numberInStock = numberInStock - justSold;
        System.debug('Model:'+' '+modelNumber+'\t'+'stock remain'+numberInStock);
    }*/
}