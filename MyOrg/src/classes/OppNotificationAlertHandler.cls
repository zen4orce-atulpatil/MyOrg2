public class OppNotificationAlertHandler 
{
    
    public static void NotifyManagerAfterInsert(List<Opportunity> oppList)
    {
        Opportunity i=[select ownerid, id,Owner.manager.email,Owner.manager.name from opportunity where id=:trigger.newMap.keySet()];
        String[] toAddresses = new String[] {};
        	//query on template object
        EmailTemplate et=[Select Id from EmailTemplate where DeveloperName =:'Email_To_Manager'];

        //list of emails
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();

        //loop
        for(Opportunity op : oppList)
        {
            if(op.Amount >= 25000){
				String eadd = i.Owner.manager.email; 
            	toAddresses.add(eadd);
               
                Messaging.SingleEmailMessage Email = new Messaging.SingleEmailMessage();

                //set object Id
                Email.setTargetObjectId(i.Owner.manager.Id);

                //set template Id
                Email.setTemplateId(et.Id);
				
                Email.setToAddresses(toAddresses);
                //flag to false to stop inserting activity history
                Email.setSaveAsActivity(false);
				Email.setUseSignature(false);
  				Email.setBccSender(false);
                //add mail
                mailList.add(Email);

              
            }
        }

        //send mail
        Messaging.sendEmail(mailList);

       
    }
}