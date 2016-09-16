@isTest
public class addTaskAfterInsertLeadTestClass 
{
	static void init()
    {
        
    }
    
    static testMethod void TestAddTaskOnLead()
    {
        init();
        Test.startTest();
        
        Lead l1 =new Lead(LastName='kishor' , Company='zen4orce',Status='Open - Not Contacted',Email='kish@gmail.com',Phone='(231)296-3287');
        insert l1;
            System.debug('lead record'+l1);
        List<Lead> testLead = new List<Lead>([SELECT Id FROM Lead]); 
        List<Task> taskList = new List<Task>();
           // String idToCompare;
        for(Lead ld:testLead)
        {
           // idToCompare=ld.Id;
            Task t= new Task();
            t.WhoId = ld.Id;
            t.Priority='High';
            t.Status='Not Started';
            t.OwnerId=ld.OwnerId;
            taskList.add(t);
        }
        insert taskList;
            //Task tsk=[SELECT WhoId,Status FROM Task WHERE WhoId =:l1.Id LIMIT 1];
            Map<String,Task> tskmap= new Map<String,Task>();
            //System.debug('task record'+tsk);
            //
            //System.assertEquals(tsk.WhoId, l1.Id);
			         
        
        Test.stopTest();
    }
}