public class AddTaskOnLeadHandler 
{
	public static void addTaskAfterInsertLead(List<Lead> oldLeadList)
    {
        List<Task> tskLst= new List<Task>();
        for(Lead ld:oldLeadList)
        {
            Task t = new Task();
            t.WhoId = ld.Id;
            t.Priority='High';
            t.Status='Not Started';
            t.OwnerId=ld.OwnerId;
            
            tskLst.add(t);
        }
        
        
        insert tskLst;
        System.debug(tskLst);
    }
}