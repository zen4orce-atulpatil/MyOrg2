@isTest
public class LeadProcessorTest 
{
    @testSetup
    static void setup() 
    {
		List<Lead> leads = new List<Lead>();
    	for (Integer i=0;i<200;i++) 
        {
            leads.add(new Lead(LastName='Lead '+i,Status='Open', Company='IT'));
        }
        insert leads;
        
    }
    static testmethod void test() 
    {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        
    }
}