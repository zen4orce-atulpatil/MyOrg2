global class LeadProcessor implements Database.Batchable<sObject>
{
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([SELECT FirstName,LastName,Email,Industry,Phone,LeadSource,Status from Lead]);
    }
	
    global void execute(Database.BatchableContext bc,List<Lead> scope)
    {
        List<Lead> lstLead = new List<Lead>();
        for(Lead ld:scope)
        {
            ld.LeadSource='Dreamforce';
            lstLead.add(ld);
            
            recordsProcessed = recordsProcessed + 1;
        }
        update lstLead;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        System.debug(recordsProcessed + ' records processed. Shazam!');

        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
    }
}