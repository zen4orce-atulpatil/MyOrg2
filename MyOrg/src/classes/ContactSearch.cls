public class ContactSearch 
{
 public static List<Contact> searchForContacts(String s1,String s2)
 {
     List<Contact> cnts=[SELECT ID, LastName, MailingPostalCode FROM Contact WHERE LastName=:s1 AND MailingPostalCode=:s2]; 
     System.debug(cnts);
     return cnts;
 }
}