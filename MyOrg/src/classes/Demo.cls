public class Demo 
{
    public enum Season {SUMMER,WINTER,SPRING,FALL}
	public void show()
    {
       Boolean isIt = true;
       String x ='you are '+ (isIt ? 'great':'small');
       System.debug(x);
        Datetime myDateTime = Datetime.now();
        Date tday = Date.today();
        System.debug('date & time is:'+myDateTime);
        System.debug('date is'+tday);
        
        
        Integer[] myList = new List<Integer>{10,20,30};
        myList[0]= 15;
        myList.set(1,30);
        System.debug(myList);
        
        /* DO-WHILE LOOP
         Integer count=1;
        do{
            System.debug(count);
            count++;
        }while(count<11);*/
            
        /*WHILE LOOP
        Integer count=1;
        while(count<11)
        {
            System.debug(count);
            count++;
        }*/
        /* enhance for loop
        Integer [] myIns= new Integer[]{10,20,30,40,50,60};
            for(Integer i:myIns)
            {
                System.debug(i);
            }*/
        Set<String> s= new Set<String>{'a','b','c'};
            s.add('c');
        	s.add('d');
        System.debug(s);
        if(s.contains('b'))
        {
            System.debug('it contain "b" and "size"'+s.size());
        }
        
    }
}