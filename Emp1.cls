public class Emp1 {
    
    public list<usmandfl__Emp1__c> emp{get;set;}
    
    public void display(){ 
        
        emp=[select id,usmandfl__Emp_Name__c,	usmandfl__Email__c,usmandfl__Phone__c,	usmandfl__Gendar__c from usmandfl__Emp1__c];
    }
    
    

}