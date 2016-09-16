@isTest
public class DailyLeadProcessorTest 
{

     static testmethod void testScheduledJob() 
     {
     	List<Lead> leads = new List<Lead>();
    	for (Integer i=0;i<200;i++) 
        {
            leads.add(new Lead(LastName='Lead '+i,Status='Open', Company='IT'));
        }
        insert leads;
         
        Test.startTest();
         // Schedule the test job
         DailyLeadProcessor dlp= new DailyLeadProcessor();
         String sch = '20 30 8 10 2 ?';
        String jobId = System.schedule('DailyLeadProcessor', sch, dlp);         
        
        Test.stopTest();
     }
    
    
}