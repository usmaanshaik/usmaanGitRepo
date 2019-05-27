public class DisplayAccountRecController {
    public list<Account> accList{get;set;}
    public DisplayAccountRecController(){
        accList =[select id,AccountNumber,Name,site,Phone,Description from Account limit 10];
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'My dest---'+accList.size()));
    }
     public pageReference save(){
        return page.FiscalReportToExcelPage;
    }

}