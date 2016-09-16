trigger OppNotificationAlert on Opportunity (after insert) 
{
	if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            OppNotificationAlertHandler.NotifyManagerAfterInsert(trigger.new);
        }
    }
}