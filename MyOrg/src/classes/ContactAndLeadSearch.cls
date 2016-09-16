public class ContactAndLeadSearch 
{
public static List<List< SObject>> searchContactsAndLeads(String s)
{
    List<List<sObject>> searchList =[FIND 'Smith' IN ALL FIELDS RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName) ];
    System.debug(searchList);
    return searchList;
    
}
}