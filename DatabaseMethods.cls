public class DatabaseMethods {
    public void DatabaseMthds(){
        list<usmandfl__Emp2__c> emp2LIst  = new list<usmandfl__Emp2__c>();
       usmandfl__Emp1__c  emp1 = new usmandfl__Emp1__c();
        emp1.usmandfl__Emp_Name__c='Test AbcXyz';
        insert emp1;
        System.debug('@@@===>Emp1 new record===>'+emp1);
        usmandfl__Emp2__c emp2 = new usmandfl__Emp2__c();
        emp2.usmandfl__H_no__c ='12-175/1/1';
          emp2.usmandfl__Street__c ='Salrg';
            emp2.usmandfl__District__c='Nalgnd';
            emp2.usmandfl__MDEmp1__c=emp1.id;
            emp2List.add(emp2);
        Database.SaveResult[] srlist = Database.insert(emp2List, false);
        for( Database.SaveResult sr : srlist){
            if(sr.isSuccess()){
                System.debug('@@===>Inserted record id'+ sr);
            }
            else{
                for(Database.Error err: sr.getErrors()){
                    System.debug('@@===>'+ err.getStatusCode()+'@@@'+err.getMessage()); 
                }
            }
        }
        
        
        
    }
}