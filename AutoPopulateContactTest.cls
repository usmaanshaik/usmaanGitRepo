@isTest
public class AutoPopulateContactTest {
    static testMethod void myUnitTest(){
    	Account acc = new Account();
    	acc.Name = 'Test Account';
    	acc.AccountNumber ='211212';
    	insert acc;
    	acc.Name= 'Test';
    	update acc;
    	
    	Contact con = new Contact();
    	con.LastName='TEst contact';
    	con.AccountId = acc.Id;
    	con.usmandfl__Auto_Check__c = true;
    	insert con;
    	con.LastName = 'TEst';
    	update con;
    }
}