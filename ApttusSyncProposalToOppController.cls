public class ApttusSyncProposalToOppController {
    public pageReference doSyncToOpportunity(){
        pageReference page;
        //try{
            String accId = system.currentpagereference().getparameters().get('id');
            System.debug('account id'+accId);
            if(accId != null && accId != ''){   
                ApttusSyncProposalSupport.syncToOpportunity(accId);
            }
             page = new pageReference('/'+accId);
            return page;
        /*}
        catch(Exception ex){
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: ' + ex+'test error');  
            ApexPages.addMessage(myMsg);
            return null;
        }*/
        page.setRedirect(true);
        return page;
    }
}