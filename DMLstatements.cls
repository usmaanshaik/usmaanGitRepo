public class DMLstatements {
    public list<usmandfl__Emp2__c> emp2List{get;set;}  
    public DMLstatements(){
       emp2List = [select id,name,usmandfl__State__c from usmandfl__Emp2__c where createddate = today];
        System.debug('emp2LIst values====>'+ emp2List.get(0));     
    }	
    public void updEmp2List(){
        usmandfl__Emp1__c emp1 = new usmandfl__Emp1__c();
         emp1.usmandfl__Emp_Name__c='Test Abc';
        insert emp1;
        System.debug('@@ emp1 Record'+ emp1.id+'@@'+emp1.usmandfl__Emp_Name__c);   
        list<usmandfl__Emp2__c> updEmp2 = new list<usmandfl__Emp2__c>();
        for(usmandfl__Emp2__c e : emp2List){
            if(e.usmandfl__State__c=='T.S'){
                e.usmandfl__State__c='Telangana';
                updEmp2.add(e);
            }
        }
        update updEmp2;
        System.debug('Emp2 Updated record and Values are===>'+updEmp2);
        usmandfl__Emp2__c AddEmp2 = new usmandfl__Emp2__c();
        AddEmp2.usmandfl__State__c ='T.S';
        AddEmp2.usmandfl__MDEmp1__c = emp1.id;
        insert AddEmp2;
        System.debug('@New emp2 record values'+ AddEmp2.id);
        //AddEmp2.usmandfl__MDEmp1__c
    }
}