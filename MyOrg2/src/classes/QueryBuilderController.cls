public class QueryBuilderController {
    
     public String selectedObject {get; set;}
    
    public String NoOfRec{get;set;}//no rec to display
    public List<SelectOption> fieldNames{get;set;}
    public String strQuery{get;set;}
   
   public List<String> lstStr = new List<String>();
    public List<String> Fieldlst{get;set;}
    public String selectedValue{get;set;}//ascending or descending
    
     public SelectOption[] selectedFields { get; set; }//selected fields from picklist
    
    
    
    public List<sObject> sobjList{get;set;}
    public QueryBuilderController()
    {
        selectedObject = '';
        selectedFields = new List<SelectOption>();
        //
        sobjList = new List<sObject>();
        Fieldlst = new List<String>();
        //default value for radio button
        selectedValue = 'ASC';
    }
    //get Object Name //
    public List<SelectOption> getObjectNames(){
        
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
        List<SelectOption> objNames = new List<SelectOption>();
        objNames.add(new SelectOption('','-- Select --'));
        for(Schema.SObjectType f : gd)
        {
           objNames.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getLabel()));
        }
        objNames.sort();
        return objNames;
    }
    
    //
    public List<SelectOption> getObjectFields() 
     {
         try{
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();//FETCH ALL OBJECTS AND STORE IT INTO schemaMap
            Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);//ObjectSchema IS TOKEN. SELECTED OBJECTS ADDS INTO ObjectSchema
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();//GET ALL FIELDS OF SELECTED OBJECT AND STORE IT INTO fieldMap
             fieldNames = new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
              //fieldMap.get(fieldName).getDescribe().getLabel();
            }
          System.debug('fieldNames'+fieldNames);
           
        }catch(Exception e)
        {	e.getMessage();
            System.debug('error message'+e.getMessage());
         
        }
          return fieldNames;
      }
     public void getGenQuery()
     { 
         sobjList = new List<sObject>();
        strQuery='';
         System.debug('selectedFields'+selectedObject);
         System.debug('selectedFields'+selectedFields);
         System.debug('selectedFields'+selectedFields.size());
         //strQuery = 'Select' ; 
         //strQuery = String.join(selectedFields, ',');
         try{
             
         if(!(selectedFields.isEmpty()))
         {
             System.debug('error block');
            
         
            for(SelectOption field : selectedFields)  
            {  
                //if(field.toLowerCase() != 'id' && field.toLowerCase() != '--None--')  
               // strQuery += ' '+ field.getValue() + ',' ;  
               lstStr.add(field.getValue());
                Fieldlst.add(field.getLabel());
                
            }            
            //strQuery += ' from ' + selectedObject +' Order By '+ selectedValue +' LIMIT '+NoOfRec;
            //strQuery = String.join(lstStr, ',');
         strQuery = 'Select ' +            
      String.join( lstStr, ',' ) +  
             ' from ' + selectedObject+ ' Order By '+' CreatedDate '+ selectedValue +' LIMIT '+NoOfRec ;
         System.debug('strQuery'+strQuery);
         }else{
             System.debug('Else block');
              ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Select Fields'));
         }
       }catch(Exception e)
       {	e.getMessage();
           System.debug('error message'+e.getMessage());
       }
     }
    //
    public void getRecords()
    {
        try{
            if(!(selectedFields.isEmpty()))
            {
            
             sobjList = Database.query(strQuery);
            System.debug('sobjList'+sobjList);
            
            }
            }catch(Exception e)
            {
                e.getMessage();
           System.debug('error message'+e.getMessage());
            }
       
        System.debug('clear selected list'+selectedFields);
    }
   public void clearObjects()
   {
       selectedObject = '';
        selectedFields.clear();
       	strQuery='';
       lstStr.clear();
       Fieldlst.clear();
       fieldNames.clear();
   }
}