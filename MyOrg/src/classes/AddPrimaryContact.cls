public class AddPrimaryContact implements Queueable  
{
    private Contact Cont = new Contact();
    private String state;
		public AddPrimaryContact(Contact Cont, String state)
        {
            this.Cont= cont;
            this.state=state;
        }
     public void execute(QueueableContext context) 
     {
         List<Account> acclist=[SELECT ID, Name ,(Select id,FirstName,LastName from contacts )FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
     	List<Contact> contList=new List<Contact>(); 
         for(Account acc:acclist)
        {
            Contact c= Cont.clone(false,false,false,false);
            c.AccountId=acc.id;
            contList.add(c);
        }
         if(contList.size() >0 )
         {
             Insert contList;
         }
     }
}