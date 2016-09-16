public class CloningLeadHandler 
{
    public static void createCloneLead(List<Lead> LeadList)
    {
            List<Lead> lstLead = new List<Lead>([SELECT LastName,Company,Email,Phone,Status FROM Lead where id=:trigger.newMap.keySet()]);
        System.debug('before clone'+lstLead);
        	List<Lead> cloneLeadList = new List<Lead>();
        	//List<Lead> updcloneLeadList = new List<Lead>();
        for(Lead ld:lstLead)
        {
            if(ld.Status=='Open - Not Contacted')
            {
                 Lead cloneld= new Lead();
           		 cloneld =ld.clone(false, true, false, false);
                cloneld.LastName = ld.LastName+'cloned';
                cloneld.Email= 'cl'+ld.Email;
            	cloneld.Company=ld.Company;
            	cloneld.Status ='Working - Contacted';
            	cloneLeadList.add(cloneld);
                System.debug('cloned list'+cloneLeadList);
            }
        }
        	insert cloneLeadList;
        
       /* for(Lead ld1:cloneLeadList)
        {
            	ld1.LastName = ld1.LastName+'cloned';
                ld1.Email= 'cl'+ld1.Email;
            	
            	ld1.Status ='Working - Contacted';
            updcloneLeadList.add(ld1);
        }*/
        	
    }
}