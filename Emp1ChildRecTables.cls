public with sharing class Emp1ChildRecTables {
	public list<Emp2__c> emp2List{get;set;}
	public String ids{get;set;}
	public Emp1__C emp1List{get;set;}
	public Emp1ChildRecTables(){
		ids=ApexPages.currentPage().getParameters().get('id');
		emp1List=[select id,name,Emp_Name__c,Email__c,Gendar__c ,Phone__c  from Emp1__C where id=:ids];
		emp2List =[select id,name,H_no__c,Street__c,State__c,usmandfl__MDEmp1__r.usmandfl__Emp_Name__c ,
		usmandfl__MDEmp1__r.usmandfl__Email__c ,usmandfl__MDEmp1__r.usmandfl__Gendar__c ,
		usmandfl__MDEmp1__r.usmandfl__Phone__c from Emp2__c where MDEmp1__r.Id =: ids  ];
	}
    
}