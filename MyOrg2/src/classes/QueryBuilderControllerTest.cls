@isTest
public class QueryBuilderControllerTest {

   
    Public static testmethod void PositiveTest(){
        List<Sobject> sobjList = new List<Sobject>();
       
       
        QueryBuilderController qbd =  new QueryBuilderController();
        	qbd.getObjectNames();
            qbd.selectedObject = 'Account';
        qbd.NoOfRec='500';
            qbd.getObjectFields();
        	qbd.selectedFields =  new List<SelectOption>();
        	qbd.selectedFields.add(new SelectOption('Id','Id'));
        	qbd.selectedFields.add(new SelectOption('Name','Name'));
        	qbd.getGenQuery();
        	qbd.getRecords();
        	
           
        system.assertEquals('500', qbd.NoOfRec);
        system.assertEquals('ASC', qbd.selectedValue);
        system.assertEquals('Select Id,Name from Account Order By  CreatedDate ASC LIMIT 500',qbd.strQuery);
        qbd.clearObjects();
    }
   
   Public static testmethod void objectNullTest(){
        List<Sobject> objList = new List<Sobject>();
       
       
        QueryBuilderController qbd =  new QueryBuilderController();
        	qbd.getObjectNames();
            qbd.selectedObject = 'Account';
        	qbd.NoOfRec='500';
       		qbd.getObjectFields();
        	qbd.selectedFields =  new List<SelectOption>();
        	
       		qbd.getGenQuery();
        	qbd.getRecords();
        	
        system.assertEquals('500', qbd.NoOfRec);
        system.assertEquals('Account', qbd.selectedObject);
       system.assertEquals('',qbd.strQuery);
        
    }

}