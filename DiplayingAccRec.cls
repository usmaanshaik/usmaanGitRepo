public class DiplayingAccRec {
    public list<Account> accList{get;set;}
    public DiplayingAccRec(){
        accList = [select id,name,AccountNumber,Site,Phone from Account where name!=null AND AccountNumber !=null AND Site!=NULL AND Phone !=NULL limit 10 ];
    }
}