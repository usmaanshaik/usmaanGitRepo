public class ApttusSyncProposalSupport {
     public static void syncToOpportunity(Id accId){
         list<Account> accList =[select id,Name,accountNumber,Opportunity__c from account where id=:accId];
         if(accList.size()>0){
             if(accList[0].Opportunity__c == null){
                 System.debug('return debug Start');
                 return;
                 System.debug('return debug End');
             }
             ID opptyPricebookId = getOpportunityPriceBookId(accList[0].Opportunity__c);
             System.debug('Test 1');
            if(opptyPricebookId == null){
                opptyPricebookId = getStandardPriceBookId();
            }
            deleteLineItemsForOpportunity(accList[0].Opportunity__c);
            List<contact> lineItems = getLineItemsForQuoteOrProposal(accList[0].Id);
            if(lineItems.isEmpty()){
                return;
            }
            List<OpportunityLineItem> oppLineItems = new List<OpportunityLineItem>();
            for(contact lineItemSO : lineItems){
                if (lineitemSO.usmandfl__Product__c == null ) {
                    continue;
                }
                OpportunityLineItem oppLineItemSO = createOpportunityLineItemSO(accList[0].Opportunity__c,
                                                                                opptyPricebookId,
                                                                                lineitemSO);
                oppLineItems.add(oppLineItemSO);                                            
            }
         }
            
     }
     private static OpportunityLineItem createOpportunityLineItemSO(ID opptyId,
                                                                   ID opptyPricebookId, 
                                                                   contact lineItemSO){
     
        ID priceBookEntryId;
        // create a new opportunity line item
        OpportunityLineItem oppLineItemSO = new OpportunityLineItem(OpportunityId = opptyId);
        //if(lineItemSO.Cldly_Revenue_Share__c != null){
          //  oppLineItemSO.Cldly_Revenue_Share__c = lineItemSO.Cldly_Revenue_Share__c;
        //}
        oppLineItemSO.Quantity =10.2;
           priceBookEntryId = getPriceBookEntryForProduct(lineItemSO.usmandfl__Product__c,opptyPricebookId);
        
        oppLineItemSO.PricebookEntryId = priceBookEntryId;        
        return oppLineItemSO;
                                           
     }  
       public static ID getPriceBookEntryForProduct(ID productId, ID pricebookId){
        List<PricebookEntry> pricebookEntries = [select Id,Name,
                                                    IsActive,
                                                    Pricebook2Id,
                                                    Product2Id,
                                                    ProductCode,
                                                    UnitPrice,
                                                    UseStandardPrice
                                                from PricebookEntry
                                                where Product2Id = :productId and
                                                    Pricebook2Id = :pricebookId
                                                limit 1];
                                                
        PricebookEntry pbEntry = new PricebookEntry();
        if(pricebookEntries.isEmpty()){
            pbEntry.Pricebook2Id = pricebookId;
            pbEntry.Product2Id = productId;
            pbEntry.unitPrice = 0;
            pbEntry.IsActive = true;
            insert pbEntry;
        }
        return (!pricebookEntries.isEmpty() ? pricebookEntries[0].Id : pbEntry.Id);
    }
    
     
     public static ID getOpportunityPriceBookId(ID opptyId) {
        // get the opportunity price book id
        List<Opportunity> opportunities = [SELECT Pricebook2Id
                                           FROM Opportunity
                                           WHERE Id = :opptyId 
                                           LIMIT 1];
        return (!opportunities.isEmpty() ? opportunities[0].Pricebook2Id : null);                                       
     }
     
     private static void deleteLineItemsForOpportunity(ID opptyId) {
        for (List<OpportunityLineItem> items : [SELECT Id        
                                                FROM OpportunityLineItem
                                                WHERE OpportunityId = :opptyId]) {
            Database.delete(items);
        }   
    }
     public static ID getStandardPriceBookId() {
        // get the standard price book id
        List<Pricebook2> books = [SELECT Id
                                  FROM Pricebook2
                                  WHERE IsStandard = TRUE 
                                  LIMIT 1];
                
        return (!books.isEmpty() ? books[0].Id : null);
    }
    public static List<contact> getLineItemsForQuoteOrProposal(ID accId){
        // get the proposal lineitems
        List<contact> lineItems = [ Select  ID,Name,LastName,FirstName 
                                                                     
                                                                    from contact
                                                                    where AccountId = :accId ];
        
        return lineitems;  
    }

}