/*@isTest
public class BatchApexprogramEx_TC {
    static testMethod void myUnitTest(){
    	list<Account> accList = new list<Account>();
    	Account acc = new Account();
    	acc.Name='Test';
    	acc.AccountNumber = '2121';
    	insert acc;
    	accList.add(acc);
    	
    	string qry='select id from account limit 10';
    	BatchApexProgramEx_Ac batch = new BatchApexProgramEx_Ac();
    	DataBase.executeBatch(batch,200);
    	batch.execute(null,accList);
    }
}*/
@isTest
public class BatchApexExapleTest{
     static testMethod void myUnitTest(){         
         list<Account> accList = new list<Account>();
         for(Integer i=1;i<=10;i++){
             Account ac = new Account();
             ac.Name = 'TestAccount'+i;
             accList.add(ac);
         }
         insert accList;         
         BatchApexExample b = new BatchApexExample();
         dataBase.executeBatch(b);         
     }
}