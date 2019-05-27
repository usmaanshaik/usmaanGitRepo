public class childToParentRelation{
    public list<Contact> conList {get;set;}
    public list<Account> accList{get;set;}
    public childToParentRelation(){
     conList = new list<Contact>();
     conList=[select id,LastName,Account.Name from contact limit 10];
     accList = [select id,name,(select id,Lastname from Account.contacts) from account limit 10];
    }
  }