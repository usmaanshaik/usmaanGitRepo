public class AccountsController {
    @AuraEnabled
    public static list<Account> getAccounts(){
        return [select id,name,AccountNumber,Site,Phone from Account ORDER BY createddate ASC limit 10];
    }
}