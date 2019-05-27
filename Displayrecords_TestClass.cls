@isTest
Private class Displayrecords_TestClass {
    static TestMethod void TcDisplay(){
        Displayrecords dis = new Displayrecords();
        Emp1__C emp = new Emp1__C();
        emp.usmandfl__Emp_Name__c ='Test Abc';  
        insert emp;
        ApexPages.currentPage().getParameters().put('Id',emp.id);
        dis.deleteNull();
        dis.save();
        dis.Del();
        dis.Edit();
        dis.search();
        dis.newS();
        emp.usmandfl__Emp_Name__c ='';  
        update emp;
         dis.deleteNull();

        
    }

}