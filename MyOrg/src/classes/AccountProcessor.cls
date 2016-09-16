public class AccountProcessor 
{
@future
    public static void countContacts(set<id> setId)
    {
        List <Account> lstAccount = [SELECT id,Number_of_Contacts__c ,(SELECT id from Contacts) from Account where id in:setId];
        for(Account ac:lstAccount)
        {
            List<Contact> lstCont= ac.contacts;
            ac.Number_of_Contacts__c= lstCont.size();
        }
        update lstAccount;
    }
}