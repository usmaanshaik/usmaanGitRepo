public with sharing class Emp1_Emp2_Ac {
 	public String ids{get;set;}
 	public Emp2__c con {get;set;}
 	
 	public Emp1_Emp2_Ac(){
 		ids=ApexPages.currentPage().getParameters().get('id');
 		con = [select id,name,H_no__c,State__c, MDEmp1__r.Emp_Name__c,MDEmp1__r.Email__c from emp2__C where Id =:ids];
 	}
}