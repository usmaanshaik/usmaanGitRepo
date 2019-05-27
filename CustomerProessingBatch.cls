global class CustomerProessingBatch implements Database.Batchable<sobject>, Schedulable{
//Add here your email address
global String [] email = new String[] {'usmaanali.shaik@gmail.com'};
  
//Start Method
global Database.Querylocator start (Database.BatchableContext BC) {
    //This is the Query which will determine the scope of Records and fetching the same
    //return Database.getQueryLocator('Select id, Name, APEX_Customer_Status__c, APEX_Customer_Decscription__c From APEX_Customer__c WHERE createdDate = today && APEX_Active__c = true');
	return Database.getQueryLocator('Select id, Name, usmandfl__Emp_Name__c, usmandfl__Email__c From usmandfl__Emp1__c WHERE createdDate = today');
   // System.debug('@@@====>>>');
}

//Execute method
global void execute (Database.BatchableContext BC, List<sobject> scope) {
    List<usmandfl__Emp1__c> customerList = new List<usmandfl__Emp1__c>();
    List<usmandfl__Emp1__c> updtaedCustomerList = new List<usmandfl__Emp1__c>();
    for (sObject objScope: scope) {
	    //type casting from generic sOject to APEX_Customer__c
        usmandfl__Emp1__c newObjScope = (usmandfl__Emp1__c)objScope ;
        newObjScope.usmandfl__Emp_Name__c = 'Usmanalishaik Via Batch Job';
        newObjScope.usmandfl__Email__c = 'Processed@gmail.com';
	    //Add records to the List
        updtaedCustomerList.add(newObjScope);
    } 	
    
    //Check if List is empty or not
    if (updtaedCustomerList != null && updtaedCustomerList.size()>0) {
		//Update the Records
        Database.update(updtaedCustomerList); 
        System.debug('List Size '+updtaedCustomerList.size());
    }
}

//Finish Method
global void finish(Database.BatchableContext BC){
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   
    //get the job Id
    AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
    System.debug('$$$ Jobid is'+BC.getJobId());
     
    //below code will send an email to User about the status
    mail.setToAddresses(email);   
    
    //Add here your email address
    mail.setReplyTo('usmaanali.shaik@gmail.com');
    mail.setSenderDisplayName('Apex Batch Processing Module');
    mail.setSubject('Batch Processing '+a.Status);
    mail.setPlainTextBody('The Batch Apex job processed  '+a.TotalJobItems+'batches with  '+a.NumberOfErrors+'failures'+'Job Item processed are'+a.JobItemsProcessed);
  
    Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
}   

//Scheduler Method to scedule the class
global void execute(SchedulableContext sc){
    CustomerProessingBatch conInstance = new CustomerProessingBatch();
    database.executebatch(conInstance,100);
}
}