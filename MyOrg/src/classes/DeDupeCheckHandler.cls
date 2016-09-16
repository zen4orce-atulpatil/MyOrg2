public class DeDupeCheckHandler 
{
	public static void checkDuplicateInsert(List<Lead> lead)
    {
        List<Lead> lst= new List<Lead>([SELECT Email,Phone FROM Lead]);
         Map<String,Lead> mapLead= new Map<String,Lead>();
        for(Lead ld:lst)
        {
            String key=ld.Email+ld.Phone;
			mapLead.put(key, ld) ;           
        }
        
        for(Lead ld1:lead)
        {
            if(ld1.Email != null && ld1.Phone != null)
            {
                String newKey = ld1.Email+ld1.Phone;
                if(mapLead.containsKey(newKey))
                {
                     ld1.Email.addError('Email already exist');
                    ld1.Phone.addError('phone already exist');
                         System.debug('l2');
                }
            }
        }
       // Map<String,Lead> mapLead= new Map<String,Lead>([SELECT Email,Phone FROM Lead]);
        
     //
       /* for(Lead ld:lead)
        {
             System.debug('in 1st for');
           		if(ld.Email != null) 
                {
                    
                            mapLead.put(ld.Email, ld);
                            System.debug('put map');
                        
                }
            	if(mapLead.containsKey(ld.Email))
                    {
                        ld.Email.addError('Email already exist');
                         System.debug('l2');
                    }
        }*/
       
        //
        //
        /*for(Lead ld1:[SELECT Email,Phone FROM Lead WHERE Email IN: mapLead.keySet()])
        {
            Lead templd = mapLead.get(ld1.Email);
            templd.Email.addError('A lead with this email address already exists.');
        }*/
        
       /* for(Lead ld2:lead)
        {
            if(mapLead.containsKey(ld2.Email))
                    {
                        ld2.Email.addError('Email already exist');
                         System.debug('l2');
                    }
        }*/
    }
    
   	
    
}