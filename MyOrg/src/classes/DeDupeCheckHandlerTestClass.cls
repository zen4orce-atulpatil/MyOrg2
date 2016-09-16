@isTest(seeAllData= false)
public class DeDupeCheckHandlerTestClass 
{	
  static void init()
    {
        
    }
    /** Test with an new lead **/
    static testMethod void testWithNewLead() 
    {
        init();
        Test.startTest();
        String key;
        	
        List<Lead> testLead = new List<Lead>([SELECT LastName,Company,Email,Phone FROM Lead]);
        Map<String,Lead> mplead= new Map<String,Lead>();
        for(Lead l:testLead)
        {
            key=l.Email+l.Phone;
           mplead.put(key, l);
        }
        
        try
        {
            Lead l1 =new Lead(LastName='kishor' , Company='zen4orce',Status='Open - Not Contacted',Email='kish@gmail.com',Phone='(231)296-3287');
        	
            if(!mplead.containsKey(l1.Email+l1.Phone))
            {
                 insert l1;
            }
        }catch(Exception e)
        	{
                System.debug('Exception occure new lead check');
            System.assert(true, 'Exception ' + e);
        	}
        
        
     
        Test.stopTest();
    }
	static testMethod void testWithExistingLead() 
    {
   	init();
   	Test.startTest();
      String key;
  	 //1st recod insert 
   	Lead l2=new Lead(LastName='kishor' , Company='zen4orce',Status='Open - Not Contacted',Email='kish@gmail.com',Phone='(231)296-3287');
   	insert l2;
      //fetch records
      List<Lead> testLead = new List<Lead>([SELECT LastName,Company,Email,Phone FROM Lead]);
      Map<String,Lead> mplead= new Map<String,Lead>();
      for(Lead l:testLead)
       {
            key=l.Email+l.Phone;
           mplead.put(key, l);
       } 
        try{//try to insert duplicate record
            Lead newld=new Lead(LastName='amey' , Company='zen4orce',Status='Open - Not Contacted',Email='kish@gmail.com',Phone='(231)296-3287');
            if(!mplead.containsKey(newld.Email+newld.Phone))
            {
                 insert newld;
            }
       
        }catch(Exception e)
        {
            System.debug('Exception occure duplicate lead check');
            System.assert(true, 'Exception ' + e);
        }
	
   	Test.stopTest();
	}
    
}