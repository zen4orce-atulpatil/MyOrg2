trigger DeDupeCheck on Lead (before insert,after insert,before update) 
{
	if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            DeDupeCheckHandler.checkDuplicateInsert(Trigger.new);
        }
        if(trigger.isUpdate)
        {
            
        }
    }
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            AddTaskOnLeadHandler.addTaskAfterInsertLead(Trigger.new);
            CloningLeadHandler.createCloneLead(Trigger.new);
        }
    }
    
}