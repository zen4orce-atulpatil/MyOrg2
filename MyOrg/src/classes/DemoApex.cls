public class DemoApex 
{
    public static void accountCreate()
    {
		sObject s= new Account(Name='atul');
    	Account a=(Account)s;
    	String name= a.Name;
        //a.Name='atul';    this is not allow for generic object
    	System.debug(name);
    }
    
     public static void accountCreate1()
     {
         Account a=new Account();
         a.Name='Atul';		//this allow here
         
         System.debug(a);
     }
    public static void fetchAccountWthContact()
    {
        Account[] ac= [SELECT Id,Name,(SELECT FirstName, LastName FROM Contacts) FROM Account WHERE Id ='0012800000mAPnh'];
        Contact[] ct= ac[0].Contacts;
        System.debug('Name of first assosiate contact'+' '+ct[0].FirstName+' '+ct[0].LastName);
       
    }
    public static void fetchAccountWthContact2()
    {
        List<List<sObject>> searchList = [FIND 'Wingo OR SFDC' IN ALL FIELDS 
                   RETURNING Account(Name),Contact(FirstName,LastName,Department)];
					Account[] searchAccounts = (Account[])searchList[0];
					Contact[] searchContacts = (Contact[])searchList[1];

						System.debug('Found the following accounts.');
						for (Account a : searchAccounts) 
                        {
    						System.debug(a.Name);
						}

						System.debug('Found the following contacts.');
						for (Contact c : searchContacts) 
                        {
    						System.debug(c.LastName + ', ' + c.FirstName);
						}
    }
}