@isTest
public class CloningLeadHandlerTestClass 
{
    static void init()
    {
        
    }
 	static testMethod void CloneLead() 
    {
        init();
        Test.startTest();
        Lead ld=new Lead(LastName='kapoor',Company='Kapoor & sons',Status='Open - Not Contacted', Email='kapoor@abc.com'); 
        try{
            insert ld;
            List<Lead> fetchLead= new List<Lead>([SELECT LastName,Company,Status,Email FROM Lead]);
            System.debug('Test class fetch lead list'+fetchLead);
            //System.assertEquals(2, fetchLead.size());
            System.assertEquals(ld.LastName+'cloned', fetchLead[1].LastName);
        }catch(Exception e)
        {
            System.debug(e);
        }
        Test.stopTest();
    }
}