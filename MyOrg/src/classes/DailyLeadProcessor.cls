global class DailyLeadProcessor implements Schedulable
{
 global void execute (SchedulableContext ctx)
 {
     List<Lead> leadList= [SELECT FirstName,LastName,Email,Industry,Phone,LeadSource,Status from Lead where LeadSource =''];
     List<Lead>ldst= new List<Lead>();
     for(Lead ld:leadList)
     {
         ld.LeadSource='Dreamforce';
         ldst.add(ld);
     }
     update ldst;
 }
}